# -*- coding: UTF-8 -*-

import random

import numpy as np


# 加载数据
def load_exdata(filename):
    data = []
    with open(filename, 'r') as f:
        for line in f.readlines():
            line = line.split(',')
            current = [float(item) for item in line]
            data.append(current)
    return data


# 特征缩放
def featureNormalize(X):
    X_norm = X
    mu = np.zeros((1, X.shape[1]))
    sigma = np.zeros((1, X.shape[1]))
    for i in range(X.shape[1]):
        mu[0, i] = np.mean(X[:, i])  # 均值
        sigma[0, i] = np.std(X[:, i])  # 标准差
    # print(mu)
    # print(sigma)
    # exit(0)
    for i in range(len(sigma[0])):
        #     print(sigma[i])
        # exit(0)
        if sigma[0][i] == 0.0:
            sigma[0][i] = 1.0
    X_norm = (X - mu) / sigma
    return X_norm, mu, sigma


# 计算损失
def computeCost(X, y, theta):
    m = y.shape[0]
    #     J = (np.sum((X.dot(theta) - y)**2)) / (2*m)
    C = X.dot(theta) - y
    J2 = (C.T.dot(C)) / (2 * m)
    return J2


# 梯度下降
def gradientDescent(X, y, theta, alpha, num_iters):
    m = y.shape[0]
    # print(m)
    # 存储历史误差
    J_history = np.zeros((num_iters, 1))
    for iter in range(num_iters):
        # 对J求导，得到 alpha/m * (WX - Y)*x(i)， (3,m)*(m,1)  X (m,3)*(3,1) = (m,1)
        theta = theta - (alpha / m) * (X.T.dot(X.dot(theta) - y))
        J_history[iter] = computeCost(X, y, theta)
    return J_history, theta


def predict(testx):
    # testx = np.array(data)
    testx = ((testx - mu) / sigma)
    testx = np.hstack([testx, np.ones((testx.shape[0], 1))])
    price = testx.dot(theta)
    # print('predict value is %f ' % (price))
    return price


def readFile(filePath):
    dataFile = np.load(filePath, allow_pickle=True)
    dataList = list(dataFile.tolist())
    random.shuffle(dataList)
    dataList = np.array(dataList, np.float64)
    return dataList


if __name__ == '__main__':
    train = readFile("npSet_LINEAR.npy")
    test = readFile("npSet_LINEAR-1.npy")

    iterations = 10000  # 迭代次数
    alpha = 0.01  # 学习率

    lenTest = test.shape[0]
    ans = [[] for _ in range(lenTest)]
    x = train[:, (0, 1, 2)].reshape((-1, 3))  # 数据特征输入，采用数据集一行的，第1，2，3个数据，然后将其变成一行，所以用shape
    x, mu, sigma = featureNormalize(x)
    X = np.hstack([x, np.ones((x.shape[0], 1))])
    for i in range(1000):
        print("now position %d" % i)
        y = train[:, 3 + i].reshape((-1, 1))  # 输出特征，数据集的第四位
        m = y.shape[0]

        theta = np.zeros((4, 1))  # 因为x+y.总共有四个输入，所以theta是四维
        j = computeCost(X, y, theta)
        J_history, theta = gradientDescent(X, y, theta, alpha, iterations)

        for iter, itemY in enumerate(test):
            predictY = predict(itemY.reshape((-1, 3)))
            ans[iter].append(predictY)
    #     for iter, itemY in enumerate(train):
    #         if iter > 10:
    #             break
    #         predictY = predict(itemY[0:3].reshape((-1, 3)))
    #         ans[iter].append(predictY)
    # for i in range(10):
    #     print(ans[i])

    outfile = open("outfile.txt", "w")
    for i in range(lenTest):
        for j in ans[i]:
            outfile.write(str(j) + ",")
        outfile.write("\n")
    outfile.close()

    # outfile = open("outfile.txt", "r")
    # lines=outfile.readlines()
    # lines = [line.split(",")[:-1] for line in lines]
    # yList=[]
    # for line in lines:
    #     line1=[]
    #     for item in line:
    #         item1=float(item.replace("[","").replace("]",""))
    #         line1.append(item1)
    #     yList.append(line1)
    # outfile.close()
    #
    # inList = []
    # infile = open("anslist_LINEAR.txt", "r")
    # inLines = infile.readlines()
    # for line in inLines:
    #     words = line.split(",")[3:-1]
    #     words = [float(word) for word in words]
    #     inList.append(words)
    # infile.close()
    #
    # errfile = open("errfile.txt", "w")
    # errline = []
    # errall = 0.0
    # for (line1, line2) in zip(yList, inList):
    #     err = 0.0
    #     for (item1, item2) in zip(line1, line2):
    #         err += (item1 - item2) ** 2
    #     err /= len(line1)
    #     errline.append(err)
    #     errfile.write(str(err) + "\n")
    #     errall += err
    # print(errall)
    # errfile.write(str(errall) + "\n")
    # errfile.close()
