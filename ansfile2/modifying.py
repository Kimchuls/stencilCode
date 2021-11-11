# coding=utf-8
import os
from struct import pack, unpack

import numpy as np

origin = './'
set = './ans2_modify_2'


# def getFileName():
#     items, fileList = [], os.listdir(origin)
#     for item in fileList:
#         if len(item.split(".")) == 2 and item.split(".")[0].isdigit() and item.split(".")[1] == "txt":
#             items.append(int(item.split(".")[0]))
#
#     items = sorted(items)
#     return items

def getFileName():
    fileLen = len(os.listdir(origin))
    items = np.random.randint(1, fileLen, 5)
    items = sorted(items)
    return items


def printf(root, *args):
    string = ""
    for iter, item in enumerate(args):
        string += str(item) + (" " if iter != len(args) - 1 else "\n")
    root.write(string)


def changeFormat(listorigin):
    string = ""
    for item in listorigin:
        string += "%.25f," % item
    return string


def decode_mode1(fileList):
    dataSet = []
    if not os.path.exists(set):
        os.mkdir(set)
    # os.system("cp {0}/loadfile.txt {1}/loadfile.txt".format(origin, set))
    for iter, item in enumerate(fileList):
        print(iter)

        readFile = open(os.path.join(origin, str(item) + ".txt"), "r")
        lines = readFile.readlines()
        list0 = []
        for iter1 in range(0, 151, 15):
            i = iter1 // 15
            list1 = []
            for j in range(0, 150):
                lineNumber = 2 + 152 * i + 1 + j
                line = lines[lineNumber]
                list2 = line.split(",")[1:-1]
                list2 = [float(x) for x in list2]
                list1.append(list2)
            list0.append(list1)

        standard = list0[-1]
        new_list0 = []
        for items in list0[:-1]:
            new_list1 = []
            for j in range(0, 150):
                new_list2 = [x - y for x, y in zip(standard[j], items[j])]
                new_list1.append(new_list2)
            new_list0.append(new_list1)
        new_list0.append(standard)

        writeFile = open("{0}/{1}.txt".format(set, iter + 1), "w")
        printf(writeFile, lines[0].replace("\n", ""))
        printf(writeFile, lines[1].replace("\n", ""))
        for iter1 in range(0, 151, 15):
            i = iter1 // 15
            printf(writeFile, lines[2 + 152 * i].replace("\n", ""))
            xxx = new_list0[i]
            for j in range(0, 150):
                yyy = "timestep = {0},{1}".format(j, changeFormat(xxx[j]))
                printf(writeFile, yyy)
            yyy = "timestep = {0},{1}".format(j + 1, changeFormat(xxx[j]))
            printf(writeFile, yyy)
        writeFile.close()
        # exit(0)


def decode_tapfile(items):
    readFile = open(os.path.join(origin, "loadfile.txt"), "r")
    writeFile = open(os.path.join(set, "loadfile.txt"), "w")
    lines = readFile.readlines()
    for item in items:
        writeFile.write(lines[item - 1])
    readFile.close()
    writeFile.close()


if __name__ == '__main__':
    items = getFileName()
    decode_mode1(items)
    decode_tapfile(items)
