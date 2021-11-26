# coding=utf-8
import argparse
import os
import random

import numpy as np


def getAllFileName(origin):
    items, fileList = [], os.listdir(origin)
    for item in fileList:
        if len(item.split(".")) == 2 and item.split(".")[0].isdigit() and item.split(".")[1] == "txt":
            items.append(int(item.split(".")[0]))
    items = sorted(items)
    return items


def getFiles(origin, ids):
    items = []
    if ids[0] < 0:
        id = (-1) * ids[0]
        length = len(origin)
        newSet = set()
        while len(newSet) < id:
            ran = random.randint(1, length)
            newSet.add(ran)
        ids = list(newSet)
        print("random list:")
        print(ids)
    for id in ids:
        items.append(origin[id - 1])
    return items


def train_LSTM(fileList, noList, inputPath, outputPath):
    dataSet = []
    tap = os.path.join(inputPath, 'loadfile.txt')
    tapFile = open(tap, "r")
    tapLines = tapFile.readlines()
    for iter, item in enumerate(fileList):
        if (iter + 1) not in noList:
            continue
        print(iter, item)
        y_origin = float(tapLines[iter].split(
            "SZErrorBound = ")[1].replace("\n", ""))
        readFile = open(os.path.join(inputPath, str(item) + ".txt"), "r")
        lines = readFile.readlines()
        for iter1 in range(2):
            list1 = []
            start = int(
                lines[2 + (outputLeng + 1) * iter1].replace("******* Injected Iters: ", "").replace(" *******\n", ""))
            for j in range(outputLeng):
                lineNumber = 2 + (outputLeng + 1) * iter1 + 1 + j
                line = lines[lineNumber]
                list3 = line.split(",")[1:-1]

                list2 = [j / float(outputLeng - 1), start / float(outputLeng - 1),
                         y_origin] + [float(x) for x in list3]
                list1.append(list2)
            for i in range(start, outputLeng, outputRound):
                if i + outputTo - 1 >= outputLeng:
                    break
                item_dataSet = list1[i:i + outputFrom]
                item_dataSet.append(list1[i + outputTo - 1])
                # print(np.array(item_dataSet).shape)
                # exit(0)
                dataSet.append(item_dataSet)
            break
    npSet = np.array(dataSet)
    np.save(os.path.join(outputPath, "npSet_LSTM.npy"), npSet)
    print(npSet.shape)


def test_LSTM(fileList, noList, inputPath, outputPath):
    dataSet = []
    tap = os.path.join(inputPath, 'loadfile.txt')
    tapFile = open(tap, "r")
    tapLines = tapFile.readlines()
    anslist = open(os.path.join(outputPath, "anslist_LSTM.txt"), "w")
    for iter, item in enumerate(fileList):
        if (iter + 1) not in noList:
            continue
        print(iter, item)
        y_origin = float(tapLines[iter].split(
            "SZErrorBound = ")[1].replace("\n", ""))

        readFile = open(os.path.join(inputPath, str(item) + ".txt"), "r")
        lines = readFile.readlines()
        for iter1 in range(injectnum):
            list1 = []
            start = int(
                lines[2 + (outputLeng + 1) * iter1].replace("******* Injected Iters: ", "").replace(" *******\n", ""))
            for j in range(outputLeng):
                lineNumber = 2 + (outputLeng + 1) * iter1 + 1 + j
                line = lines[lineNumber]
                list3 = line.split(",")[1:-1]

                list2 = [j / float(outputLeng - 1), start / float(outputLeng - 1),
                         y_origin] + [float(x) for x in list3]
                list1.append(list2)

            for i in range(start, outputLeng, outputRound):
                if i + outputTo - 1 >= outputLeng:
                    break
                item_dataSet = list1[i:i + outputFrom]
                dataSet.append(item_dataSet)
                for anslist_item in list1[i + outputTo - 1]:
                    anslist.write(str(anslist_item) + ",")
                anslist.write("\n")
            if testmode == 1:
                break
    npSet = np.array(dataSet)
    np.save(os.path.join(outputPath, "npSet_LSTM-1.npy"), npSet)
    anslist.close()
    print(npSet.shape)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-tri", "--traininput",
                        help="train input file fold", default='./')
    parser.add_argument("-tro", "--trainoutput",
                        help="train output file fold", default='./')
    parser.add_argument("-tei", "--testinput",
                        help="test input file fold", default='./')
    parser.add_argument("-teo", "--testoutput",
                        help="test output file fold", default='./')
    # test mode
    parser.add_argument("-tem", "--testmode", type=int,
                        help="test mode 1: one iteration, 2: all iteration", default=1)
    parser.add_argument("-in", "--injectnum", type=int,
                        help="inject error times in each file", default=10)
    # data file range
    parser.add_argument("-trin", "--trainputno", type=int,
                        nargs='+', help="input file no,  -x=random x")
    parser.add_argument("-tein", "--testinputno", type=int,
                        nargs='+', help="input file no,  -x=random x")
    parser.add_argument("-il", "--inputlength", type=int,
                        help="input file iteration number", default=501)
    # data items range
    parser.add_argument("-pf", "--prefrom", type=int,
                        help="predict from continuous iter numbers", default=20)
    parser.add_argument("-pt", "--preto", type=int,
                        help="predict to iter number", default=21)
    parser.add_argument("-pr", "--preround", type=int,
                        help="predict data round", default=20)

    args = parser.parse_args()
    if not os.path.exists(args.trainoutput):
        os.mkdir(args.trainoutput)
    if not os.path.exists(args.testoutput):
        os.mkdir(args.testoutput)

    trainItems = getAllFileName(args.traininput)
    trainFiles = getFiles(trainItems, args.trainputno)
    testItems = getAllFileName(args.testinput)
    testFiles = getFiles(testItems, args.testinputno)
    outputLeng, outputFrom, outputTo, outputRound, testmode, injectnum = args.inputlength, args.prefrom, args.preto, args.preround, args.testmode, args.injectnum

    train_LSTM(trainItems, args.trainputno, args.traininput, args.trainoutput)
    test_LSTM(testItems, args.testinputno, args.testinput, args.testoutput)
