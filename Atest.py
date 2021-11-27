import os

path  = './11271337/1.txt'
readFile = open(path,"r")
readLines = readFile.readlines()
print(len(readLines[5].split(',')[1:-1]))