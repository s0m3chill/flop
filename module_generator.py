import os
import pathlib
import shutil
import argparse
from posixpath import dirname

# Replaces text in the given file from Template text to Module text
def replaceContents(filePath):
    f = open(filePath,'r')
    lines = f.readlines()
    f.close()
    f = open(filePath,'w')
    for line in lines:
        newline = line.replace(template, moduleName)
        f.write(newline)
    f.close()

# Module name parser
parser = argparse.ArgumentParser(description = 'Generates Flutter submodule architecture based on template')
parser.add_argument('-t', '--Template', help = 'Name of template to generate from')
parser.add_argument('-n', '--Name', help = 'Name of generated module')
args = parser.parse_args()

# Constants
extension = '.dart'
fallbackName = 'Default'
template = args.Template if args.Template else fallbackName
templatePath = os.getcwd() + '/' + template
moduleName = args.Name if args.Name else fallbackName
generatedModuleName = 'gen_' + moduleName

# Copy entire folder tree structure to the generated folder with module name
shutil.copytree(templatePath, generatedModuleName)

# Traverse generated folder and replace template content of files with given extension
for root, dirs, files in os.walk(generatedModuleName):
    for fileName in files:
        if pathlib.Path(fileName).suffix == extension:
            filePath = os.path.join(root, fileName)
            replaceContents(filePath)
