import argparse
import os

import matplotlib.pyplot as plt
import numpy as np


def do(v, t):
    file = open("ave.out", "r")
    allave, no = [], 0
    while True:
        no += 1
        line = file.readline()
        if line:
            word = line.split(" ")[-1].replace("\n", "")
            id = line.split(" ")[0]
            print(no, word)
            allave.append(float(word))
        else:
            break
    file.close()

    plt.figure()
    plt.plot([i*10 for i in range(no - 1)], allave)
    # plt.show()
    plt.savefig('ave_plot.png', bbox_inches='tight')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-v", "--v", type=int, default=3000)
    parser.add_argument("-t", "--t", type=int, default=5)
    args = parser.parse_args()
    v = args.v
    t = args.t
    do(v, t)
