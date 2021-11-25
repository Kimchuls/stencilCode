# coding=utf-8
import argparse
import os


def getFileName():
    items, fileList = [], os.listdir(origin)
    for item in fileList:
        if len(item.split(".")) == 2 and item.split(".")[0].isdigit() and item.split(".")[1] == "txt":
            items.append(int(item.split(".")[0]))

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
    if not os.path.exists(save):
        os.mkdir(save)
    for iter, item in enumerate(fileList):
        print(iter)
        readFile = open(os.path.join(origin, str(item) + ".txt"), "r")
        lines = readFile.readlines()
        list0 = []
        for iter1 in range(num):
            list1 = []
            for j in range(inputlength):
                lineNumber = 2 + (inputlength+1) * iter1 + 1 + j
                line = lines[lineNumber]
                list2 = line.split(",")[1:-1]
                list2 = [float(x) for x in list2]
                list1.append(list2)
            list0.append(list1)

        standard = list0[-1]
        new_list0 = []
        for items in list0[:-1]:
            new_list1 = []
            for j in range(inputlength):
                new_list2 = [x - y for x, y in zip(standard[j], items[j])]
                new_list1.append(new_list2)
            new_list0.append(new_list1)
        new_list0.append(standard)

        writeFile = open("{0}/{1}.txt".format(save, iter + 1), "w")
        printf(writeFile, lines[0].replace("\n", ""))
        printf(writeFile, lines[1].replace("\n", ""))
        for iter1 in range(num-1):
            printf(writeFile, lines[2 + (inputlength+1) * iter1].replace("\n", ""))
            xxx = new_list0[iter1]
            for j in range(inputlength):
                yyy = "timestep = {0},{1}".format(j, changeFormat(xxx[j]))
                printf(writeFile, yyy)
        writeFile.close()
        # exit(0)


def decode_tapfile(items):
    readFile = open(os.path.join(origin, "loadfile.txt"), "r")
    writeFile = open(os.path.join(save, "loadfile.txt"), "w")
    lines = readFile.readlines()
    for item in items:
        writeFile.write(lines[item - 1])
    readFile.close()
    writeFile.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-op", "--originpath",
                        help="train input file fold", default='./')
    parser.add_argument("-sp", "--savepath",
                        help="train output file fold", default='./modify')
    parser.add_argument("-in", "--injectnum", type=int,
                        help="inject error times in each file", default=11)
    parser.add_argument("-il", "--inputlength", type=int, help="input file iteration number", default=151)
    args = parser.parse_args()
    origin = args.originpath
    save = args.savepath
    num = args.injectnum
    inputlength = args.inputlength

    items = getFileName()
    decode_mode1(items)
    decode_tapfile(items)
