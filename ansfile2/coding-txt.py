# coding=utf-8
import os
import random
from struct import pack, unpack

import numpy as np

origin = './'
save = ['./data/train.txt', './data/test.txt']
tap = os.path.join(origin, 'loadfile.txt')
fileLen = 160


def getFileName():
    trainLen, testLen = 2, 5
    train_items = sorted(np.random.randint(1, fileLen, trainLen))
    test_items = sorted(np.random.randint(1, fileLen, testLen))
    # items = [120]
    return [train_items, test_items]


def printf(root, *args):
    string = ""
    for iter, item in enumerate(args):
        string += str(item) + (" " if iter != len(args) - 1 else "\n")
    root.write(string)


def changeFormat(listorigin):
    string = ""
    leng = len(listorigin)
    for iters in range(leng - 1):
        string += "%.25f," % listorigin[iters]
    string += str(listorigin[-1]) + ","
    return string


def decode_mode1(id, itemList):
    global length
    tapFile = open(tap, "r")
    tapLines = tapFile.readlines()
    path = save[id]
    fileList = itemList[id]
    writeFile = open(path, "w")
    for iter, item in enumerate(fileList):
        print(iter, item)
        tapLine = tapLines[iter]
        y_origin = float(tapLine.split("SZErrorBound = ")[1].replace("\n", ""))

        readFile = open(os.path.join(origin, str(item) + ".txt"), "r")
        lines = readFile.readlines()
        randomI = 1
        for iter1 in range(0, 150, 15):
            i = iter1 // 15
            if i != randomI:
                continue
            list1 = []
            aveList = []
            for j in range(iter1, 150):
                list2 = [j / 150., i / 15., y_origin]
                lineNumber = 2 + 152 * i + 1 + j
                line = lines[lineNumber]
                list3 = line.split(",")[1:-1]
                list3 = [float(x) for x in list3]
                ave = 0.0
                for item_list3 in list3:
                    ave += item_list3
                aveList.append(ave / len(list3))
                list2 = list2 + list3 + [1]
                list1.append(list2)
                length = len(list2) - 4
            for j in range(iter1, 150):
                ave = aveList[random.randint(0, len(aveList) - 1)]
                # nowave = random.random()
                # randomList = [random.random() for _ in range(3)] + [nowave]
                # for i in range(1, length):
                #     if 1.0 * nowave / i <= ave:
                #         nowrandom = random.uniform(nowave / i, 1)
                #     else:
                #         nowrandom = random.uniform(0, nowave / i)
                #     randomList.append(nowrandom)
                #     nowave += nowrandom
                randomList = [random.random() for _ in range(3)] + [random.randint(0, 1)] * length
                randomList = randomList + [0]
                list1.append(randomList)
            random.shuffle(list1)
            for itemList1 in list1:
                printf(writeFile, changeFormat(itemList1))
        readFile.close()
    writeFile.close()
    tapFile.close()


if __name__ == '__main__':
    items = getFileName()
    decode_mode1(0, items)
    decode_mode1(1, items)
