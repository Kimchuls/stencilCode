import math
import time
import os
import parser
from LLtest.LSTM_Interface_Msteup import doLSTM

import keras.backend.tensorflow_backend as KTF
import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf
from LSTM_Interface_Msteup import *
from keras.models import load_model

# 设定为自增长
config = tf.ConfigProto()
config.gpu_options.allow_growth = True
session = tf.Session(config=config)
KTF.set_session(session)


def reshape_y_hat(y_hat, dim):
    re_y = []
    i = 0
    while i < len(y_hat):
        tmp = []
        for j in range(dim):
            tmp.append(y_hat[i + j])
        i = i + dim
        re_y.append(tmp)
    re_y = np.array(re_y, dtype='float64')
    return re_y


# 多维反归一化
def FNormalizeMult(data, normalize):
    data = np.array(data, dtype='float64')
    # 列
    for i in range(0, data.shape[1]):
        listlow = normalize[i, 0]
        listhigh = normalize[i, 1]
        delta = listhigh - listlow
        # 行
        if delta != 0:
            for j in range(0, data.shape[0]):
                data[j, i] = data[j, i] * delta + listlow

    return data


# 使用训练数据的归一化
def NormalizeMultUseData(data, normalize):
    for i in range(0, data.shape[1]):

        listlow = normalize[i, 0]
        listhigh = normalize[i, 1]
        delta = listhigh - listlow

        if delta != 0:
            for j in range(0, data.shape[0]):
                data[j, i] = (data[j, i] - listlow) / delta

    return data


def readFile(filePath):
    dataFile = np.load(filePath, allow_pickle=True)
    # dataList = list(dataFile.tolist())
    # random.shuffle(dataList)
    # dataList = np.array(dataList)
    return dataFile


def writeConfigFile(filename, files):
    file = open(filename, "w")
    for item in files:
        file.write(str(item) + "\n")
    file.close()


def test():
    start = time.time()
    data = readFile(testDataPath)
    normalize = np.load(modelPathNP)
    model = load_model(modelPath)
    data = NormalizeMultUseData(data, normalize)
    y_hat = model.predict(data)
    del model
    del data
    y_hat = FNormalizeMult(y_hat, normalize)
    del normalize
    yList = list(y_hat.tolist())
    del y_hat

    GTList = []
    GTFile = open(GTPath, "r")
    GTLines = GTFile.readlines()
    for line in GTLines:
        words = line.split(",")[:-1]
        words = [float(word) for word in words]
        GTList.append(words)
    GTFile.close()
    del GTLines, GTFile

    errLine, errAll = [], 0.0
    # enum, errList = 0, []
    lossFile = open(lossPath, 'w')  # test数据 每条iteration对应MSE
    for (line1, line2) in zip(yList, GTList):
        err = 0.0
        plt.figure()
        for (item1, item2) in zip(line1, line2):
            if item2 != 0:
                loss = (item1 - item2) / item2
            else:
                loss = item1
            # errList.append([loss, '{0}, {1}'.format(item1, item2)])
            err += loss ** 2
        err = math.sqrt(err / len(line1))
        lossFile.write(str(err) + '\n')
        errLine.append(err)
        errAll += err
        # errList = sorted(errList, key=(lambda x: x[0]))
        # err1 = [item[0] for item in errList]
        # err2 = [item[1] for item in errList]
    plt.plot(errLine)  # test数据 每条iteration对应MSE 变化图
    plt.savefig(imagePath)
    plt.close()
    lossFile.write("The sum of all errors is: ", str(err) + '\n')
    lossFile.close()
    end = time.time()
    print(end - start)
    del GTList, errLine, errAll, lossFile, err, loss
    # return errAll


def getAllFileName(origin):
    items, fileList = [], os.listdir(origin)
    for item in fileList:
        if len(item.split(".")) == 2 and item.split(".")[1] == "npy" and item.split("-")[0].split('_')[-1].isdigit():
            items.append(int(item.split("-")[0].split('_')[-1]))
    items = sorted(items)
    return items


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-e", "--epoch", default=500)
    parser.add_argument("-ip", "--inputPath", default='./')
    parser.add_argument("-op", "--outputPath", default='./')
    parser.add_argument(
        "-tm", "--testMode", help="test mode for LSTM, 0 for single train, 1 for multiple trains",  default='./')
    parser.add_argument("-tenum", "--testNumber", type=int,
                        nargs='+', help="input file no,  -x=random x")
    args = parser.parse_args()
    epoch, inputPath, outputPath, testMode, testNumber = args.epoch, args.inputPath, args.outputPath, args.testMode, args.testNumber
    trainDataPath = os.path.join(inputPath, "npSet_LSTM.npy")
    modelPathNP = os.path.join(inputPath, "MultiSteup2.npy")
    modelPath = os.path.join(inputPath, "MultiSteup2.h5")
    doLSTM(trainDataPath, modelPathNP, modelPath)

    if testMode == 0:
        testDataPath = os.path.join(inputPath, "npSet_LSTM-1.npy")
        GTPath = os.path.join(inputPath, "anslist_LSTM.txt")
        lossPath = os.path.join(outputPath, "loss_LSTM.txt")
        imagePath = os.path.join(outputPath, "loss_LSTM_image.png")
        test(testDataPath)
    else:
        items = getAllFileName(inputPath)
        for item in items:
            testDataPath = os.path.join(inputPath, "npSet_LSTM_{0}-1.npy".format(item))
            GTPath = os.path.join(inputPath, "anslist_LSTM_{0}.txt".format(item))
            lossPath = os.path.join(outputPath, "loss_LSTM_{0}.txt".format(item))
            imagePath = os.path.join(outputPath, "loss_LSTM_image_{0}.png".format(item))
            test(testDataPath)
