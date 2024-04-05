#!/usr/bin/pythonw
# -*-coding:Utf-8 -*

import subprocess
import sources.inout as inout
import os
import sources.path as path
import sys
import numpy as np
import sources.execFreeFem as execFreeFem

#####################################################################################
#######   Numerical solver for thermal problem                                #######
#######       inputs: mesh (string): mesh of the shape                        #######
#######               T (string): output temperature field                    #######
#####################################################################################

def thermal(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Call to FreeFem
  
  execFreeFem.executeFF(nameScript=path.FFTHERMO, errorMessage = "Error in numerical solver for thermal problem; abort.")

def thermal_stoch(mesh,s,t, ind) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Set parameters of solver
  name = path.FFTHERMOSTOCH + " -s " + str(s) + " -t " + str(t) + " -i " + str(ind)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {thermal} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,thermal=name)],shell=True)
  proc.wait()

  if ( proc.returncode != 0 ) :
    proc = subprocess.Popen(["{FreeFem} {thermal} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,thermal=name)],shell=True)
    proc.wait()
    if ( proc.returncode != 0 ) :
      print("Error in thermal calculation; abort. "+str(proc.returncode))
      print("{FreeFem} {thermal} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,thermal=name))
      exit()


#####################################################################################
#######   Numerical solver for elasticity                                     #######
#######       inputs: mesh (string): mesh of the shape                        #######
#######               T (string): temperature field                           #######
#######               u (string): output elastic displacement                 #######
#####################################################################################

def thermoelastic(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  
  # Call to FreeFem
  execFreeFem.executeFF(nameScript=path.FFTHELAS, errorMessage = "Error in numerical solver for thermoelastic problem; abort.")

def thermoelastic_stoch(mesh, ind) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Set parameters of solver
  name = path.FFTHELASSTOCH + " -i " + str(ind)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {thermoelasticity} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,thermoelasticity=name)],shell=True)
  proc.wait()

  if ( proc.returncode != 0 ) :
    proc = subprocess.Popen(["{FreeFem} {thermoelasticity} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,thermoelasticity=name)],shell=True)
    proc.wait()
    if ( proc.returncode != 0 ) :
      print("Error in thermoelasticity calculation; abort. "+str(proc.returncode))
      print("{FreeFem} {thermoelasticity} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,thermoelasticity=name))
      exit()
  
def elastic(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  
  # Call to FreeFem
  execFreeFem.executeFF(nameScript=path.FFELAS, errorMessage = "Error in numerical solver for elastic problem; abort.")

    
#####################################################################################
#####################################################################################

#####################################################################################
#######   Calculate elastic compliance                                        #######
#######       inputs: mesh (string): mesh of the shape                        #######
#######               iteration (string): input iteration                     #######
#####################################################################################

def compliance(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Call to FreeFem
  success = execFreeFem.executeFF(nameScript=path.FFCPLY, 
  		errorMessage = "Error in compliance calculation; Return an infinite value for the compliance.", continueAfterError=True)

  if success == 0:
    [val] = inout.getrAtt(file=path.EXCHFILE,attname="Value")
    [valMech] = inout.getrAtt(file=path.EXCHFILE,attname="ValueMech")
    [valTherm] = inout.getrAtt(file=path.EXCHFILE,attname="ValueTherm")
  else:
    val = np.inf
    valMech = np.inf
    valTherm = np.inf
  
  return (val, valMech, valTherm) 


def compliance_stoch(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Call to FreeFem
  success = execFreeFem.executeFF(nameScript=path.FFCPLYSTOCH, 
  		errorMessage = "Error in compliance calculation; Return an infinite value for the compliance.", continueAfterError=True)

  if success == 0:
    [val] = inout.getrAtt(file=path.EXCHFILE,attname="Value")
    [valMech] = inout.getrAtt(file=path.EXCHFILE,attname="ValueMech")
    [valTherm] = inout.getrAtt(file=path.EXCHFILE,attname="ValueTherm")
  else:
    val = np.inf
    valMech = np.inf
    valTherm = np.inf
  
  return (val, valMech, valTherm) 
  
  
def complianceElastic(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Call to FreeFem
  success = execFreeFem.executeFF(nameScript=path.FFCPEL, 
  		errorMessage = "Error in elastic compliance calculation; Return an infinite value for the compliance.", continueAfterError=True)

  if success == 0:
    [val] = inout.getrAtt(file=path.EXCHFILE,attname="Value")
  else:
    val = np.inf
  
  return val  

  
#####################################################################################
#######   Calculate adjoint states                                            #######
#######       inputs: mesh (string): mesh of the shape                        #######
#######               u (string): output elastic displacement                 #######
#####################################################################################

def adjoints(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {adjoints} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,adjoints=path.FFADJTS)],shell=True)
  proc.wait()
  
  if ( proc.returncode != 0 ) :
    print("Error in adjoint calculation; abort. "+str(proc.returncode))
    exit()



def adjoints_stoch(mesh,ind) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  
  name = path.FFADJTSSTOCH + " -i " + str(ind)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {adjoints} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,adjoints=name)],shell=True)
  proc.wait()
  
  if ( proc.returncode != 0 ) :
    proc = subprocess.Popen(["{FreeFem} {adjoints} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,adjoints=name)],shell=True)
    proc.wait()
    if ( proc.returncode != 0 ) :
      print("Error in adjoint calculation; abort. "+str(proc.returncode))
      print("{FreeFem} {adjoints} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,adjoints=name))
      exit()


#####################################################################################
#####################################################################################

#####################################################################################
#######   Calculate volume                                                    #######
#######       input: mesh (string): mesh of the shape                         #######
#####################################################################################

def volume(mesh) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {volume} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,volume=path.FFVOL)],shell=True)
  proc.wait()
  
  if ( proc.returncode != 0 ) :
    print("Error in volume calculation; abort.")
    exit()
  
  [vol] = inout.getrAtt(file=path.EXCHFILE,attname="Volume")
  
  return vol

#####################################################################################
#####################################################################################

#####################################################################################
#######   Calculate gradient of the compliance functional                     #######
#######       input:  mesh (string): mesh of the shape                        #######
#######               disp (string): solution of the elasticity system        #######
#######       output: grad (string): shape gradient of compliance             #######
#####################################################################################

def gradCp(mesh,norvec,diff,grad) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  inout.setAtt(file=path.EXCHFILE,attname="NorvecName",attval=norvec)
  inout.setAtt(file=path.EXCHFILE,attname="DiffName",attval=diff)
  inout.setAtt(file=path.EXCHFILE,attname="GradName",attval=grad)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {gradCp} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,gradCp=path.FFGRADCP)],shell=True)
  proc.wait()
  
  if ( proc.returncode != 0 ) :
    print("Error in calculation of gradient of compliance; abort.")
    exit()

def gradCp_stoch(mesh,norvec,diff,grad) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  inout.setAtt(file=path.EXCHFILE,attname="NorvecName",attval=norvec)
  inout.setAtt(file=path.EXCHFILE,attname="DiffName",attval=diff)
  inout.setAtt(file=path.EXCHFILE,attname="GradName",attval=grad)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {gradCp} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,gradCp=path.FFGRADCPSTOCH)],shell=True)
  proc.wait()
  
  if ( proc.returncode != 0 ) :
    print("Error in calculation of gradient of compliance; abort.")
    exit()
    

def gradCpEl(mesh,norvec,diff,grad) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  inout.setAtt(file=path.EXCHFILE,attname="NorvecName",attval=norvec)
  inout.setAtt(file=path.EXCHFILE,attname="DiffName",attval=diff)
  inout.setAtt(file=path.EXCHFILE,attname="GradName",attval=grad)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {gradCp} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,gradCp=path.FFGRADCPEL)],shell=True)
  proc.wait()
  
  if ( proc.returncode != 0 ) :
    print("Error in calculation of gradient of compliance; abort.")
    exit()
    
#####################################################################################
#####################################################################################

#####################################################################################
#######   Calculate gradient of the volume function                           #######
#######       input:  mesh (string): mesh of the shape                        #######
#######       output: grad (string): shape gradient of volume                 #######
#####################################################################################

def gradV(mesh,diff,grad) :
  
  # Set information in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  inout.setAtt(file=path.EXCHFILE,attname="DiffName",attval=diff)
  inout.setAtt(file=path.EXCHFILE,attname="GradName",attval=grad)

  # Call to FreeFem
  proc = subprocess.Popen(["{FreeFem} {gradV} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,gradV=path.FFGRADV)],shell=True)
  proc.wait()
  
  if ( proc.returncode != 0 ) :
    print("Error in calculation of gradient of volume; abort.")
    exit()

#####################################################################################
#####################################################################################

#######################################################################################
#####             Calculation of the (normalized) descent direction               #####
#####      inputs :   mesh: (string for) mesh ;                                   #####
#####                 phi: (string for) ls function                               #####
#####                 gCp: (string for) gradient of Compliance                    #####
#####                 Cp: (real) value of Compliance                              #####
#####                 gV: (string for) gradient of Volume                         #####
#####                 vol: (real) value of volume                                 #####
#####      Output:    g: (string for) total gradient                              #####
#######################################################################################

def descent(mesh,phi,Cp,gCp,vol,gV,g) :

  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  inout.setAtt(file=path.EXCHFILE,attname="PhiName",attval=phi)
  inout.setAtt(file=path.EXCHFILE,attname="GradCpName",attval=gCp)
  inout.setAtt(file=path.EXCHFILE,attname="Compliance",attval=Cp)
  inout.setAtt(file=path.EXCHFILE,attname="GradVolName",attval=gV)
  inout.setAtt(file=path.EXCHFILE,attname="Volume",attval=vol)
  inout.setAtt(file=path.EXCHFILE,attname="GradName",attval=g)
      
  # Velocity extension - regularization via FreeFem
  proc = subprocess.Popen(["{FreeFem} {ffdescent} > /dev/null 2>&1".format(FreeFem=path.FREEFEM,ffdescent=path.FFDESCENT)],shell=True)
  proc.wait()
    
  if ( proc.returncode != 0 ) :
    print("Error in calculation of descent direction; abort.")
    exit()

#######################################################################################
#######################################################################################

#######################################################################################
#####                         Evaluation of the merit function                    #####
#####                     in the Null Space optimization algorithm                #####
#####      inputs : Cp: (real) value of compliance                                #####
#####               vol: (real) value of the volume                               #####
#####      output : merit: (real) value of the merit of shape                    #####
#######################################################################################

def merit(Cp,vol) :

  # Read parameters in the exchange file
  [alphaJ] = inout.getrAtt(file=path.EXCHFILE,attname="alphaJ")
  [alphaG] = inout.getrAtt(file=path.EXCHFILE,attname="alphaG")
  [ell] = inout.getrAtt(file=path.EXCHFILE,attname="Lagrange")
  [m] = inout.getrAtt(file=path.EXCHFILE,attname="Penalty")
  [vtarg] = inout.getrAtt(file=path.EXCHFILE,attname="VolumeTarget")

  merit = alphaJ*(Cp - ell*(vol-vtarg)) + 0.5*alphaG/m*(vol-vtarg)**2

  return merit

#######################################################################################
#######################################################################################
