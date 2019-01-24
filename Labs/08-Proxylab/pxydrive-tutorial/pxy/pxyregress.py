#!/usr/bin/python

# Run complete set of tests on proxy

import sys
import os
import signal
import getopt
import subprocess
import glob
import os
import os.path
import threading
import datetime

def usage(name):
    print "Usage: %s -h -p PROXY [-S (0-4)] [-s [ABCDEFG]+] [-t SECS] [(-l|-L) FILE] [-d STRETCH]" % name
    print "  -h         Print this message"
    print "  -S (0-4))    Set level of strictness for message formatting requirements"
    print "  -p PROXY   Run specified proxy"
    print "  -s [ABCDEFG]+  Run specified series of tests (any subset of A, B, and C)"
    print "  -t SECS    Set upper time limit for any given test (Value 0 ==> run indefinitely)"
    print "  -l FILE    Copy results to FILE"
    print "  -L FILE    Copy results AND individual log files for failed tests to FILE"
    print "  -d STRETCH Set stretch value for all delays"
    sys.exit(0)

# Parameters
homePathFields = ['.']
driverProgram = "pxydrive.py"

# Test directory
testDirectory = "tests"
# Directory for saving log files
logDirectory = "./logs"
# retry limit.  Currently, only retries when can't make use of selected ports
retryLimit = 3
portReason = "PORT failure"
# Runtime parameters
strict = 0
logFile = None
stretch = None

def findProgram():
    fields = homePathFields + [driverProgram]
    path = '/'.join(fields)
    return path
    
def findTests():
    fields = homePathFields[:-1] + [testDirectory]
    path = '/'.join(fields)
    return path

def wrapPath(path):
    return "'" + path + "'"    

def outMsg(s):
    if len(s) == 0 or s[-1] != '\n':
        s += '\n'
    sys.stdout.write(s)
    if logFile is not None:
        logFile.write(s)

# Signal handler
def handleSignal(signum, frame):
    outMsg("Forced Exit.  Terminating")
    os._exit(1)

# Use to put time limit on jobs
class Killer:
    limit = None
    process = None
    timedOut = False
    timer = None

    def __init__(self, limit = None):
        self.limit = limit
        self.process = None
        self.timedOut = False
        self.timer = None

        
    def activate(self, process):
        self.process = process
        if self.limit is None:
            self.timer = None
        else:
            self.timer = threading.Timer(self.limit, self.kill)
            self.timer.start()

    def kill(self):
        if self.process is not None:
            self.process.terminate()
            self.timedOut = True
            
    def cancel(self):
        if self.timer is not None:
            self.timer.cancel()

# Get path name of log file
def findLogPath(testPath):
    fname = testPath.split("/")[-1]
    root = ".".join(fname.split(".")[0:-1])
    return "%s/%s.log" % (logDirectory, root)

# Run test.  Return (True, "summary") for success (False, reason) for failure
def runTest(proxyPath, testPath, generateLog = True, limit = None):
    if not os.path.exists(proxyPath):
        return (False, "File %s does not exist" % proxyPath)
    if not os.path.exists(testPath):
        return (False, "Test file %s does not exist" % testPath)
    cmd = [findProgram(), "-p", proxyPath, "-f", wrapPath(testPath)]
    logPath = findLogPath(testPath)
    if generateLog:
        cmd += ["-l", logPath]
    if strict > 0:
        cmd += ["-S %d" % strict]
    if stretch is not None:
        cmd += ["-d", str(stretch)]
    try:
        process = subprocess.Popen(cmd, stdout = subprocess.PIPE, stderr= subprocess.PIPE)
    except Exception as e:
        reason = "Couldn't run test: %s" % str(e)
        return (False, reason)

    # Set up time out
    killer = Killer(limit)
    try:
        killer.activate(process)
        stdoutdata = process.communicate()[0]
    except Exception as e:
        reason = "Execution failed: %s" % str(e)
        return (False, reason)
    finally:
        killer.cancel()

    if killer.timedOut:
        reason = "Timed out"
        return (False, reason)

    if process.returncode != 0:
        reason = "driver exited with return code %d" % process.returncode
        return (False, reason)
    
    if "[Errno 98]" in stdoutdata:
        reason = portReason
        return (False, reason)

    lines = stdoutdata.split('\n')
    if len(lines) < 2:
        reason = "No output produced by test"
        return (False, reason)
    lastLine = lines[-1]
    while lastLine == '' and len(lines) > 0:
        lines = lines[:-1]
        lastLine = lines[-1]
    ok = lastLine == "ALL TESTS PASSED"
    reason = lastLine
    return (ok, reason)
        
def chooseTests(series):
    paths = []
    for c in series:
        pattern = "%s/%s*.cmd" % (findTests(), c)
        npaths = glob.glob(pattern)
        npaths.sort()
        paths += npaths
    return paths

def logFileSetup():
    if not os.path.exists(logDirectory):
        try:
            os.mkdir(logDirectory)
        except Exception as e:
            outMsg("ERROR: Could not create directory %s" % logDirectory)
            return False
    pattern = "%s/*" % logDirectory
    for p in glob.glob(pattern):
        try:
            os.remove(p)
        except Exception as e:
            outMsg("ERROR: Could not remove previous log file %s" % p)
            return False
    return True
    
def fullLog(logPath):
    outMsg("-" * 80)
    header = "-" * 10 + " " + logPath + " "
    header += "-" * (80 - len(header))
    outMsg(header)
    outMsg("-" * 80)
    try:
        lfile = open(logPath)
    except:
        outMsg(" *** Couldn't open file *** ")
        return
    for line in lfile:
        outMsg(line)
    lfile.close()


def run(name, args):
    global strict
    global stretch
    global logFile
    limit = 60
    proxy = None
    series = "ABCDEFG"
    generateLog = True
    superLog = False
    try:
        optlist, args = getopt.getopt(args, "hS:p:s:t:l:L:d:")
    except getopt.GetoptError as e:
        print "Command-line error (%s)" % str(e)
        usage(name)
    for opt, val in optlist:
        if opt == '-h':
            usage(name)
        elif opt == "-p":
            proxy = val
        elif opt == "-s":
            series = val
        elif opt == "-S":
            try:
                strict = int(val)
            except:
                print "Invalid value of strictness '%s'" % val
                usage(name)
        elif opt == "-t":
            try:
                limit = int(val)
            except:
                outMsg("Invalid timeout value '%s'" % val)
                sys.exit(1)
            if limit == 0:
                limit = None
        elif opt == '-l' or opt == '-L':
            try:
                logFile = open(val, 'w')
            except:
                outMsg("Couldn't open log file %s" % val)
                sys.exit(1)
            superLog = opt == '-L'
        elif opt == '-d':
            try:
                stretch = int(val)
            except:
                outMsg("Invalid value of stretch '%s'.  Must be integer (100 = unstretched)" % val)
                sys.exit(1)
                
    if proxy is None:
        outMsg("ERROR: No proxy specified")
        usage(name)
    if generateLog:
        if not logFileSetup():
            sys.exit(1)
    tests = chooseTests(series)
    success = 0
    failure = 0

    badTests = []

    tstart = datetime.datetime.now()

    for t in tests:
        for _ in range(retryLimit):
            (ok, reason) = runTest(proxy, t, generateLog, limit)
            if ok or reason != portReason:
                break
        if ok:
            success += 1
        else:
            failure += 1
            badTests.append(t)
        sresult = "succeeded" if ok else "failed"
        outMsg("Test %s %s: %s" % (t, sresult, reason))
    total = success + failure

    dt = datetime.datetime.now() - tstart
    secs = dt.seconds + 1e-6 * dt.microseconds
    outMsg("Total run time = %.2f seconds" % secs)
    if total > 0:
        successPercent = success * 100.0 / total
        failurePercent = failure * 100.0 / total
        outMsg("%d tests.  %d (%.1f)%% passed, %d (%.1f)%% failed" % (total, success, successPercent, failure, failurePercent))
        outMsg("Runtime logs in directory %s" % logDirectory)
        if failure == 0:
            outMsg("ALL TESTS PASSED")
        else:
            outMsg("ERROR COUNT = %d/%d" % (failure, total))
    else:
        outMsg("No tests performed")

    if superLog:
        for t in badTests:
            fullLog(findLogPath(t))

    if logFile is not None:
        logFile.close()
            
if __name__ == "__main__":
    current = os.path.realpath(__file__)
    homePathFields = current.split('/')[:-1]
    try:
        signal.signal(signal.SIGINT, handleSignal)
        run (sys.argv[0], sys.argv[1:])
    except Exception as e:
        print "Unexpected exception (%s).  Exiting %s" % (e, sys.argv[0])
