############################################################################
#  Proxylab testing framework
#  HTTP Servers and clients
############################################################################

import sys
import socket
import threading

import files
import events

# Get host, port, and uri from URL.
# Return either (True, host, port, uri) or (False, reason)
            
def parseURL(url):
    host = "localHost"
    port = 80
    uri = ""
    # Just in case
    reason = "Invalid URL '%s'" % url
    rest = url
    # Common error: Try to use https
    if rest.find('https://') >= 0:
        reason = "Invalid URL '%s': https not supported" % url
        return (False, reason)
    # Strip off any prefix of the form 'http://'
    prefix = "http://"
    plen = len(prefix)
    if rest[:plen].lower() == prefix:
        rest = rest[plen:]
    # Split host information from URI
    firstSlash = rest.find('/')
    if firstSlash >= 0:
        hostPort = rest[:firstSlash]
        uri = rest[firstSlash+1:]
        # See if there's a port number
        fields = hostPort.split(':')
        if len(fields) == 1:
            # no port
            host = hostPort
        elif len(fields) == 2:
            host = fields[0]
            try:
                port = int(fields[1])
            except:
                return (False, reason)
        else:
                return (False, reason)
    else:
        host = rest
        uri = ""
    if len(uri) == 0 or uri[0] != '/':
        uri = '/' + uri
    return (True, host, port, uri)


class HeaderReader:

    headerDict = {}
    strict = None
    # Verbatim text
    headerLines = ""

    def __init__(self, strict = None):
        self.headerDict = {}
        self.headerLines = []
        self.strict = console.Option(0) if strict is None else strict

    
    def checkTerm(self, line):
        # Check and remove terminating characters
        term = "\r\n" if self.strict.getInteger() >= 1 else "\n"
        lterm = "" if len(line) < len(term) else line[-len(term):]
        return term == lterm

    # Parse line single line of header
    # Return tuple:
    #   (ok, done, info):
    #   ok: No error encountered
    #   done: Found terminating line for header
    #   info: if not ok, then error message
    def parseLine(self, line):
        # In case need to generate error message
        sline = files.showLine(line)
        # Check termination
        if self.strict.getInteger() >= 1 and not self.checkTerm(line):
            return (False, False, "Line terminated improperly: '%s'" % sline)
        # Remove initial and final spaces:
        line = files.trim(line)
        if len(line) == 0:
            # Empty line marks end
            return (True, True, "")
        # Get token
        token = ''
        while len(line) >= 1 and line[0] != ':' and line[0] not in files.spaceCharacters:
            token += line[0]
            line = line[1:]
        # Skip spaces before colon
        line = files.preTrim(line)
        if len(line) == 0 or line[0] != ':':
            # No token on line
            if self.strict.getInteger() >= 1:
                return (False, False, "No token on line: '%s'" % sline)
            else:
                # Ignore
                return (True, False, "")
        line = line[1:]
        # Skip initial spaces in field
        line = files.preTrim(line)
        if len(token) >= 1:
            self.headerDict[token.lower()] = line
            return (True, False, "")
        else:
            # Empty token
            if self.strict.getInteger() >= 1:
                return (False, False, "No token defined on line: '%s'" % sline)
            else:
                # Ignore
                return (True, False, "")
    
    # Read entire header from socket
    # Returns either (False, reason) for invalid line
    # or (True, "") for valid line
    def readHeader(self, sockFile):
        while True:
            # May cause shutdown exception
            try:
                line = sockFile.readlineb()
            except files.ShutdownException:
                sockFile.close()
                info = "Shutting down"
                return (False, info)
            except Exception as ex:
                sockFile.close()
                info = "Error reading header (%s)" % ex
                return (False, info)
            self.headerLines.append(line)
            ok, done, info = self.parseLine(line)
            if ok and done:
                return (True, "")
            if not ok:
                return (False, info)
    
    # Get value of token from header
    def getValue(self, token, default = ""):
        token = token.lower()
        if token in self.headerDict:
            return self.headerDict[token]
        else:
            return default
    
# HTTP status codes
class HTTPStatus:
    # Each entry gives a status code, a tag, and a description

    entries = [(200, "ok", "OK"),
               (400, "bad_request", "Bad request"),
               (404, "not_found", "Not found"),
               (501, "not_implemented", "Not implemented"),
               (503, "bad_version", "HTTP version not supported"),
               (999, "invalid", "Invalid status code"),
               ]
    codes = {}
    descriptions = {}
    tags = {}

    def __init__(self):
        self.codes = {}
        self.descriptions = {}
        self.tags = {}
        for (code, tag, descr) in self.entries:
            self.codes[tag] = code
            self.descriptions[tag] = descr
            self.tags[code] = tag
            
    def getCode(self, tag):
        if tag not in self.codes:
            tag = "bad_request"
        return self.codes[tag]

    def getDescription(self, tag):
        if tag not in self.descriptions:
            tag = "bad_request"
        return self.descriptions[tag]

    def getTag(self, code):
        try:
            code = int(code)
            tag = self.tags[code]
        except:
            tag = "invalid"
        return tag

class Disruption:
    none, request, response = range(3)
    names = ["none", "request", "response"]

    def __init__(self):
        pass

    def parse(self, name):
        if name in self.names:
            return self.names.index(name)
        return self.none
    


class Server:

    # General parameters
    mimeTypes = {"txt" : "text/plain",
                 "html" : "text/html",
                 "bin" : "application/octet-stream",
                 "jpg" : "image/jpeg",
                 "ico" : "image/x-icon",
                 }

    port = 8000
    host = "localhost"
    eventManager = None
    fileManager = None
    sock = None
    running = True
    verbose = None
    strict = None
    thread = None
    printer = None
    id = "server"
    httpStatus = None
    requestCount = 0
    readingHeader = False
    allOK = True
    disruption = Disruption.none

    def __init__(self, host, port, eventManager, fileManager, printer, id = "main", strict = None, verbose = None, disabled = False):
        self.host = host
        self.port = port
        self.eventManager = eventManager
        self.fileManager = fileManager
        self.printer = printer
        self.id = id
        self.strict = strict
        self.verbose = console.Option(False) if verbose is None else verbose
        self.strict = console.Option(False) if strict is None else strict
        self.sock = None
        self.running = True
        self.httpStatus = HTTPStatus()
        self.requestCount = 0
        self.readingHeader = False
        self.timeOut = 1.0
        self.allOK = True
        self.disruption = Disruption.none

        tuples = socket.getaddrinfo(self.host, self.port, socket.AF_INET, socket.SOCK_STREAM)
        if len(tuples) == 0:
            self.running = False
            self.printer.errMsg("Couldn't get address information for port %d" % port)
            return
        msg = ""
        for info in tuples:
            (family, socktype, proto, canonname, sockaddr) = info
            try:
                self.sock = socket.socket(family, socktype)
                self.sock.bind(sockaddr)
                if not disabled:
                    self.sock.listen(0)
                    if self.timeOut > 0:
                        self.sock.settimeout(self.timeOut)
            except socket.error as ex:
                self.sock = None
                msg = str(ex)
                continue
            break
        if self.sock is None:
            self.printer.errMsg("Couldn't set up server on port %d (%s)" % (port, msg))
            self.running = False
            return
        if disabled:
            self.thread = None
            self.running = False
        else:
            self.thread = threading.Thread(target=self.wrappedRun, name = "Server-Thread")
            self.thread.start()
        
    def outMsg(self, msg):
        for line in msg.split("\n"):
            self.printer.outMsg("Server %s: %s" % (self.id, line))

    def errMsg(self, msg):
        self.printer.errMsg("Server %s: %s" % (self.id, msg))

    def scheduleDisruption(self, dis):
        self.disruption = dis

    # Generate a URL for this server
    def generateURL(self, fname):
        return "http://%s:%d/%s" % (self.host, self.port, fname)

    def handleConnection(self, sockFile = None):
        if sockFile is None:
            return
        if self.disruption ==  Disruption.request:
            sockFile.shutdown()
            sockFile.close()
            self.disruption = Disruption.none
            if self.verbose.getBoolean():
                self.outMsg("Intentional disruption of request by server %s" % self.id)
            return
        (event, header, body, localFile) = self.getRequest(sockFile)
        if event is not None and header != "":
            if self.verbose.getBoolean():
                self.outMsg("Sending response:")
                self.outMsg(header)
            # Defer response until triggered by command
            event.thread = threading.current_thread()
            event.wait()
            if not self.running:
                sockFile.close()
                return
            if self.disruption ==  Disruption.response:
                sockFile.shutdown()
                sockFile.close()
                self.disruption = Disruption.none
                if self.verbose.getBoolean():
                    self.outMsg("Intentional disruption of response by server %s" % self.id)
                return
            self.sendResponse(event, header, sockFile, body = body, localFile = localFile)
            sockFile.close()
            if localFile is not None:
                localFile.close()
            if self.verbose.getBoolean():
                self.outMsg("Generated event %s" % str(event))
        else:
            sockFile.close()

    def wrappedHandleConnection(self, sockFile = None):
        try:
            self.handleConnection(sockFile)
        except Exception as e:
            self.printer.panic("Server %s connection handler" % self.id, e)
            self.allOK = False

    def run(self):
        if self.sock == None:
            self.errMsg("Server not enabled")
            return
        if self.verbose.getBoolean():
            self.outMsg("Running server")
        while self.running:
            try:
                (conn, address) = self.sock.accept()
            except socket.timeout:
                continue
            self.requestCount += 1
            if self.verbose.getBoolean():
                self.outMsg("Connection request #%d from %s.  Creating connection %s" % (self.requestCount, address, conn))
            sockFile = files.SocketFile(conn)
            t = threading.Thread(target = self.wrappedHandleConnection, kwargs = {"sockFile" : sockFile})
            t.start()
        self.sock.close()
    
    def wrappedRun(self):
        try:
            self.run()
        except Exception as e:
            self.printer.panic("Server %s" % self.id, e)
            self.allOK = False

    def stop(self):
        self.running = False

    def waitForExit(self):
        if self.thread is not None:
            self.thread.join()
        return self.allOK

    # Create header.  Return as list of lines
    def buildHeader(self, tag, length, mimeType, id = ""):
        code = self.httpStatus.getCode(tag)
        descr = self.httpStatus.getDescription(tag)
    
        lines = []
        lines.append("HTTP/1.0 %d %s\r\n" % (code, descr))
        lines.append("Server: Proxylab driver\r\n")
        if id != "":
            lines.append("Request-ID: %s\r\n" % id)
        lines.append("Content-length: %d\r\n" % length)
        lines.append("Content-type: %s\r\n" % mimeType)
        lines.append("\r\n")
        return lines

    # Construct an HTML page giving error information
    def buildError(self, tag, reason):
        code = self.httpStatus.getCode(tag)
        descr = self.httpStatus.getDescription(tag)
        body = '<html><title>PxyDrive Server Error</title>\r\n'
        body += '<body bgcolor = "ffffff">\r\n'
        body += '%d: %s\r\n' % (code, descr)
        body += '<p>%s\r\n' % reason
        body += '<hr><em>The PxyDrive server</em>\r\n'
        return body


    def sendResponse(self, event, header, sockFile, body = "", localFile = None):
        try:
            sockFile.write(header)
        except Exception as ex:
            event.error("Couldn't send response header: %s" % ex)
            return
        event.sentHeaderLines = event.pendingHeaderLines

        byteCount = 0
        if body != "":
            try:
                sockFile.write(body)
                byteCount += len(body)
            except Exception as ex:
                event.error("Couldn't send body text (%s)" % str(ex))

        done = localFile is None
        while not done:
            buf = localFile.read(1000)
            done = len(buf) == 0
            if not done:
                try:
                    sockFile.write(buf)
                    byteCount += len(buf)
                except Exception as ex:
                    event.error("Couldn't send file %s (%s)" % (event.path, str(ex)))
                    done = True

        if self.verbose.getBoolean():
            self.outMsg("Sent %d bytes of response data" % byteCount)

    def getRequest(self, sockFile):
        event = None
        header = ""
        body = ""
        localFile = None
        tag = "ok"
        reason = ""
        # Get first line as request.  May cause shutdown exception
        try:
            requestLine = sockFile.readlineb()
        except files.ShutdownException:
            sockFile.close()
            return (None, None, None, None)
        except Exception as ex:
            sockFile.close()
            self.errMsg("Error getting request line (%s)" % ex)
            return (None, None, None, None)
        if self.verbose.getBoolean():
            self.outMsg("Received request with request line '%s'" % files.showLine(requestLine))
        # Get header
        requestHeader = HeaderReader(self.strict)
        self.readingHeader = True
        ok, reason = requestHeader.readHeader(sockFile)
        self.readingHeader = False

        requestId = requestHeader.getValue("Request-ID", "")
        # Default is to fetch, unless find matching request event, or find response header
        isFetch = True
        # requestId will be "" if missing header.
        if requestId == "":
            # Try to generate response event from request info.
            uri = None
            fields = requestLine.split()
            url = fields[1] if len(fields) >= 2 else ""
            info = parseURL(url)
            if info[0]:
                uri = info[3]
            event = self.eventManager.makeMatchEvent(self.id, uri)
            if self.verbose.getBoolean():
                self.printer.outMsg("Trying to find matching request with server %s, uri %s yielded event %s" %
                                    (self.id, uri, "None" if event is None else event.id))
        if event is None:
            try:
                event = self.eventManager.addResponseEvent(requestId, server = self.id)
            except:
                event = self.eventManager.addResponseEvent("", server = self.id)
        if event is None:
            # Shutting down
            return (None, None, None, None)
        action = requestHeader.getValue("response", "")
        requestEvent = self.eventManager.findEvent(True, event.id)
        if action == "" and requestEvent is not None:
            event.isFetch = requestEvent.isFetch
            action = "immediate" if event.isFetch else "deferred"
        if action.lower() == "immediate":
            event.tevent.set()
        else:
            # No longer need to wait for this event
            self.eventManager.addCompleted(requestEvent)
            
        event.sockFile = sockFile
        event.receivedHeaderLines = [requestLine] + requestHeader.headerLines
        if not ok:
            tag = "bad_request"
            reason = "Unknown" if reason == "" else reason
        elif self.strict.getInteger() >= 1 and not requestHeader.checkTerm(requestLine):
            tag = "bad_request"
            reason = "Improperly terminated GET request"
        if tag != "ok":
            self.eventManager.changeTag(event, tag, reason)
            body = self.buildError(tag, reason)
            lines = self.buildHeader(tag, len(body), "text/html", event.id)
            event.pendingHeaderLines = lines
            header = "".join(lines)
            return (event, header, body, localFile)
            
        fields = requestLine.split()
        if len(fields) != 3:
            tag = "bad_request"
            reason = "Malformed GET request '%s'" % " ".join(fields)
        elif fields[0] != "GET":
            tag = "not_implemented"
            reason = "Only support GET requests"
        elif fields[2] != "HTTP/1.0" and (self.strict.getInteger() >= 2 or fields[2] != "HTTP/1.1"):
            tag = "bad_version"
            reason = "Request for HTTP version '%s'.  Only support 1.0" % fields[2]

        if tag != "ok":
            self.eventManager.changeTag(event, tag, reason)
            body = self.buildError(tag, reason)
            lines = self.buildHeader(tag, len(body), "text/html", event.id)
            event.pendingHeaderLines = lines
            header = "".join(lines)
            return (event, header, body, localFile)

        url = fields[1]
        event.url = url
        info = parseURL(url)
        if not info[0]:
            tag = "bad_request"
            reason = info
            event.error(reason)
            body = self.buildError(tag, reason)
            lines = self.buildHeader(tag, len(body), "text/html", event.id)
            event.pendingHeaderLines = lines
            header = "".join(lines)
            return (event, header, body, localFile)
        uri = info[3]   # URI
        event.addURI(uri)
        fname = uri
        if fname[0] == '/':
            fname = fname[1:]
        (length, path, localFile) = self.fileManager.findFile(fname)
        event.addPath(path)
        if localFile is None:
            tag = "not_found"
            reason = "File '%s' not found" % fname
            self.eventManager.changeTag(event, tag, reason)
            body = self.buildError(tag, reason)
            lines = self.buildHeader(tag, len(body), "text/html", event.id)
            event.pendingHeaderLines = lines
            header = "".join(lines)
            return (event, header, body, localFile)

        extension = self.fileManager.getExtension(fname)
        mimeType = self.mimeTypes[extension] if extension in self.mimeTypes else "application/unknown"
        if self.strict.getInteger() >= 2:
            # HTTP issues
            if requestHeader.getValue("host", None) is None:
                tag = "bad_request"
                reason = "Missing Host in request header"
        if self.strict.getInteger() >= 3:
            # PxyDrive issues
            if requestHeader.getValue("request-id", "") == "":
                tag = "bad_request"
                reason = "Missing Request-ID header"
            elif requestHeader.getValue("response", "").lower() not in ["immediate", "deferred"]:
                tag = "bad_request"
                reason = "Invalid or missing Response header"
        if self.strict.getInteger() >= 4:
            # Stated requirements for proxy
            if requestHeader.getValue("connection", "").lower() != "close":
                tag = "bad_request"
                reason = "Invalid or missing Connection header"
            elif requestHeader.getValue("proxy-connection", "").lower() != "close":
                tag = "bad_request"
                reason = "Invalid or missing Proxy-Connection header"
            elif requestHeader.getValue("user-agent", "") == "":
                tag = "bad_request"
                reason = "Missing User-Agent header"
        if tag != "ok":
            self.eventManager.changeTag(event, tag, reason)
            body = self.buildError(tag, reason)
            lines = self.buildHeader(tag, len(body), "text/html", event.id)
            event.pendingHeaderLines = lines
            header = "".join(lines)
            localFile.close()
            localFile = None
            return (event, header, body, localFile)

        self.eventManager.changeTag(event, tag, reason)
        lines = self.buildHeader(tag, length, mimeType, event.id)
        event.pendingHeaderLines = lines
        header = "".join(lines)
        return (event, header, body, localFile)

class RequestGenerator:

    eventManager = None
    fileManager = None
    proxy = None  # indicated by (host, port)
    strict = None
    verbose = None
    printer = None
    httpStatus = None
    allOK = False
    disruption = Disruption.none
    
    def __init__(self, eventManager, fileManager, printer, proxy = None, strict = None, verbose = None):
        self.eventManager = eventManager
        self.fileManager = fileManager
        self.printer = printer
        self.proxy = proxy
        self.strict = console.Option(False) if strict is None else strict
        self.verbose = console.Option(False) if verbose is None else verbose
        self.httpStatus = HTTPStatus()
        self.allOK = True
        self.disruption = Disruption.none

    def outMsg(self, msg):
        for line in msg.split("\n"):
            self.printer.outMsg("Client: %s" % line)

    def errMsg(self, msg):
        self.printer.errMsg("Client: %s" % msg)

    def scheduleDisruption(self, dis):
        self.disruption = dis

    # Make request for file.
    # If isFetch, then will do immediate response
    def request(self, event, url, isFetch):
        if not self.startRequest(event, url, isFetch):
            return False
        thread = threading.Thread(target = self.wrappedFinishRequest, kwargs = { "event" : event })
        event.thread = thread
        thread.start()
        return True

    # Initiate request.  Return success/failure
    def startRequest(self, event, url, isFetch):
        id = event.id
        info = parseURL(url)
        if not info[0]:
            event.error(info[1])
            return False
        host, port, uri = info[1:]
        event.addURI(uri)
        action = "Fetching" if isFetch else "Requesting" 
        self.outMsg("%s '%s' from %s:%d" % (action, uri, host, port))
        (phost, pport) = (host, port) if self.proxy is None else self.proxy
        tuples = socket.getaddrinfo(phost, pport, socket.AF_INET, socket.SOCK_STREAM)
        if len(tuples) == 0:
            event.error("Couldn't get address information for (%s:%d)" % (phost, pport))
            return False
        sock = None
        for info in tuples:
            (family, socktype, proto, canonname, sockaddr) = info
            try:
                sock = socket.socket(family, socktype)
                sock.connect(sockaddr)
            except Exception as ex:
                sock = None
                msg = str(ex)
                continue
            break
        if sock is None:
            event.error("Couldn't connect to %s:%d (%s)" % (phost, pport, msg))
            return False
        sockFile = files.SocketFile(sock)
        event.sockFile = sockFile
        event.url = url
        if self.verbose.getBoolean():
            self.outMsg("Set up connection to %s:%d" % (phost,pport))
        lines = []
        if self.disruption == Disruption.request:
            self.disruption = Disruption.none
            sockFile.shutdown()
            sockFile.close()
            if self.verbose.getBoolean():
                self.outMsg("Intentional disruption of request by client")
            return False
        lines.append("GET %s HTTP/1.0\r\n" % url)
        lines.append("Host: %s:%d\r\n" % (host, port))
        lines.append("Request-ID: %s\r\n" % id)
        rtype = "Immediate" if isFetch else "Deferred"
        lines.append("Response: %s\r\n" % rtype)
        lines.append("Connection: close\r\n")
        lines.append("Proxy-Connection: close \r\n")
        lines.append("User-Agent: CMU/1.0 Iguana/20180704 PxyDrive/0.0.1\r\n")
        lines.append("\r\n")
        event.sentHeaderLines = lines
        header = "".join(lines)
        try:
            sockFile.write(header)
        except Exception as ex:
            event.error("Couldn't send request header for url %s (%s)" % (url, str(ex)))
            return False
        if self.verbose.getBoolean():
            self.outMsg("Sent the following header")
            self.outMsg(header)
        return True

    def finishRequest(self, event = None):
        if event is None:
            if self.verbose.getBoolean():
                self.outMsg("Attempted to finish request with empty event")            
            return
        sockFile = event.sockFile
        url = event.url
        if sockFile is None:
            event.error("Cannot complete request.  No socket")
            return
        if url is None:
            event.error("Cannot complete request.  No URL")
            sockFile.close()
            return
        if self.disruption == Disruption.response:
            self.disruption = Disruption.none
            sockFile.shutdown()
            sockFile.close()
            if self.verbose.getBoolean():
                self.outMsg("Intentional disruption of response by client")
            return
        host, port, uri = parseURL(url)[1:]
        id = event.id
        # Get response
        found = False
        try:
            response = sockFile.readlineb()
        except Exception as ex:
            event.error("Could not read response for URL request %s (%s)" % (url, str(ex)))
            sockFile.close()
            return
        if len(response) == 0:
            event.error("Got empty response for URL request %s" % url)
            sockFile.close()
            return
        responseLine = files.trim(response)
        fields = responseLine.split(None, 2)
        if len(fields) != 3:
            event.error("Can't parse response from line '%s'" % files.showLine(response))
            sockFile.close()
            return
        version, status, statusMsg = fields
        tag = self.httpStatus.getTag(status)
        reason = self.httpStatus.getDescription(tag)
        self.eventManager.changeTag(event, tag, reason)
        responseHeader = HeaderReader(self.strict)
        (ok, reason) = responseHeader.readHeader(sockFile)
        if self.verbose.getBoolean():
            self.outMsg("Read response from proxy.  ok = %s, reason = %s" % (ok, reason))
            self.outMsg("Header:")
            header = "".join(responseHeader.headerLines)
            self.outMsg(header)

        event.receivedHeaderLines = [responseLine] + responseHeader.headerLines
        if not ok:
            event.error("Invalid response header %s" % reason)
            sockFile.close()
            return
        try:
            length = int(responseHeader.getValue("content-length", "-1"))
        except:
            event.error("Invalid or missing content length from response header")
            sockFile.close()
            return
        if length < 0:
            event.error("Invalid or missing content length from response header")
            sockFile.close()
            return
        # Get response
        fname = uri.split("/")[-1] if tag == "ok" else "status.html"
        if fname == "":
            fname = "index.html"
        isBinary = self.fileManager.isBinary(self.fileManager.getExtension(fname))
        outfname = fname if id == "" else id + "-" + fname 
        outPath = self.fileManager.responsePath(outfname)
        event.addPath(outPath)
        try:
            outfile = open(outPath, "wb" if isBinary else "w")
        except Exception as ex:
            event.error("Couldn't open file %s in which to save response (%s)" % (outPath, str(ex)))
            sockFile.close()
            return
        saveTag = event.tag
        saveText = event.text
        remaining = length
        self.eventManager.changeTag(event, "reading", "Client expecting %d more bytes (total %d) from proxy" % (remaining, length))
        while (remaining > 0):
            try:
                buf = sockFile.read()
            except files.ShutdownException:
                outfile.close()
                sockFile.close()
                return
            except Exception as ex:
                event.error("Error reading response (%s)" % ex)
                outfile.close()
                sockFile.close()
                return
            if len(buf) == 0:
                event.error("Socket closed after reading %d/%d bytes" % (length-remaining, length))
                outfile.close()
                sockFile.close()
                return
            if len(buf) > 0:
                outfile.write(buf)
            remaining -= len(buf)
            self.eventManager.changeTag(event, "reading", "Client expecting %d more bytes (total %d) from proxy" % (remaining, length))
        self.eventManager.changeTag(event, "closing", "Client closing connection to proxy")
        outfile.close()
        sockFile.close()
        if self.verbose.getBoolean():
            self.outMsg("URL = %s, Status = %s.  Result stored in %s.  %d bytes" % (url, event.tag, outPath, length))
        self.eventManager.changeTag(event, "checking", "Client checking that received file is correct")
        # Now check that the results are as expected
        if host == self.proxy[0] and tag == "ok":
            sourcePath = self.fileManager.sourcePath(fname)
            if not self.fileManager.testPath(sourcePath):
                event.error("Internal error.  Couldn't find file %s" % sourcePath)
                return
            (match, reason) = self.fileManager.compareFiles(sourcePath, outPath)
            if not match:
                event.error(reason)
                return
            if self.verbose.getBoolean():
                self.outMsg("Files %s and %s match" % (outPath, sourcePath))
        self.eventManager.changeTag(event, saveTag, saveText)

    def wrappedFinishRequest(self, event = None):
        try:
            self.finishRequest(event)
            self.eventManager.addCompleted(event)
        except Exception as e:
            self.printer.panic("Proxy client", e)
            self.allOK = False
            
