import random
import time

import keras.backend.tensorflow_backend as KTF
import numpy as np
import tensorflow as tf
from keras.layers import LSTM
from keras.layers.core import Dense, Activation, Dropout
from keras.models import Sequential

# 设定为自增长
config = tf.ConfigProto()
config.gpu_options.allow_growth = True
session = tf.Session(config=config)
KTF.set_session(session)


def create_dataset(data):
    '''
    对数据进行处理
    '''
    dim0, dim1 = data.shape[0], data.shape[1]
    print(dim0, dim1)
    dataList = list(data.tolist())
    train_X, train_Y = [], []
    for i in range(dim0):
        sequence = dataList[i]
        train_X.append(sequence[:-1])
        train_Y.append(sequence[-1])
    train_X = np.array(train_X, dtype='float64')
    train_Y = np.array(train_Y, dtype='float64')
    # print(train_X.shape)
    # print(train_Y.shape)
    return train_X, train_Y


def NormalizeMult(data):
    '''
    归一化 适用于单维和多维
    返回归一化后的数据和最大最小值
    '''
    normalize = np.arange(2 * data.shape[1], dtype='float64')
    normalize = normalize.reshape(data.shape[1], 2)

    for i in range(0, data.shape[1]):

        list = data[:, i]
        listlow, listhigh = np.percentile(list, [0, 100])

        normalize[i, 0] = listlow
        normalize[i, 1] = listhigh

        delta = listhigh - listlow
        if delta != 0:
            for j in range(0, data.shape[0]):
                data[j, i] = (data[j, i] - listlow) / delta

    return data, normalize


def trainModel(train_X, train_Y, epoch):
    '''
    trainX，trainY: 训练LSTM模型所需要的数据
    '''
    print(train_X.shape, train_Y.shape)
    model = Sequential()
    # model.add(LSTM(output_dim=128, activation='sigmoid', inner_activation='hard_sigmoid')) #single layer LSTM
    model.add(LSTM(140, input_shape=(train_X.shape[1], train_X.shape[2]), return_sequences=True))
    model.add(Dropout(0.2))
    model.add(LSTM(140, return_sequences=True))
    model.add(Dropout(0.2))
    model.add(LSTM(140, return_sequences=False))
    model.add(Dropout(0.2))

    model.add(Dense(train_Y.shape[1]))
    model.add(Activation("relu"))

    model.compile(loss='mse', optimizer='adam')
    model.fit(train_X, train_Y, epochs=epoch, batch_size=128, verbose=1)

    return model


def readFile(filePath):
    dataFile = np.load(filePath, allow_pickle=True)
    dataList = list(dataFile.tolist())
    random.shuffle(dataList)
    dataList = np.array(dataList)
    return dataList


def doLSTM(readpath, modelpathNP,modelpath):
    data = readFile(readpath)
    data, normalize = NormalizeMult(data)
    train_X, train_Y = create_dataset(data)
    model = trainModel(train_X, train_Y, 500)
    np.save(modelpathNP, normalize)
    model.save(modelpath)


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("-e", "--epoch", default=500)
    args = parser.parse_args()

    time_start = time.time()
    data = readFile("./path/npSet_LSTM_0.npy")
    # print(np.array(data).shape)
    print(data.shape)
    # 归一化的加入

    # data, normalize = NormalizeMult(data)
    train_X, train_Y = create_dataset(data)
    # print(train_X.shape)
    # print(train_X.shape)
    # exit(0)
    model = trainModel(train_X, train_Y, int(args.epoch))

    # np.save("./MultiSteup2.npy", normalize)

    model.save("./MultiSteup2.h5")

    time_end = time.time()
    time_c = time_end - time_start  # 运行所花时间
    print('time cost', time_c, 's')
    # from Test_Msteup import test
    # test(model)
