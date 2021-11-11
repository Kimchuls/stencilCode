# coding=utf-8
import os

import matplotlib.pyplot as plt

origin = './'
set = './ans2_modify_2'
cnames = ["red", "green", "blue", "brown", "yellow",
          "black", "purple", "hotpink", "orange", "gray", "darkslategray"]


def getFileName():
    items, fileList = [], os.listdir(set)
    for item in fileList:
        if len(item.split(".")) == 2 and item.split(".")[0].isdigit() and item.split(".")[1] == "txt":
            items.append(int(item.split(".")[0]))

    items = sorted(items)
    return items


# def getFileName():
#     fileLen = len(os.listdir(origin))
#     items=np.random.randint(1,fileLen,2)
#     items = sorted(items)
#     return items


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


def average(lists, times, divides):
    x = 0.0
    length = len(lists)
    for iter in range(int(length * (times - 1) / divides), int(length * times / divides)):
        x += abs(lists[iter])
    return x / len(lists)


def decode_mode1(fileList):
    standardX = [x for x in range(0, 150)]
    loops = 200
    for loop in range(loops):
        print(loop)
        for iter, item in enumerate(fileList):
            fig = plt.figure()
            readFile = open(os.path.join(set, str(item) + ".txt"), "r")
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
                    ave = average(list2, loop, loops)
                    list1.append(ave)
                plt.plot(standardX, list1, color=cnames[i], label=str(iter1))
                list0.append(list1)
            # plt.show()
            plt.savefig('./data/loop_{0}.png'.format(loop), bbox_inches='tight')

if __name__ == '__main__':
    items = getFileName()
    decode_mode1(items)
    # decode_tapfile(items)
