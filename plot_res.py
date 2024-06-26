import pandas as pd
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import subprocess
from sources import path
from pymedit import Mesh


def treatfile(fileResName):
    # Open file
    ff = open(fileResName,"r")
    content = ff.read()
    lst = content.replace("[", "").replace("]", "")
    ll = []
    llst = lst.split("\n")
    for elem in llst:
        a = " ".join(elem.split())
        ll.append(a)
    ff.close()
    with open(fileResName,"w") as ff :
        for i,elt in enumerate(ll) :
            if elt.rstrip("\n") != "":
                ff.write(elt+"\n")
    

def createGraphs(fileResName):
    contents = pd.read_csv(fileResName, sep=" ", header=None)
    records = contents.to_dict(orient='records')
    iters = [records_ii[0] for records_ii in records]
    JJ = [records_ii[1] for records_ii in records]
    HHtemp = [records_ii[2] for records_ii in records]
    HH = [[records_ii[n+2] for n in range(len(records_ii)-2)] for records_ii in records]
    # Objective
    figJ = plt.figure()
    plt.plot(iters, JJ)
    plt.xlabel("Iterations")
    plt.ylabel("Volume")
    plt.title("Objective")
    plt.savefig(path.FIGOBJ, format="eps")
    # Constraints
    figH = plt.figure()
    plt.plot(iters, [path.TARG]*len(iters), 'r--')
    for c in range(len(HH[0])):
        plt.plot(iters, [(hhh[c] + 1.0)*path.TARG for hhh in HH], label="constr. "+str(c))
    plt.xlabel("Iterations")
    plt.ylabel("Constraint")
    plt.title("Constraint")
    plt.savefig(path.FIGCONSTR, format="eps")
    
treatfile(path.HISTO)    
createGraphs(path.HISTO)

mesh = path.step(path.MAXIT,"mesh")
M = Mesh(mesh)
figplot = M.plot(title = "Shape")
figplot[0].savefig('./res/plot/shape.eps', format = 'eps')

name = "./sources/plot_res.edp"
proc = subprocess.Popen(["{FreeFem} {plot} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,plot=name)],shell=True)
proc.wait()