# coding=utf-8
import argparse
import os


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


def decode_mode1():
    if not os.path.exists(save):
        os.mkdir(save)
    readFile = open(os.path.join(origin, str(item) + ".txt"), "r")
    writeFile = open("{0}/{1}.txt".format(save, item), "w")
    line = readFile.readline()
    printf(writeFile, line.replace("\n", ""))
    line = readFile.readline()
    printf(writeFile, line.replace("\n", ""))
    lines = []
    list0 = []
    for iter1 in range(num):
        list1 = []
        line = readFile.readline()
        lines.append(line)
        for j in range(inputlength):
            line = readFile.readline()
            list2 = line.split(",")[1:-1]
            list2 = [float(x) for x in list2]
            list1.append(list2)
            del list2
        print(len(list1))
        list0.append(list1)
        del list1

    standard = list0[-1]
    new_list0 = []
    for items in list0[:-1]:
        new_list1 = []
        for j in range(inputlength):
            new_list2 = [x - y for x, y in zip(standard[j], items[j])]
            new_list1.append(new_list2)
            del new_list2
        print("length newList1",len(new_list1))
        new_list0.append(new_list1)
        del new_list1
    print("length newList1", len(new_list0))

    del list0
    del standard

    for iter1 in range(num-1):
        printf(writeFile, lines[iter1].replace("\n", ""))
        xxx = new_list0[iter1]
        for j in range(inputlength):
            yyy = "timestep = {0},{1}".format(j, changeFormat(xxx[j]))
            printf(writeFile, yyy)
            del yyy
        del xxx
    writeFile.close()
    del new_list0
    del lines
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
                        help="train input file fold", default='../11250542')
    parser.add_argument("-sp", "--savepath",
                        help="train output file fold", default='./modify')
    parser.add_argument("-fn", "--filename",
                        help="file name without suffix(.txt)", default='1')
    parser.add_argument("-in", "--injectnum", type=int,
                        help="inject error times in each file", default=3)
    parser.add_argument("-il", "--inputlength", type=int, help="input file iteration number", default=211)
    args = parser.parse_args()
    origin = args.originpath
    save = args.savepath
    num = args.injectnum
    inputlength = args.inputlength

    item = args.filename
    print(item)
    decode_mode1()
