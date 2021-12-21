import os
import pathlib
import shutil
import argparse
from posixpath import dirname

# Replaces text in the given file from Template text to Module text
def replaceContents(file):
    f = open(file,'r')
    lines = f.readlines()
    f.close()
    f = open(file,'w')
    for line in lines:
        newline = line.replace(templateName, moduleName)
        f.write(newline)
    f.close()

# Module name parser
parser = argparse.ArgumentParser(description = 'Generates Flutter submodule architecture based on template')
parser.add_argument('-module', '--Module', help = 'Name of generated module')
args = parser.parse_args()

# Constants
extension = '.dart'
templateName = 'Template'
templatePath = os.getcwd() + '/' + templateName
moduleName = args.Module if args.Module else templateName
generatedModuleName = moduleName+'_generated'

# Copy entire folder tree structure to the generated folder with module name
shutil.copytree(templatePath, generatedModuleName)

# Traverse generated folder and replace template content of files with given extension
for root, dirs, files in os.walk(generatedModuleName):
    for fileName in files:
        if pathlib.Path(fileName).suffix == extension:
            replaceContents(os.path.join(root, fileName))


       
   
