#!/usr/bin/python

############################################################################
#  Proxylab testing framework
#  Main program
############################################################################

# Driver for testing Proxy Lab

import sys
import os
import socket
import getopt
import time
import subprocess
import threading
import datetime
import random
import signal

import console
import agents
import events
import files


def usage(name):
    print "Usage: %s -h [-S (0-4)] ([-p PROXY]|[-P HOST:PORT]) [-f FILE] [-l LOGFILE] [-d STRETCH]" % name
    print "  -h           Print this message"
    print "  -S (0-4))    Set level of strictness for message formatting requirements"
    print "  -d STRETCH   Set stretch value for all delays"
    print "  -p PROXY     Run specified proxy"
    print "  -P HOST:PORT Use proxy running on specified host and port"
    print "  -f FILE      Read commands from FILE"
    print "  -l FILE      Save results in FILE"
    sys.exit(0)

# Select random starting point.
# Make multiple of 8, since will typically use several ports
# and want to minimize chances of collisions with other instances of this program

def randomPort():
    multiple = 8
    minPort = 1024
    portCount = (32768-minPort)/multiple
    t = datetime.datetime.now()
    random.seed(t.microsecond + 1000*1000*t.second)
    return minPort + multiple * random.randint(0, portCount)
    

class Driver:

    nextPort = None
    host = "localhost"
    # Options (of type console.Option)
    verbose = None
    strict = None
    autoTrace = None
    stretch = None
    timeout = None

    console = None
    eventManager = None
    fileManager = None
    requestManager = None

    servers = {}
    # Is there an active proxy?
    haveProxy = False
    proxyProcess = None

    # Mapping from id to event.  Used to implement wait *
    activeEvents = {}

    def __init__(self, port = None):
        self.verbose = console.Option(False)
        self.strict = console.Option(0)
        self.autoTrace = console.Option(False)
        self.stretch = console.Option(100)
        self.timeout = console.Option(3000)

        self.console = console.Command()
        self.console.finishFunction = self.finish
        if port is None:
            self.nextPort = randomPort()
        else:
            self.nextPort = port
        self.host = socket.gethostname()
        self.eventManager = events.EventManager()
        self.fileManager = files.FileManager(printer = self.console)
        self.fileManager.purgeResponseFiles()
        self.requestManager = agents.RequestGenerator(self.eventManager, self.fileManager, self.console, strict = self.strict, verbose = self.verbose)
        self.servers = {}
        self.haveProxy = False
        self.proxyProcess = None
        self.activeEvents = {}

        self.console.addOption("strict", self.strict, "Set level of strictness on HTTP message formatting (0-4)")
        self.console.addOption("verbose", self.verbose, "Show details")
        self.console.addOption("stretch", self.stretch, "Multiply all delays by factor = stretch / 100")
        self.console.addOption("timeout", self.timeout, "Set default timeout for wait (in milliseconds)")
        self.console.addOption("autotrace", self.autoTrace, "Trace every request for which check fails")
        self.console.addCommand("serve", self.doServe,         "SID+",   "Set up servers.  (Server with SID starting with '-' is disabled.)")
        self.console.addCommand("request", self.doRequest,     "ID FILE SID",    "Initiate request named ID for FILE from server SID")
        self.console.addCommand("fetch", self.doFetch,     "ID FILE SID",    "Fetch FILE from server SID using request named ID")
        self.console.addCommand("respond", self.doRespond,     "ID+",   "Allow servers to return reponses to requests")
        self.console.addCommand("delay", self.doDelay,         "MS",              "Delay for MS milliseconds")
        self.console.addCommand("check", self.doCheck,         "ID [CODE]",     "Make sure request ID handled properly and generated expected CODE")
        self.console.addCommand("generate", self.doGenerate,   "FILE BYTES",      "Generate file (extension '.txt' or '.bin') with specified number of bytes")
        self.console.addCommand("delete", self.doDelete,       "FILE+",  "Delete specified files")
        self.console.addCommand("proxy", self.doProxy,         "[PATH] ARG*", "(Re)start proxy server (pass arguments to proxy)")
        self.console.addCommand("external", self.doExternalProxy,    "HOST:PORT", "Use external proxy")
        self.console.addCommand("trace", self.doTrace,         "ID+",   "Trace histories of requests")
        self.console.addCommand("signal", self.doSignal,       "[SIGNO]", "Send signal number SIGNO to process.  Default = 13 (SIGPIPE)")
        self.console.addCommand("disrupt", self.doDisrupt,     "(request|response) [SID]", "Schedule disruption of request or response by client [or server SID]")
        self.console.addCommand("wait", self.doWait,          "* | ID+", "Wait until all or listed pending requests, fetches, and responses have completed")

    def run(self, commandList = []):
        self.console.run(commandList)

    def handleSignal(self, signum, frame):
        self.console.outMsg("Forced Exit.  Shutting down proxy")
        if self.proxyProcess is not None:
            try:
                self.proxyProcess.terminate()
            except Exception:
                # Couldn't terminate.  Probably already dead
                pass
        self.console.outMsg("Exiting")
        sys.exit(1)


    def finish(self):
        allOK = self.requestManager.allOK
        if self.proxyProcess is not None:
            try:
                self.proxyProcess.terminate()
            except Exception:
                # Couldn't terminate.  Probably already dead
                pass
        self.eventManager.stop()  # Prevent queuing of any more events
        for s in self.servers.values():
            s.stop()
        for s in self.servers.values():
            allOK = allOK and s.waitForExit()
        self.eventManager.shutdown()
        return allOK

    def doServe(self, args):
        ok = True
        for id in args:
            if id in self.servers:
                self.console.errMsg("Duplicate server id '%s'" % id)
                ok = False
                continue
            port = self.nextPort
            self.nextPort += 1
            disabled = id[0] == '-'
            s = agents.Server(self.host, port, self.eventManager, self.fileManager, self.console,
                              id = id, strict = self.strict, verbose = self.verbose, disabled = disabled)
            if disabled:
                self.servers[id] = s
                self.console.outMsg("Disabled server %s set up at %s:%d" % (id, self.host, port))
            elif s.running:
                self.servers[id] = s
                self.console.outMsg("Server %s running at %s:%d" % (id, self.host, port))
            else:
                self.console.outMsg("Couldn't set up server %s" % id)
                ok = False
        
        return ok

    def doRequestOrFetch(self, args, isFetch):
        if len(args) != 3:
            command = "Fetch" if isFetch else "Request"
            self.console.errMsg("%s requires three arguments" % command)
            return False
        if not self.haveProxy:
            command = "Fetch" if isFetch else "Request"
            self.console.errMsg("%s requires there to be a running proxy" % command)
            return False
        rid = args[0]
        file = args[1]
        sid = args[2]
        if sid not in self.servers:
            self.console.errMsg("Invalid server name %s" % sid)
            return False
        server = self.servers[sid]
        try:
            event = self.eventManager.addRequestEvent(rid, server = sid, isFetch = isFetch)
        except events.EventException as ex:
            self.console.errMsg("Couldn't generate request event %s (%s)" % (rid, ex))
            return False
        url = server.generateURL(file)
        if self.verbose.getBoolean():
            self.console.outMsg("Attempting URL %s on server %s" % (url, sid))
        disrupting = self.requestManager.disruption == agents.Disruption.request
        if not disrupting:
            self.activeEvents[rid] = event
        success = self.requestManager.request(event, url, isFetch)
        return success != disrupting

    def doFetch(self, args):
        return self.doRequestOrFetch(args, True)

    def doRequest(self, args):
        return self.doRequestOrFetch(args, False)


    def doRespond(self, args):
        ok = True
        for rid in args:
            event = self.eventManager.findEvent(False, rid)
            if event is None:
                ok = False
                self.console.errMsg("Invalid request ID '%s'" % rid)
            else:
                self.activeEvents[rid] = event
                event.release()
                reason = "" if event.text == "" else " (%s)" % event.text 
                self.console.outMsg("Server responded to request %s with status %s%s" % (rid, event.tag, reason))
        return ok

    def doDelay(self, args):
        if len(args) != 1:
            self.console.errMsg("Delay command takes one argument")
            return False
        try:
            ms = float(args[0]) * self.stretch.getInteger()/100.0
        except:
            self.console.errMsg("Invalid delay '%s'" % args[0])
            return False
        self.eventManager.delay(ms)
        pending = self.eventManager.getPending()
        ok = len(pending) == 0
        if not ok:
            self.console.errMsg("Warning.  %d events still pending" % len(pending))
            for e in pending:
                self.console.outMsg("  " + str(e))
        return ok

    def doWait(self, args):
        ok = True
        if len(args) == 0:
            self.console.errMsg("wait requires list of IDs or '*'")
            return False
        if len(args) == 1 and args[0] == '*':
            checkEvents = self.activeEvents
            self.activeEvents = {}
        else:
            checkEvents = {}
            for id in args:
                e = self.eventManager.findEvent(True, id)
                if e is None:
                    ok = False
                    self.console.errMsg("Unknown id '%s'" % id)
                else:
                    checkEvents[id] = e
                    if id in self.activeEvents:
                        del self.activeEvents[id]
        if not ok:
            return False
        ms = int(self.timeout.getInteger() * self.stretch.getInteger()/100.0)
        pending = self.eventManager.waitActive(checkEvents, ms)
        ok = len(pending) == 0
        if not ok:
            self.console.errMsg("Warning.  %d events still pending after timeout of %d milliseconds" % (len(pending), ms))
            for e in pending:
                self.console.outMsg("  " + str(e))
        return ok

    def doCheck(self, args):
        if len(args) == 0 or len(args) > 2:
            self.console.errMsg("Check command requires 1-2 arguments")
            return False
        rid = args[0]
        checkTag = "ok"
        if len(args) > 1:
            try:
                code = int(args[1])
            except:
                self.console.errMsg("Invalid status code '%s'" % args[1])
                return False
            checkTag = self.requestManager.httpStatus.getTag(code)
        event = self.eventManager.findEvent(True, rid)
        if event is None:
            self.console.errMsg("Invalid request ID '%s'" % rid)
            return False
        if checkTag != event.tag:
            # see if can find matching request event
            reason = event.text
            if reason == "":
                requestEvent = self.eventManager.findEvent(False, rid)
                # See if can find useful information in corresponding request event
                if requestEvent is not None and event.tag == requestEvent.tag and requestEvent.text != "":
                    reason = requestEvent.text
            if reason == "" and event.tag == "requesting" and event.server in self.servers:
                # See received by server
                if self.servers[event.server].requestCount == 0:
                    reason = "Server did not receive any requests"
                elif self.servers[event.server].readingHeader:
                    reason = "Request header was not properly terminated"
            sreason = "" if reason == "" else (" (%s)" % reason)
            self.console.errMsg("Request %s generated status '%s'.  Expecting '%s'%s" % (rid, event.tag, checkTag, sreason))
            if self.autoTrace.getBoolean():
                self.trace(rid)
            return False
        self.console.outMsg("Request %s yielded expected status '%s'" % (rid, event.tag))
        return True

    def doGenerate(self, args):
        if len(args) != 2:
            self.console.errMsg("Generate command requires two arguments")
            return False
        fname = args[0]
        ssize = args[1]
        weight = 1
        while len(ssize) > 0 and ssize[-1].lower() in 'km':
            factor = 1000 if ssize[-1].lower() == 'k' else 1000*1000
            weight *= factor
            ssize = ssize[:-1]
        try:
            size = weight * int(ssize)
        except:
            self.console.errMsg("Invalid file size: %s" % args[1])
            return False
        path = self.fileManager.generateFile(fname, size)
        if path == "":
            return False
        if self.verbose.getBoolean():
            self.console.outMsg("Generated file '%s'" % path)
        return True
        
    def doDelete(self, args):
        ok = True
        for fname in args:
            ok = ok and self.fileManager.deleteFile(fname)
        return ok

    

    def doProxy(self, args):
        # Terminate existing proxy
        if self.proxyProcess is not None:
            self.proxyProcess.terminate()
            self.proxyProcess = None
            self.requestManager.proxy = None
            self.haveProxy = False
        if len(args) < 1:
            return True
        path = args[0]
        options = args[1:]
        port = self.nextPort
        sport = str(port)
        self.nextPort += 1
        try:
            self.proxyProcess = subprocess.Popen([path] + options + [sport],
                                                 stdout = subprocess.PIPE, stderr = subprocess.PIPE)
        except Exception as e:
            self.console.errMsg("Couldn't start proxy %s (%s)" % (path, str(e)))
            return False
        mout = files.FileMonitor(self.proxyProcess.stdout, self.console, id = "Proxy stdout")
        merr = files.FileMonitor(self.proxyProcess.stderr, self.console, id = "Proxy stderr")
        tout = threading.Thread(target = mout.run)
        tout.start()
        terr = threading.Thread(target = merr.run)
        terr.start()
        time.sleep(1)
        if self.proxyProcess.poll():
            self.console.errMsg("Proxy process terminated with return code %d" % self.proxyProcess.returncode)
            self.proxyProcess = None
            return False
        self.requestManager.proxy = (self.host, port)
        self.haveProxy = True
        self.console.outMsg("Proxy set up at %s:%d" % self.requestManager.proxy)
        return True

    def doExternalProxy(self, args):
        # Make use of external proxy
        # Terminate any existing proxy
        self.doProxy([])
        host = ""
        sport = ""
        if len(args) == 1:
            # Supplied as host:port
            fields = args[0].split(":")
            if len(fields) != 2:
                self.console.errMsg("Require proxy to be specified as 'host:port'")
                return False
            host = fields[0]
            sport = fields[1]
        elif len(args) == 2:
            # Supplied as host port
            host = args[0]
            sport = args[1]
        else:
            self.console.errMsg("Require proxy to be specified as 'host:port'")
            return False
        try:
            port = int(sport)
        except:
            self.console.errMsg("Must provide port as number")
            return False
        if port <= 0:
            self.console.errMsg("Invalid port '%d'" % port)
            return False
        self.requestManager.proxy = (host, port)
        self.haveProxy = True
        self.console.outMsg("Using proxy at %s:%d" % self.requestManager.proxy)
        return True

    def trace(self, rid):
        lineLength = 80
        requestEvent = self.eventManager.findEvent(True, rid)
        responseEvent = self.eventManager.findEvent(False, rid)
        if requestEvent is None:
            self.console.errMsg("Unknown request id '%s'" % rid)
            return False
        outString = "== Trace of request %s " % rid
        pad = max(0, lineLength - len(outString))
        self.console.outMsg(outString + ("=" * pad))

        self.console.outMsg("Initial request by client had header:")
        for line in requestEvent.sentHeaderLines:
            self.console.outMsg(files.showLine(line))

        self.console.outMsg('-' * lineLength)

        if responseEvent is None or responseEvent.receivedHeaderLines == []:
            self.console.outMsg("Request NOT received by server")
        else:
            self.console.outMsg("Message received by server had header:")
            for line in responseEvent.receivedHeaderLines:
                self.console.outMsg(files.showLine(line))

        self.console.outMsg('-' * lineLength)

        if responseEvent is None or responseEvent.sentHeaderLines == []:
            self.console.outMsg("Reponse NOT sent by server")                
        else:
            self.console.outMsg("Message sent by server had header:")
            for line in responseEvent.sentHeaderLines:
                self.console.outMsg(files.showLine(line))

        self.console.outMsg('-' * lineLength)

        if requestEvent.receivedHeaderLines == []:
            self.console.outMsg("Response NOT received by client")
        else:
            self.console.outMsg("Message received by client had header:")
            for line in requestEvent.receivedHeaderLines:
                self.console.outMsg(files.showLine(line))

        self.console.outMsg('-' * lineLength)

        if responseEvent is not None:
            statusString = "Response status: " + responseEvent.tag
            if responseEvent.text != "":
                statusString += " (" + responseEvent.text + ")"
            self.console.outMsg(statusString)
            if responseEvent.path != "":
                self.console.outMsg("  Source file in %s" % responseEvent.path)

        statusString = "Request status:  " + requestEvent.tag
        if requestEvent.text != "":
            statusString += " (" + requestEvent.text + ")"
        self.console.outMsg(statusString)
        if requestEvent.path != "":
            self.console.outMsg("  Result file in %s" % requestEvent.path)

        return True

    def doTrace(self, args):
        ok = True
        for rid in args:
            ok = ok and self.trace(rid)
        return ok

    def doSignal(self, args):
        if len(args) > 1:
            self.console.errMsg("Signal command takes at most one argument")
            return False
        signo = 13 # SIGPIPE
        if len(args) == 1:
            try:
                signo = int(args[0])
            except:
                self.console.errMsg("Invalid signal number '%s'" % args[0])
                return False
        if self.proxyProcess is None:
            self.console.errMsg("No proxy running")
            return False
        self.proxyProcess.send_signal(signo)
        return True

    def doDisrupt(self, args):
        disruptor = agents.Disruption()
        if len(args) < 1 or len(args) > 3:
            self.console.errMsg("Disrupt command takes 1-2 arguments")
            return False
        dname = args[0]
        dis = disruptor.parse(dname)
        if dis == disruptor.none:
            self.console.errMsg("Disruption type must be '%s' or '%s'"
                                % (disruptor.names[1], disruptor.names[2]))
            return False
        if len(args) == 2:
            sid = args[1]
            if sid not in self.servers:
                self.console.errMsg("Invalid server name %s" % sid)
                return False
            server = self.servers[sid]
            server.scheduleDisruption(dis)
        else:
            self.requestManager.scheduleDisruption(dis)
        return True

def run(name, args):
    strict = 0
    port = None
    proxyPath = None
    proxyName = None
    fname = None
    logFilePath = None
    stretch = None
    try:
        optlist, args = getopt.getopt(args, "hS:p:P:f:l:d:")
    except getopt.GetoptError as e:
        print "Command-line error (%s)" % str(e)
        usage(name)
    for opt, val in optlist:
        if opt == '-h':
            usage(name)
        if opt == '-S':
            try:
                strict = int(val)
            except:
                print "Invalid value of strictness '%s'" % val
                usage(name)
        elif opt == '-p':
            proxyPath = val
        elif opt == '-P':
            proxyName = val
        elif opt == '-f':
            fname = val
        elif opt == '-l':
            logFilePath = val
        elif opt == '-d':
            try:
                stretch = int(val)
            except:
                print "Invalid value of stretch '%s'.  Must be integer (100 = unstretched)" % val
                usage(name)
    commandList = []
    if logFilePath is not None:
        commandList += ["log " + logFilePath]
    if strict > 0:
        commandList += ["option strict %d" % strict]
    if proxyPath is not None:
        commandList += ["proxy " + proxyPath]
    if proxyName is not None:
        commandList += ["external " + proxyName]
    if stretch is not None:
        commandList += ["option stretch %d" % stretch]
    if fname is not None:
        commandList += ["source " + fname]
    d = None
    try:
        d = Driver(port = port)
        signal.signal(signal.SIGINT, d.handleSignal)
        d.run(commandList)
    except SystemExit:
        os._exit(1)
    except Exception as e:
        if d is None:
            sys.stderr.write("Fatal error in main program: %s\n" % str(e))
        else:
            d.console.errors += 1
            d.console.panic("main program", e)
            d.console.finish()
    sys.exit(0)

if __name__ == "__main__":
    run (sys.argv[0], sys.argv[1:])
