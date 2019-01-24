############################################################################
#  Proxylab testing framework
#  Creating and using test files
############################################################################

import datetime
import random
import os
import os.path
import sys
import glob
import socket
import StringIO
import traceback

# Special characters
spaceCharacters = " \t\r\n"
# Printed form
spaceMap = { ' '  : ' '  ,
             '\t' : '\\t',
             '\n' : '\\n',
             '\r' : '\\r'}

# Trim space characters from beginning and end of line
def preTrim(s):
    while len(s) > 0 and s[0] in spaceCharacters:
        s = s[1:]
    return s

# Trim space characters from beginning and end of line
def postTrim(s):
    while len(s) > 0 and s[-1] in spaceCharacters:
        s = s[:-1]
    return s

# Trim space characters from beginning and end of line
def trim(s):
    return postTrim(preTrim(s))


# Put line in printable form
def showLine(line):
    outLine = ""
    for c in line:
        if c in spaceCharacters:
            outLine += spaceMap[c]
        else:
            outLine += c
    return outLine


class Printer:
    outFiles = None

    def __init__(self):
        self.outFiles = [sys.stdout]

    def addFile(self,file):
        self.outFiles.append(file)

    def outMsg(self, s, noreturn = False):
        if len(s) == 0:
            s = "NULL\n"
        elif not noreturn and s[-1] != '\n':
            s += '\n'
        for f in self.outFiles:
            f.write(s)

    def errMsg(self, s, noreturn = False):
        self.outMsg("ERROR: " + s)


    def panic(self, info, exception):
        self.errMsg("Uncaught exception encountered in %s (%s)" % (info, exception))
        buffer = StringIO.StringIO()
        traceback.print_tb(sys.exc_traceback, 2, buffer)
        self.outMsg(buffer.getvalue())
        buffer.close()

    def close(self):
        for f in self.outFiles:
            if f != sys.stdout:
                f.close()
    


# Utility operations on text
class TextUtil:
    # For binary files, enhanced chance of byte value 0
    zeroProb = 0.05
    # Put in lots of linefeeds, to discourage line-by-line reading of data
    lfProb = 0.05
    lowText = ord(' ')
    highText = ord('~')
    lf = '\n'
    printForms = { '\t': '<tab>',
                   '\n': '<newline>',
                   '\r': '<return>',
                   ' ':  '<sp>',
                   chr(0x0): '<null>'
                 }
    

    def __init__(self):
        pass

    def randomCharacter(self, binary):
        if binary and random.uniform(0.0, 1.0) < self.zeroProb:
            return chr(0)
        if binary and random.uniform(0.0, 1.0) < self.lfProb:
            return self.lf
        low = 1 if binary else self.lowText
        high = 255 if binary else self.highText
        return chr(random.randint(low, high))
        
    def showCharacter(self, c, hexOnly):
        v = ord(c)
        if hexOnly:
            return "hex %s" % hex(v)
        if self.lowText <= v and v <= self.highText:
            return "'%s' (hex %s)" % (c, hex(v))
        if c in self.printForms:
            return "%s (hex %s)" % (self.printForms[c], hex(v))
        return "hex %s" % hex(v)

# Create source files and compare with response files
class FileManager:
    # General parameters
    # Location of source files
    sourceFilePath = "./source_files"
    # Location where result files are stored
    responseFilePath = "./response_files"
    # Standard line length for generated text files
    lineLength = 80

    # Subdirectories with permanent files
    staticDirectories = ["images", "icons"]
    # Subdirectory with generated files
    dynamicDirectory = "random"

    # Mapping of extensions to subdirectories
    extensionMap = {
        "bin" : "random",
        "txt" : "random",
        "jpg" : "images",
        "ico" : "icons",
        
        }

    # Dictionaries mapping generated files to length.
    staticFiles = {}
    generatedFiles = {}

    textHandler = None
    printer = None

    def __init__(self, printer = None):
        if printer is None:
            self.printer = Printer()
        else:
            self.printer = printer
        self.textHandler = TextUtil()
        self.loadStaticFiles()
        if not self.testPath(self.responseFilePath):
            try:
                os.mkdir(self.responseFilePath)
            except Exception as e:
                self.printer.errMsg("Couldn't create directory %s (%s)" % (self.responseFilePath, e))
                return
        self.purgeResponseFiles()
        if not self.testPath(self.sourceFilePath):
            try:
                os.mkdir(self.sourceFilePath)
            except Exception as e:
                self.printer.errMsg("Couldn't create directory %s: %s" % (self.sourceFilePath, e))
                return
        rpath = self.sourceFilePath + "/random"
        if not self.testPath(rpath):
            try:
                os.mkdir(rpath)
                self.printer.outMsg("Created directory %s" % rpath)
            except Exception as e:
                self.printer.errMsg("Couldn't create directory %s: %s" % (rpath, e))
                return
        self.purgeDynamicFiles()
        dynamicPath = self.sourceFilePath + "/" + self.dynamicDirectory
        if not self.testPath(dynamicPath):
            try:
                os.mkdir(dynamicPath)
            except Exception as e:
                self.printer.errMsg("Couldn't create directory %s: %s" % (dynamicPath, e))

                
    def loadStaticFiles(self):
        for d in self.staticDirectories:
            matchp = self.sourceFilePath + "/" + d + "/*"
            for p in glob.glob(matchp):
                hierarchy = p.split("/")
                fname = hierarchy[-1]
                statinfo = os.stat(p)
                length = statinfo.st_size
                self.staticFiles[fname] = length

    # Get extension from file
    def getExtension(self, fname):
        fields = fname.split(".")
        if len(fields) <= 1:
            return ""
        else:
            return fields[-1]

    def isBinary(self, extension):
        return extension in ("bin", "jpg", "ico")

    def sourcePath(self, fname):
        subDirectory = "random"
        extension = self.getExtension(fname)
        if extension in self.extensionMap:
            subDirectory = self.extensionMap[extension]
        return self.sourceFilePath + "/" + subDirectory + "/" + fname

    def responsePath(self, fname):
        return self.responseFilePath + "/" + fname

    def testPath(self, path):
        return os.path.exists(path)

    def generateFile(self, fname, bytes):
        extension = self.getExtension(fname)
        if extension not in ("bin", "txt"):
            self.printer.errMsg("Cannot generate file of type '%s'" % extension)
            return ""
        binary = self.isBinary(extension)
        # Seed random number based on file fname
        if fname in self.generatedFiles:
            self.deleteFile(fname)
        random.seed(fname)
        path = self.sourcePath(fname)
        try:
            f = outfile = open(path, 'w')
        except Exception as e:
            self.printer.errMsg("Couldn't open file %s: %s" % (fname, e))
            return ""
        if binary:
            for i in xrange(bytes):
                f.write(self.textHandler.randomCharacter(True))
        else:
            for l in xrange(0, bytes, self.lineLength):
                bcnt = min(self.lineLength, bytes-l)-1
                for i in xrange(bcnt):
                    f.write(self.textHandler.randomCharacter(False))
                f.write('\n')
        f.close()
        self.generatedFiles[fname] = bytes
        return path

    def deleteFile(self, name):
        if name in self.generatedFiles:
            path = self.sourcePath(name)
            try:
                os.remove(path)
            except Exception as e:
                self.printer.errMsg("Internal inconsistency.  Couldn't remove file %s" % name)
                return False
            del self.generatedFiles[name]
            return True
        else:
            self.printer.errMsg("Unknown file %s" % name)
            return False

    def deleteAllFiles(self):
        for name in self.generatedFiles.keys():
            self.deleteFile(name)

    def purgeDynamicFiles(self):
        for path in glob.glob(self.sourceFilePath + "/" + self.dynamicDirectory + "/*"):
            try:
                os.remove(path)
            except Exception as e:
                self.printer.errMsg("Internal inconsistency.  Couldn't remove file %s" % path)        

    def purgeResponseFiles(self):
        for path in glob.glob(self.responseFilePath + "/*"):
            try:
                os.remove(path)
            except Exception as e:
                self.printer.errMsg("Internal inconsistency.  Couldn't remove file %s" % path)        


    # Retrieve file.  Return tuple (length, path, file)
    def findFile(self, name, nofile = False):
        if name in self.generatedFiles:
            path = self.sourcePath(name)
            length = self.generatedFiles[name]
        elif name in self.staticFiles:
            path = self.sourcePath(name)
            length = self.staticFiles[name]
        else:
            return (0, "", None)
        if nofile:
            f = None
        else:
            try:
                f = open(path, 'r')
            except:
                self.printer.errMsg("Internal inconsistency.  Couldn't open file %s" % name)
                return (0, path, None)
        return (length, path, f)

    # Compare files.
    # If match, return (True, "")
    # If don't, return (False, explanation)
    def compareFiles(self, sourcePath, responsePath):
        match = True
        reason = ""
        try:
            sourceLength = os.path.getsize(sourcePath)
        except:
            reason = "Source file %s does not exist" % sourcePath
            return (False, reason)

        try:
            responseLength = os.path.getsize(responsePath)
        except:
            reason = "Response file %s does not exist" % responsePath
            return (False, reason)

        if sourceLength != responseLength:
            reason = "Source file is %d bytes long.  Response file is %d bytes long" % (sourceLength, responseLength)
            return (False, reason)

        binary = self.isBinary(self.getExtension(sourcePath))
        sfile = None
        rfile = None
        try:
            sfile = open(sourcePath, 'r')
        except Exception as e:
            match = False        
            reason = "Internal error. Couldn't open source file %s: %s" % (sourcePath, e)
        try:
            rfile = open(responsePath, 'r')
        except Exception as e:
            match = False
            reason = "Couldn't open file %s: %s" % (responsePath, e)
        byteCount = 0
        done = False
        while match and byteCount < sourceLength:
            sstring = sfile.read(min(50000, sourceLength-byteCount))
            rstring = rfile.read(min(50000, responseLength-byteCount))
            if sstring != rstring:
                # find mismatch
                for offset in range(len(sstring)):
                    sc = sstring[offset]
                    rc = rstring[offset]
                    if sc != rc:
                        match = False
                        sc = self.textHandler.showCharacter(sc, binary)
                        rc = self.textHandler.showCharacter(rc, binary)
                        reason = "Mismatch between source file %s and response file %s starting at position %d: %s != %s" % (
                            sourcePath, responsePath, byteCount+offset+1, sc, rc)
            byteCount += len(sstring)
        sfile.close()
        rfile.close()
        return (match, reason)

# Thread that can be attached to a subprocess object's stdout or stderr.
# Echos anything produced by one of these files.    
class FileMonitor:

    file = None
    printer = None
    id = "FILE"

    def __init__(self, file, printer, id = None):
        self.file = file
        self.printer = printer
        if id is not None:
            self.id = id

    def run(self):
        while True:
            line = self.file.readline()
            if len(line) == 0:
                # End of file
                return
            line = postTrim(line)
            self.printer.outMsg("%s: %s" % (self.id, line))
        

# Put wrapper around sockets to make them more like files
# Inspired by CS:APP RIO package

# Exception that gets raised when detect request to shutdown socket
class ShutdownException(Exception):
    info = ""

    def __init__(self, info = ""):
        Exception.__init__(self)
        self.info = info

    def __str__(self):
        if self.info == "":
            return "Shutdown Socket"
        else:
            return "Shutdown Socket: %s" % self.info



class SocketFile:

    bufSize = 4096
    sock = None
    buffer = bytes("") # Buffer of received but unread characters
    shutdownFlag = False

    def __init__(self, sock):
        self.sock = sock
        self.sock.settimeout(1.0)
        self.buffer = bytes("")
        self.shutdownFlag = False

    def readlineb(self):
        # See if already have line in buffer
        pos = self.buffer.find('\n')
        while pos < 0:
            try:
                data = self.sock.recv(self.bufSize)
            except socket.timeout:
                if self.shutdownFlag:
                    raise ShutdownException('in function readlineb')
                else:
                    continue
            if len(data) == 0:
                rbuf = self.buffer
                self.buffer = bytes("")
                # Incomplete (perhaps empty) line
                return rbuf
            npos = data.find('\n')
            pos = npos if npos < 0 else len(self.buffer) + npos
            self.buffer += data
        result = self.buffer[:pos+1]
        self.buffer = self.buffer[pos+1:]
        return result
            
    
    # Read bytes, including those buffered up to bufSize
    def read(self):
        if len(self.buffer) > 0:
            result = self.buffer
            self.buffer = bytes("")
            return result
        while True:
            try:
                result = self.sock.recv(self.bufSize)
                return result
            except socket.timeout:
                if self.shutdownFlag:
                    raise ShutdownException('in function read')
        
    def shutdown(self):
        self.shutdownFlag = True

    def __str__(self):
        return str(self.sock.getsockname())
    
    def write(self, buf):
        self.sock.sendall(buf)

    def close(self):
        try:
            self.sock.shutdown(socket.SHUT_RDWR)
        except Exception:
            # Ignore
            pass
