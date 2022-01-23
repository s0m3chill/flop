import os
import pathlib
import shutil
import argparse
import re

class ArgumentsParser:
    __fallbackName = 'application'
    __templatesFolder = '/templates/'

    def parseUserInput(self):
        parser = argparse.ArgumentParser(description = 'Produces Flutter project architecture based on template')
        parser.add_argument('-t', '--Template', help = 'Name of template to produce from')
        parser.add_argument('-n', '--Name', help = 'Name of the produced module')
        args = parser.parse_args()
        self.templateName = args.Template if args.Template else self.__fallbackName
        self.templatePath = os.getcwd() + self.__templatesFolder + self.templateName
        self.moduleName = args.Name if args.Name else self.__fallbackName


class ModuleParser:
    __parsedExtensions = ['.dart', '.yaml', '.md']

    def __init__(self, templateName, moduleName, generatedModuleName):
        self.templateName = templateName
        self.moduleName = moduleName
        self.generatedModuleName = generatedModuleName

     # Traverse generated folder and replace template content of files with given extension
    def traverseAndParseFiles(self):
        for root, dirs, files in os.walk(self.generatedModuleName):
            for fileName in files:
               if self.__parsedExtensions.__contains__(pathlib.Path(fileName).suffix):
                  filePath = os.path.join(root, fileName)
                  renamedFilePath = filePath.replace(self.templateName.lower(), self.moduleName.lower())
                  self.__replaceContents(filePath)
                  os.rename(filePath, renamedFilePath)

    # Replace text in the given file from Template text to Module text
    def __replaceContents(self, filePath):
        with open(filePath, 'r+') as f:
            text = f.read()
            text = re.sub(self.templateName, self.moduleName, text)
            text = re.sub(self.templateName.capitalize(), self.moduleName.capitalize(), text)
            f.seek(0)
            f.write(text)
            f.truncate()
            f.close()

##########################################################################################################

# Parse user input arguments and prepare names / paths
argumentsParser = ArgumentsParser()
argumentsParser.parseUserInput()
generatedTemplatesContainerFolder = 'gen'
generatedTemplateFolder = generatedTemplatesContainerFolder + '/' + argumentsParser.moduleName

# Create generated folder which contains templates if does not exist yet
if pathlib.Path(generatedTemplatesContainerFolder).is_dir == False:
    os.mkdir(generatedTemplatesContainerFolder)

# Remove previously created template if such exists
possiblyExistingGeneratedTemplatePath = os.path.join(os.getcwd(), generatedTemplateFolder)
if os.path.exists(possiblyExistingGeneratedTemplatePath):
    shutil.rmtree(possiblyExistingGeneratedTemplatePath)

# Copy entire folder tree structure to the generated folder with module name
shutil.copytree(argumentsParser.templatePath, generatedTemplateFolder)

# Parse copied template tree and rename files / contents to module name
moduleParser = ModuleParser(argumentsParser.templateName, argumentsParser.moduleName, generatedTemplateFolder)
moduleParser.traverseAndParseFiles()
