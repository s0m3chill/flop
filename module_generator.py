import os
import pathlib
import shutil
import argparse
from posixpath import dirname

class ArgumentsParser:
    __fallbackName = 'Default'

    def parseUserInput(self):
        parser = argparse.ArgumentParser(description = 'Generates Flutter submodule architecture based on template')
        parser.add_argument('-t', '--Template', help = 'Name of template to generate from')
        parser.add_argument('-n', '--Name', help = 'Name of generated module')
        args = parser.parse_args()
        self.templateName = args.Template if args.Template else self.__fallbackName
        self.templatePath = os.getcwd() + '/' + self.templateName
        self.moduleName = args.Name if args.Name else self.__fallbackName


class ModuleParser:
    __parsedExtension = '.dart'

    def __init__(self, templateName, moduleName, generatedModuleName):
        self.templateName = templateName
        self.moduleName = moduleName
        self.generatedModuleName = generatedModuleName

     # Traverse generated folder and replace template content of files with given extension
    def traverseAndParseFiles(self):
        for root, dirs, files in os.walk(self.generatedModuleName):
            for fileName in files:
               if pathlib.Path(fileName).suffix == self.__parsedExtension:
                  filePath = os.path.join(root, fileName)
                  renamedFilePath = filePath.replace(self.templateName.lower(), self.moduleName.lower())
                  self.__replaceContents(filePath)
                  os.rename(filePath, renamedFilePath)

    # Replace text in the given file from Template text to Module text
    def __replaceContents(self, filePath):
        f = open(filePath,'r')
        lines = f.readlines()
        f.close()
        f = open(filePath,'w')
        for line in lines:
            newline = line.replace(self.templateName, self.moduleName)
            f.write(newline)
        f.close()

# Parse user input arguments and prepare names / paths
argumentsParser = ArgumentsParser()
argumentsParser.parseUserInput()
generatedModuleName = 'gen'

# Copy entire folder tree structure to the generated folder with module name
shutil.copytree(argumentsParser.templatePath, generatedModuleName)

# Parse copied template tree and rename files / contents to module name
moduleParser = ModuleParser(argumentsParser.templateName, argumentsParser.moduleName, generatedModuleName)
moduleParser.traverseAndParseFiles()



       
   
