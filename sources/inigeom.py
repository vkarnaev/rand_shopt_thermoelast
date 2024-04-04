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
#######           Create initial mesh and Ls Function               #######
#######             Input: mesh (string) path to mesh               #######
###########################################################################
def iniGeom(mesh, meshinit = None) :
  if meshinit is None:
    meshinit = mesh
  
  # Fill in exchange file
  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=meshinit)
  inout.setAtt(file=path.EXCHFILE,attname="PhiName",attval=path.TMPSOL)

  # Call to FreeFem for creating the background mesh
  execFreeFem.executeFF(nameScript=path.FFINIMSH, errorMessage = "Error in creation of initial mesh; abort.")

  inout.setAtt(file=path.EXCHFILE,attname="MeshName",attval=mesh)
  # Call to mmg2d for remeshing the background mesh
  mshtools.mmg2d(meshinit,0,None,path.HMIN,path.HMAX,path.HAUSD,path.HGRAD,0,meshinit)
  
  # Call to FreeFem for creating the initial level set function
  execFreeFem.executeFF(nameScript=path.FFINILS, errorMessage = "Error in creation of initial level set function; abort.")
  
  # Call to mmg2d for discretizing the level set function into the mesh
  mshtools.mmg2d(mesh,1,path.TMPSOL,path.HMIN,path.HMAX,path.HAUSD,path.HGRAD,1,mesh)


