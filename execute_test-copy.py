import argparse
import os

filepath = "./fault_injector.config"

iters = 150
steps = 15


def countErrorBound(count):
    return "{0}E-1".format(count)


def changeVariable(sx, sy, sz, nx, ny, nz, folder):
    # print(sx,sy,sz,nx,ny,nz,folder)
    if not os.path.exists("{0}".format(folder)):
        os.mkdir("{0}".format(folder))
    if not os.path.exists("./{0}/loadfile.txt".format(folder)):
        os.mknod("./{0}/loadfile.txt".format(folder))
    writefile = open("./{0}/loadfile.txt".format(folder), "w")
    var = 0
    for x in range(sx, nx+1):
        for y in range(sy, ny+1):
            for z in range(sz, nz+1):
                compressor = 1
                SZerrorBoundMode = "REL"
                for ecount in range(4, 22):
                    etype = ecount / 4
                    fileopen = open(filepath, 'w')
                    fileopen.write(
                        "x = {0}\ny = {1}\nz = {2}\n".format(x, y, z))
                    fileopen.write(
                        "iteration = {0}\nsteps = {1}\n".format(iters, steps))
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
                        + "iteration = {0}, steps = {1}, ".format(iters, steps) \
                        + "compressor = {0}, ".format(compressor) \
                        + "SZerrorBoundMode_{0}, ".format(SZerrorBoundMode) \
                        + "SZErrorBound = {0}".format(countErrorBound(etype))
                    print(log)
                    writefile.write(log + "\n")
                    var += 1
                    runfile = "./stencil {0} {1} {2} 1 1 1 {3} > ./{4}/{5}.txt".format(x, y, z, iters, folder,
                                                                                       var)
                    print(runfile)
                    os.system(runfile)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument("-t", "--type", type=int, default=0)
    parser.add_argument("-p1", "--parameter_1", type=int, default=3)
    parser.add_argument("-p2", "--parameter_2", type=int, default=3)
    parser.add_argument("-p3", "--parameter_3", type=int, default=3)
    # parser.add_argument("-p4", "--parameter_4", type=int, default=3)
    # parser.add_argument("-p5", "--parameter_5", type=int, default=3)
    # parser.add_argument("-p6", "--parameter_6", type=int, default=3)
    parser.add_argument("-f", "--folder", default="ansfile1")
    args = parser.parse_args()
    os.system("bash compile_commands")
    if args.type == 0:
        changeVariable(3, 3, 3, 3, 3, args.parameter_3, args.folder)
    elif args.type == 1:
        changeVariable(3, 4, 4, 3, args.parameter_2,
                       args.parameter_3, args.folder)
    else:
        changeVariable(4, 4, 4, args.parameter_1,
                       args.parameter_2, args.parameter_3, args.folder)
