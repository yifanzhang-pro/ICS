# Implementation of simply command-line parser
# New commands added by providing method which accepts argument list as its only argument

import sys
import threading
import traceback

# Class to implement either Boolean or integer-valued options.  Value
# displayed as integer, with 0 for False and 1 for True for Boolean
# options
class Option:
    value = 0

    def __init__(self, value):
        self.set(value)

    def set(self, val):
        # Booleans
        if val == True:
            self.value = 1
        elif val == False:
            self.value = 0
        else:
            self.value = val

    def getInteger(self):
        return self.value

    def getBoolean(self):
        return self.value != 0


class Command:
    fileStack = [] # Need stack to support recursive inclusion of files
    outFiles =  [] # Can write to multiple output files
    echo = None    # Echo commands? (Option)
    errorLimit = None  # How many errors before giving up (Option)
    commandDict = {} # Commands indexed by names.  Each entry is tuple (method, arguments, documentation)
    optionDict = {} # Integer options, indexed by name.  Each entry is (option, documentation)
    running = True
    errors = 0
    prompt = ">"
    printLock = None
    finishFunction = None
    # Lengths of longest string
    longestOption = 0
    longestCommand = 0
    longestArgumentString = 0
    
    def __init__(self):
        self.fileStack = [sys.stdin]
        self.outFiles = [sys.stdout]
        self.echo = Option(True)
        self.errorLimit = Option(5)
        self.running = True
        self.errors = 0
        self.commandDict = {}
        self.optionDict = {}
        self.longestCommand = 0
        self.longestArgumentString = 0
        self.longestOption = 0
        self.printLock = threading.Lock()
        self.finishFunction = None
        self.addCommand("quit", self.doQuit,     "",                      "Exit program")
        self.addCommand("help", self.doHelp,     "(COMMAND|OPTION)*",      "Get information about commands or options")
        self.addCommand("option", self.doOption, "OPTION VALUE",          "Set option value")
        self.addCommand("source", self.doSource, "FILE",                  "Read commands from FILE")        
        self.addCommand("log", self.doLog,       "FILE",                  "Copy results to FILE")
        self.addCommand("#", self.doComment,     "XXXXXXXX",             "Rest of line treated as comment")
        self.addOption("echo", self.echo, "Echo commands on output")
        self.addOption("error", self.errorLimit, "Maximum number of errors before exiting")

 
    def outMsg(self, msg, noreturn = False):
        if (len(msg) == 0 or msg[-1] != '\n') and not noreturn:
            msg += '\n'
        self.printLock.acquire()
        for file in self.outFiles:
            try:
                file.write(msg)
            except:
                pass
        self.printLock.release()
    
    def errMsg(self, msg):
        msg = "ERROR: " + msg
        self.outMsg(msg)

    def panic(self, info, exception):
        self.errMsg("Uncaught exception encountered in %s (%s)" % (info, exception))
        self.outMsg(traceback.format_exc(6))

    def echoMsg(self, msg):
        if len(msg) == 0 or msg[-1] != '\n':
            msg += '\n'
        for file in self.outFiles:
            if self.fileStack[0] != sys.stdin or file != sys.stdout:
                file.write(msg)

    def addCommand(self, name, method, argstring, docstring):
        self.commandDict[name] = (method, argstring, docstring)
        self.longestCommand = max(self.longestCommand, len(name))
        self.longestArgumentString = max(self.longestArgumentString, len(argstring))

    def addOption(self, name, option, docstring):
        self.optionDict[name] = (option, docstring)
        self.longestOption = max(self.longestOption, len(name))

    def run(self, commandList = []):
        while self.running:
            line = ""
            while line == "":
                if len(commandList) > 0:
                    line = commandList[0]
                    commandList = commandList[1:]
                else:
                    if len(self.fileStack) == 0:
                        self.finish()
                        return
                    infile = self.fileStack[0]
                    if infile == sys.stdin:
                        sys.stdout.write(self.prompt)
                    line = infile.readline()
                    if line == '':
                        infile.close()
                        self.fileStack = self.fileStack[1:]
            self.interpretLine(line)
        self.finish()

    def interpretLine(self, line):
        if self.echo.getBoolean():
            self.echoMsg(self.prompt + line)
        cstart = line.find('#')
        cline = line[:cstart] if cstart >= 0 else line
        fields = cline.split()
        if len(fields) == 0:
            # Comment line.  Selectively print
            if cstart >= 0 and not self.echo.getBoolean():
                self.echoMsg(line)
            return
        command = fields[0]
        if command in self.commandDict:
            (method, argstring, docstring) = self.commandDict[command]
            args = fields[1:]
            if not method(args):
                self.errors += 1
        else:
            self.errMsg("Unknown command '%s'" % command)
            self.errors += 1
        if self.errors >= self.errorLimit.getInteger():
            self.outMsg("Too many errors.  Exiting")
            self.running = False

    def finish(self):
        if self.finishFunction is not None:
            if not self.finishFunction():
                self.errors += 1
        for f in self.fileStack:
            f.close()
        if self.errors == 0:
            self.outMsg("ALL TESTS PASSED")
        else:
            self.outMsg("ERROR COUNT = %d" % self.errors)
        for f in self.outFiles:
            if f != sys.stdout:
                f.close()

    # Built in commands
    def doQuit(self, args):
        self.running = False
        return True

    # Format line for single command
    def documentCommand(self, name):
        if name not in self.commandDict:
            return ""
        (method, argstring, docstring) = self.commandDict[name]
        s = "  " + name
        pad = self.longestCommand - len(name) + 2
        s += " " * pad
        s += argstring
        pad = self.longestArgumentString - len(argstring) + 2
        s += " " * pad
        s += docstring
        return s
        
    def documentOption(self, name, longestValue = 1):
        if name not in self.optionDict:
            return ""
        (object, docstring) = self.optionDict[name]
        val = object.getInteger()
        s = "     " + name
        pad = self.longestOption - len(name)
        s += " " * pad
        sval = "%d" % val
        s += ":" + sval
        pad = 2 + max(0, longestValue - len(sval))
        s += " " * pad
        s += docstring
        return s

    def doHelp(self, args):
        commandNames = []
        optionNames = []
        for arg in args:
            if arg in self.commandDict:
                commandNames.append(arg)
            elif arg in self.optionDict:
                optionNames.append(arg)
            else:
                self.errMsg("Unknown command or option '%s'" % arg)
                return False
        if len(args) == 0:
            commandNames = self.commandDict.keys()
            commandNames.sort()
            optionNames = self.optionDict.keys()
            optionNames.sort()
        for command in commandNames:
            self.outMsg(self.documentCommand(command))
        if len(optionNames) > 0:
            self.outMsg("  Options")
        longestValue = 0
        for o in optionNames:
            if o in self.optionDict:
                (option, docstring) = self.optionDict[o]
                val = option.getInteger()
                longestValue = max(longestValue, len("%d" % val))
        for o in optionNames:
            self.outMsg(self.documentOption(o, longestValue))
        return True

    def doOption(self, args):
        if len(args) != 2:
            self.errMsg("Option command requires two arguments")
            return False
        if not args[0] in self.optionDict:
            self.errMsg("Invalid option name '%s'" % args[0])
            return False
        try:
            val = int(args[1])
        except:
            self.errMsg("Invalid option value %s" % args[1])
            return False
        (option, docstring) = self.optionDict[args[0]]
        option.set(val)
        return True

    # Make it possible to handle path names with spaces, as long as they are enclosed in quotes
    def makeFileName(self, args):
        fname = ' '.join(args)
        if len(fname) > 0 and fname[0] == "'" or fname[0] == '"':
            fname = fname[1:]
        if len(fname) > 0 and fname[-1] == "'" or fname[-1] == '"':
            fname = fname[:-1]
        return fname
        

    def doSource(self, args):
        fname = self.makeFileName(args)
        try:
            cfile = open(fname, 'r')
        except:
            self.errMsg("Couldn't open file '%s'" % fname)
            return False
        self.fileStack = [cfile] + self.fileStack

        return True

    def doLog(self, args):
        fname = self.makeFileName(args)
        try:
            lfile = open(fname, 'w')
        except:
            self.errMsg("Couldn't open file '%s'" % fname)
            return False
        self.outFiles.append(lfile)
        return True

    def doComment(self, args):
        return True

        
                
