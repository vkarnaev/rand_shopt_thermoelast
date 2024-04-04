#!/usr/bin/pythonw
# -*-coding:Utf-8 -*

import sources.path as path
import subprocess
import os
import sys
# import pyfreefem

def executeFF(nameScript, errorMessage = None, successMessage = None, logfile = None, continueAfterError = False):
	if logfile is not None:
		log = open(logfile,'a')
	proc = subprocess.Popen(["{FreeFem} {script} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,script=nameScript)],shell=True)
	proc.wait()
	if logfile is not None:
		log.close()
 
	if (proc.returncode == 0) :
		if (successMessage is not None):
			print(successMessage)
		return 0
	else :
		if (errorMessage is not None):
			print(errorMessage)
		print(proc.returncode)
		if not continueAfterError:
			raise RuntimeError("FreeFem error")
		return 1
		
		
		
#execFreeFem.executeFF(nameScript = path.FFTEST, errorMessage = "Problem with FreeFem installation.", successMessage = "FreeFem installation working.")
#import execFreeFem
