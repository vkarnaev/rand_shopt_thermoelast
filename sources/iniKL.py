#!/usr/bin/pythonw
# -*-coding:Utf-8 -*

import sources.path as path
import subprocess
import os
import sources.inout as inout
import sys
import sources.mshtools as mshtools
import sources.lstools as lstools
import sources.execFreeFem as execFreeFem

###########################################################################
#######                 Calculate KL EXPRESSION                     #######
#######             Input: mesh (string) path to mesh               #######
###########################################################################


def iniKL() :
  # Call to FreeFem to compute KL

  proc = subprocess.Popen(["mkdir -p ./sources/stoch_temp && find ./sources/stoch_temp -mindepth 1 -delete"], shell=True) 
  proc.wait()

  # Call to FreeFem for calculation of KL expression
  #execFreeFem.executeFF(nameScript=path.FFINIKLT, errorMessage = "Error in calculation of KL in time; abort.")
  #execFreeFem.executeFF(nameScript=path.FFINIKLS, errorMessage = "Error in calculation of KL in space; abort.")

  execFreeFem.executeFF(nameScript=path.FFINIKLEASY, errorMessage = "Error in calculation of KL; abort.")
