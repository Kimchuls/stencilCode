# coding=utf-8
import os
import random
from struct import pack, unpack

import numpy as np

origin = './'
tap = os.path.join(origin, 'loadfile.txt')
fileLen = 160

# def getFileName():
# items = np.random.randint(1, fileLen, 4)
# items = [38, 1, 99, 147]
# items = [57, 23, 78, 121]
# items = [35, 36, 37, 38]
# items=[31,32,33,34]
# items=[56,57,58,59]
# items = [random.randint(1, 10) for _ in range(4)]
# items = sorted(items)
# return items


length = 10


def decode_LSTM(fileList, anslistpath, npSetpath):
    dataSet = []
    tapFile = open(tap, "r")
    tapLines = tapFile.readlines()
    # anslist = open(anslistpath, "w")
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
            for j in range(0, 150):
                lineNumber = 2 + 152 * i + 1 + j
                line = lines[lineNumber]
                list3 = line.split(",")[1:-1]

                list2 = [j / 150., iter1 / 15., y_origin] + [float(x) for x in list3]
                list1.append(list2)

            for i in range(iter1, 150 - length - 10):
                item_dataSet = list1[i:i + length]
                item_dataSet.append(list1[i + length + 10])
                # print(np.array(item_dataSet).shape)
                # exit(0)
                dataSet.append(item_dataSet)
                # for anslist_item in list1[i + length + 10]:
                #     anslist.write(str(anslist_item) + ",")
                # anslist.write("\n")
    npSet = np.array(dataSet)
    np.save(os.path.join(origin, npSetpath), npSet)
    # anslist.close()
    print(npSet.shape)


def decode_LINEAR(fileList):
    dataSet = []
    tapFile = open(tap, "r")
    tapLines = tapFile.readlines()
    anslist = open("anslist_LINEAR.txt", "w")
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
            # list1 = []
            for j in range(0, 150):
                lineNumber = 2 + 152 * i + 1 + j
                line = lines[lineNumber]
                list3 = line.split(",")[1:-1]
                list3 = [float(x) for x in list3]

                list2 = [j / 150., iter1 / 15., y_origin]
                dataSet.append(list2)

                # for i in range(iter1, 150 - length):
                #     item_dataSet = list1[i:i + length + 1]
                #     dataSet.append(item_dataSet)
                for anslist_item in list3:
                    anslist.write(str(anslist_item) + ",")
                anslist.write("\n")
    npSet = np.array(dataSet)
    np.save(os.path.join(origin, "npSet_LINEAR.npy"), npSet)
    anslist.close()
    print(npSet.shape)


if __name__ == '__main__':
    # items = getFileName()
    item_exp = [1, 2, 3, 4, 5, 6, 7, 8]
    item_tst = [1, 2, 9, 10]
    for i in range(16):
        # x=set()
        # while len(x)<4:
        #     x.add(random.randint(i * 10+1, i * 10 + 10))
        items = [i * 10 + j for j in item_exp]
        # items = [random.randint(i * 10, i * 10 + 10) for _ in range(4)]
        decode_LSTM(items, "./path/anslist_LSTM_{0}.txt".format(i), "path/npSet_LSTM_{0}.npy".format(i))
    # decode_LINEAR(items)
