# coding=utf-8
import os
from struct import pack, unpack

import numpy as np

origin = './'
tap = os.path.join(origin, 'loadfile.txt')
fileLen = 160


# def getFileName():
#     items, fileList = [], os.listdir(origin)
#     for item in fileList:
#         if len(item.split(".")) == 2 and item.split(".")[0].isdigit() and item.split(".")[1] == "txt":
#             items.append(int(item.split(".")[0]))
#
#     items = sorted(items)
#     return items

def getFileName():
    items = np.random.randint(1, fileLen, 2)
    # items=[38]
    # items = [57]
    items = sorted(items)+[38,57]
    return items


def getBinary(item):
    ans = []
    for _ in range(8):
        ans = ans + [item % 2]
        item //= 2
    return ans


def get_binary_vector(floatNum):
    floatList = [i for i in pack('f', floatNum)]
    ansList = []
    for i in floatList:
        ans = getBinary(i)
        ansList = ansList + ans
    return ansList


'''
mode:
x_step = [now_step, error_step, mode, bound(4), x*y*z variables (4*x*y*z)]
[ x_0, x_1, ..., x_9] => x_10
'''
length = 10


def decode_mode1(fileList):
    dataSet = []
    tapFile = open(tap, "r")
    tapLines = tapFile.readlines()
    x = set()
    for iter, item in enumerate(fileList):
        print(iter, item)
        # get the origin variable
        tapLine = tapLines[iter]
        y_origin = float(tapLine.split("SZErrorBound = ")[1].replace("\n", ""))
        # y = get_binary_vector(y_origin)

        readFile = open(os.path.join(origin, str(item) + ".txt"), "r")
        lines = readFile.readlines()
        randomI = 1
        for iter1 in range(0, 150, 15):
            i = iter1 // 15
            # print(i,randomI)
            if i != randomI:
                continue
            list1 = []
            for j in range(0, 150):
                # list2 = getBinary(j) +getBinary(iter1) + [y_origin]
                list2 = [j / 150., iter1 / 15., y_origin]
                # list2=[]
                lineNumber = 2 + 152 * i + 1 + j
                line = lines[lineNumber]

                list3 = line.split(",")[1:-1]
                list3 = [float(x) for x in list3]

                length_list3 = len(list3)
                loops = 270
                for loop in range(loops):
                    ave = 0.0
                    count = 0
                    for iter_list3 in range(int(length_list3 * loop / loops), int(length_list3 * (loop + 1) / loops)):
                        ave += list3[iter_list3]
                        count += 1
                    list2.append(ave / count)
                list1.append(list2)
            dataSet=dataSet+list1
            # for i in range(iter1, 150 - length):
            #     item_dataSet = list1[i:i + length + 1]
            #     dataSet.append(item_dataSet)
    npSet = np.array(dataSet)
    print(npSet.shape)
    np.save(os.path.join(origin, "npSet.npy"), npSet)
    print(npSet.shape)


if __name__ == '__main__':
    items = getFileName()
    decode_mode1(items)
