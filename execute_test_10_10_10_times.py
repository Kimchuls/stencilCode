import argparse
import os

filepath = "./fault_injector.config"


def countErrorBound(count):
    return "{0}E-1".format(count)


def changeVariable(folder, x, y, z, t):
    if not os.path.exists("{0}".format(folder)):
        os.mkdir("{0}".format(folder))
    if not os.path.exists("./{0}/loadfile.txt".format(folder)):
        os.mknod("./{0}/loadfile.txt".format(folder))
    writefile = open("./{0}/loadfile.txt".format(folder), "w")
    var = 0

    compressor = 1
    SZerrorBoundMode = "REL"
    etype = 1
    fileopen = open(filepath, 'w')
    fileopen.write(
        "x = {0}\ny = {1}\nz = {2}\n".format(x, y, z))
    fileopen.write(
        "iteration = {0}\nstep1 = {1}\nstep2 = {2}\n".format(iters, step1, step2))
    fileopen.write(
        "compressor = {0}\n".format(compressor))
    fileopen.write(
        "SZerrorBoundMode = {0}\n".format(SZerrorBoundMode))
    fileopen.write("SZabsErrorBound = {0}\n".format(
        countErrorBound(etype)))
    fileopen.write("SZrelBoundRatio = {0}\n".format(
        countErrorBound(etype)))
    fileopen.close()
    log = "x = {0}, y = {1}, z = {2}, ".format(x, y, z) \
          + "iteration = {0}, step1 = {1}, step2 = {2}, ".format(iters, step1, step2) \
          + "compressor = {0}, ".format(compressor) \
          + "SZerrorBoundMode_{0}, ".format(SZerrorBoundMode) \
          + "SZErrorBound = {0}".format(countErrorBound(etype))
    for trial in range(1, t + 1):
        print(log)
        writefile.write("TRIAL = {0}, ".format(trial) + log + "\n")
        var += 1
        runfile = "./stencil {0} {1} {2} 1 1 1 {3} > ./{4}/{5}.txt".format(x, y, z, iters, folder,
                                                                           var)
        print(runfile)
        os.system(runfile)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    # parser.add_argument("-t", "--type", type=int, default=0)
    parser.add_argument("-p1", "--parameter_1", type=int, default=60)
    parser.add_argument("-p2", "--parameter_2", type=int, default=60)
    parser.add_argument("-p3", "--parameter_3", type=int, default=60)
    parser.add_argument("-it", "--iters", type=int, default=3000)
    parser.add_argument("-s1", "--step1", type=int, default=30)
    parser.add_argument("-s2", "--step2", type=int, default=120)
    parser.add_argument("-f", "--folder", default="11250542")
    parser.add_argument("-t", "--times", type=int, default=10)
    args = parser.parse_args()
    iters = args.iters
    step1 = args.step1
    step2 = args.step2
    os.system("bash compile_commands")
    changeVariable(args.folder, args.parameter_1, args.parameter_2, args.parameter_3, args.times)
