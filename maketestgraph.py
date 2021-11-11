import argparse
import os

import matplotlib.pyplot as plt
import numpy as np


def getFileName(origin):
    items, fileList = [], os.listdir(origin)
    for item in fileList:
        if len(item.split(".")) == 2 and item.split(".")[0].isdigit() and item.split(".")[1] == "txt":
            items.append(int(item.split(".")[0]))

    items = sorted(items)
    return items


def average(words):
    sum = 0.0
    for item in words:
        sum += float(item)
    sum /= len(words)
    return sum


def do(f, id, v):
    filepath = os.path.join(f, "{0}.txt".format(id))
    writepath = os.path.join(f, "ave{0}.txt".format(id))
    graphpath = os.path.join(f, "graph{0}.png".format(id))
    subpath = os.path.join(f, "sub{0}.png".format(id))
    file = open(filepath, "r")
    writefile = open(writepath, "w")
    line = file.readline()
    line = file.readline()
    numlists = []
    for _ in range(2):
        numlist = []
        line = file.readline()
        writefile.write(line)
        for _ in range(v + 1):
            line = file.readline()
            words = line.split(",")[1:-1]
            ave = average(words)
            numlist.append(ave)
            writefile.write(str(ave) + '\n')
        numlists.append(numlist)
    file.close()
    writefile.close()

    sublist = []
    ori, sub = numlists[0], numlists[1]
    for item1, item2 in zip(ori, sub):
        sublist.append(item1 - item2)

    plt.figure()
    plt.plot([i for i in range(v + 1)], numlists[0], 'r')
    plt.plot([i for i in range(v + 1)], numlists[1], 'b')
    plt.savefig(graphpath, bbox_inches='tight')

    plt.figure()
    plt.plot([i for i in range(v + 1)], sublist, 'g')
    plt.savefig(subpath, bbox_inches='tight')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-v", "--v", type=int, default=3000)
    parser.add_argument("-f", "--f", default='./ansfile0')
    args = parser.parse_args()
    f = args.f
    v = args.v
    namelist = getFileName(f)
    for iter, name in enumerate(namelist):
        do(f, iter + 1, v)
