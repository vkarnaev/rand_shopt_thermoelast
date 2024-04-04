from pymedit import Mesh, P1Function, trunc
import numpy as np
import matplotlib.pyplot as plt
import os
import sources.path as path
import inout
import subprocess
import os
import path
import sys

def plot_mesh(mesh, it, figname):
  Th=Mesh(mesh)
  fig, ax = Th.plot(doNotPlot=True, title="Iteration "+str(it))
  fig.savefig(figname, format='png')
  plt.close(fig)
  
  
def create_graphs(results):
  iters = results['it']
  JJ = results['J']
  HH = results['H']
  #-------
  figJ = plt.figure()
  plt.plot(iters, JJ)
  plt.xlabel("Iterations")
  plt.ylabel("Compliance")
  plt.title("Objective")
  plt.savefig(path.FIGOBJ, format="eps")
  #-------
  figH = plt.figure()
  plt.plot(iters, [0.0]*len(iters), 'r--')
  for c in range(len(HH[0])):
    plt.plot(iters, [hhh[c] for hhh in HH], label="Constraint "+str(c))
  plt.legend()
  plt.xlabel("Iterations")
  plt.ylabel("Volume")
  plt.title("Constraints")
  #plt.ylim([-1.0, 20.0])
  plt.savefig(path.FIGCONSTR, format="eps")
  #------
  figCply = plt.figure()
  plt.plot(iters, JJ, 'k-', label = 'Total compliance')
  plt.plot(iters, results['cplyMech'], 'b-', label = 'Mechanical component of compl.')
  plt.plot(iters, results['cplyTherm'], 'r-', label = 'Thermal component of compl.')
  plt.legend()
  plt.xlabel("Iterations")
  plt.ylabel("Compliance")
  plt.title("Decomposition of the compliance")
  plt.savefig(path.FIGCPLY, format="eps")
  
def cutfield(mesh, fieldName, cutfieldName) :
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  inout.setAtt(file=path.EXCHFILE,attname="FieldName",attval=fieldName)
  inout.setAtt(file=path.EXCHFILE,attname="CutFieldName",attval=cutfieldName)
  
  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {visual} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,visual=path.FFVISUAL)],shell=True)
  proc.wait()

  if ( proc.returncode != 0 ) :
    print("Error in visualization; abort.")
    exit()
  
def plot_cutfield(mesh, it, fieldname, cutfieldname, figname):
  Th=Mesh(mesh)
  Thi = trunc(Th, 3)
  cutfield(mesh, fieldname, cutfieldname)
  Field = P1Function(Thi, cutfieldname)
  figplotFixedBar = Field.plot(title="iteration "+str(it), doNotPlot=True)
  figplotFixedBar[0].savefig(figname, format = 'png')
  plt.close(figplotFixedBar[0])
  
  
  


