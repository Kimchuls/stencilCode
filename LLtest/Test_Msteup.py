import math
import time
import os
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


def writeconfig(filename, files):
    file = open(filename, "w")
    for item in files:
        file.write(str(item) + "\n")
    file.close()


def test(readpath, inpath, losspath, imagepath, modelpathNP, modelpath):
    if not os.path.exists("./lossimage-10-10/err-0-0"):
        os.mkdir("./lossimage-10-10/err-0-0")
    if not os.path.exists("./lossimage-10-10/compare-0-0"):
        os.mkdir("./lossimage-10-10/compare-0-0")
    if not os.path.exists("./lossimage-10-10/png-0-0"):
        os.mkdir("./lossimage-10-10/png-0-0")
    start = time.time()
    data = readFile(readpath)
    normalize = np.load(modelpathNP)
    model = load_model(modelpath)
    y_hat = model.predict(data)
    yList = list(y_hat.tolist())
    # for yyiter,yylist in enumerate(yList):
    #     for yyyiter,yyylist in enumerate(yylist):
    #         if yyylist==0.0:
    #             print(yyiter,yyyiter)
    #             exit(0)
    inList = []
    infile = open(inpath, "r")
    inLines = infile.readlines()
    for line in inLines:
        words = line.split(",")[:-1]
        words = [float(word) for word in words]
        inList.append(words)
    infile.close()
    errline = []
    errall = 0.0
    filefile = open(losspath, 'w')
    enum = 0  #
    # plt.figure()
    for (line1, line2) in zip(yList, inList):
        err = 0.0
        plt.figure()  #
        errlist = []  #
        # compare = []
        for (item1, item2) in zip(line1, line2):
            if item2 != 0:
                loss = (item1 - item2) / item2
            else:
                loss = 0
            # loss=abs(item1-item2)
            # if loss>10:
            #     loss=0
            errlist.append([loss, '{0}, {1}'.format(item1, item2)])  #
            # compare.append('{0}, {1}'.format(item1,item2))
            err += loss ** 2
        err /= len(line1)
        err = math.sqrt(err)
        filefile.write(str(err) + '\n')
        errline.append(err)
        errall += err
        errlist = sorted(errlist, key=(lambda x: x[0]))

        err1 = [item[0] for item in errlist]
        err2 = [item[1] for item in errlist]

        writeconfig("./lossimage-10-10/err-0-0/test_{0}.txt".format(enum), err1)
        writeconfig("./lossimage-10-10/compare-0-0/compare_{0}.txt".format(enum), err2)
        plt.plot(err1)  #
        plt.savefig("./lossimage-10-10/png-0-0/train_{0}_test_{1}_test_{2}.png".format(i, j, enum))  #
        plt.close()  #
        enum += 1  #
    plt.plot(errline)
    plt.savefig(imagepath)
    plt.close()
    filefile.close()
    end = time.time()
    print(errall, end - start)
    return errall


if __name__ == '__main__':
    err = []
    i = 0
    j = 0
    # for j in range(0, 17):
    # error = test("./file4-10-10/npSet_LSTM_{0}-1.npy".format(j), "./file4-10-10/anslist_LSTM_{0}.txt".format(j),
    #              './loss-10-10/train_{0}_test_{1}.txt'.format(i, j),
    #              "./lossimage-10-10/train_{0}_test_{1}.png".format(i, j), "./model-10-10/MultiSteup2_{0}.npy".format(i),
    #              "./model-10-10/MultiSteup2_{0}.h5".format(i))
    # err.append(error)
    # string = ""
    # for item in err:
    #     string += str(item) + ","
    # print(string)
    # test("./file/npSet_LSTM_{0}-1.npy".format(0), "./file/anslist_LSTM_{0}.txt".format(0))
    # file = open("loss-1.csv", "w")
    for i in range(0,1):
        print("position {0}".format(i))
        doLSTM("./path8-10-10/npSet_LSTM_{0}.npy".format(i), "./model-10-10/MultiSteup2_{0}.npy".format(i),
               "./model-10-10/MultiSteup2_{0}.h5".format(i))
        err = []
        for j in range(0, 2):
            error = test("./file/npSet_LSTM_{0}-1.npy".format(j), "./file/anslist_LSTM_{0}.txt".format(j),
                         './loss/train_{0}_test_{1}.txt'.format(i, j),
                         "./lossimage/train_{0}_test_{1}.png".format(i, j), "./model-10-1/MultiSteup2_{0}.npy".format(i),
                   "./model-10-1/MultiSteup2_{0}.h5".format(i))
            err.append(error)
        string = ""
        for item in err:
            string += str(item) + ","
        print(string)
    file.write(string + "\n")
    # file.close()

'''
data = readFile("npSet_LSTM-1.npy")
# 归一化
normalize = np.load("./MultiSteup2.npy")
# data = NormalizeMultUseData(data, normalize)
model = load_model("./MultiSteup2.h5")
# test_X = data.reshape(1,data.shape[0],data.shape[1])
y_hat = model.predict(data)
yList = list(y_hat.tolist())
outfile = open("outfile.txt", "w")
for line in yList:
    for item in line:
        outfile.write(str(item) + ",")
    outfile.write("\n")
outfile.close()

inList = []
infile = open("anslist_LSTM.txt", "r")
inLines = infile.readlines()
for line in inLines:
    words = line.split(",")[:-1]
    words = [float(word) for word in words]
    inList.append(words)
infile.close()

errfile = open("errfile.txt", "w")
errline = []
errall = 0.0
for (line1, line2) in zip(yList, inList):
    err = 0.0
    for (item1, item2) in zip(line1, line2):
        err += (item1 - item2) ** 2
    err /= len(line1)
    errline.append(err)
    errfile.write(str(err) + "\n")
    errall += err
print(errall)
errfile.write(str(errall) + "\n")
errfile.close()
'''
