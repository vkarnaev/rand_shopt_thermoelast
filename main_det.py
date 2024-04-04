#!/usr/bin/pythonw
# -*-coding:Utf-8 -*

import numpy as np
from sources import path, inout, mshtools, lstools, mechtools, inigeom
from nullspace_optimizer import *
import time
from pymedit import Mesh
import pandas as pd
import matplotlib.pyplot as plt

start_time = time.time()

# Initialize folders and exchange files
inout.iniWF()

# Creation of the initial mesh
inigeom.iniGeom(path.step(0,"mesh"))

# Resolution of the state equations 
mechtools.thermal(path.step(0,"mesh"))
mechtools.thermoelastic(path.step(0,"mesh"))

# Calculation of the volume of the shape and the compliance
vol = mechtools.volume(path.step(0,"mesh"))

(valCpl, valMech, valTherm) = mechtools.compliance(path.step(0,"mesh"))
AUX = (valCpl, valMech, valTherm)

# Initial values of the objective and constraint functions
J  = vol
H  = [valCpl/path.TARG - 1.0]

def updateDict(dictionary, key, value):
    if key not in dictionary:
        dictionary[key] = [value]
    else:
        dictionary[key].append(value)

#################### Definition of Optimizable class  ###################

class StructureOptimizable(Optimizable) :

  # Constructor
    def __init__(self) :
        super().__init__()
        self.ucomputed = True                    # When initializing algorithm, the states have been computed
        self.sensitivity_computed = False        # When initializing algorithm, the sensitivities have not been computed
        self.obj = (J,H, AUX)   # When initializing algorithm, the objective has been computed
        self.nconstraints = 0                    # Number of equality constraints
        self.nineqconstraints = 1		     # Number of inequality constraints
    
  # Initialization
    def x0(self) :
        return path.step(0,"mesh")
  
  # Calculation of the objective and constraint functions
    def evalObjective(self,x) :
        nam = x.rpartition('.')[0] # Radical in the name of the mesh
        if not self.ucomputed :
            print("  Resolution of the linear elasticity systems")

            # Calculate u
            it = int(nam.rpartition('.')[2])
            mechtools.thermal(x)
            mechtools.thermoelastic(x)
            self.ucomputed = True
      
            # Calculate J and H
            J = mechtools.volume(x)
            (valCpl, valMech, valTherm) = mechtools.compliance(x)
            H = [valCpl / path.TARG - 1.0]
            AUX = (valCpl, valMech, valTherm)
            self.obj = (J,H, AUX)
        return self.obj
  
  # Calculate objective function
    def J(self,x) :
        (J,H, AUX) = self.evalObjective(x)
        return J

  # Calculate all inequality constraint functions and return the list of them
    def H(self,x) :
        (J,H, AUX) = self.evalObjective(x)
        return H
    
  # Calculate auxiliary values and return the list of them
    def AUX(self,x) :
        (J,H, AUX) = self.evalObjective(x)
        return AUX
  
  # Shape derivatives, sensitivity of objective and constraint
    def evalSensitivities(self,x,**kwargs) :
        nam = x.rpartition('.')[0]
        it = int(nam.rpartition('.')[2])
        ineq_indices = kwargs.get('ineq_indices', range(self.nineqconstraints))
        if not self.sensitivity_computed :
            # Calculate dJ and gradJ
            mechtools.gradV(x,path.step(0,"diffV.sol"),path.step(0,"gradV.sol"))
            dJ    = inout.loadSol(path.step(0,"diffV.sol"))
            gradJ = inout.loadSol(path.step(0,"gradV.sol"))

            # Calculate dH and gradH
            if len(ineq_indices) > 0:
                mechtools.adjoints(x)
                phi  = path.step(it,"phi.sol")
                lstools.norvec(x,phi,None,path.step(it,"norvec.sol"))
                mechtools.gradCp(x, path.step(it,"norvec.sol"), path.step(0,"diffCp.sol"),
                                    path.step(0,"gradCp.sol"))
                dH = [inout.loadSol(path.step(0,"diffCp.sol"))/path.TARG]
                gradH = [inout.loadSol(path.step(0,"gradCp.sol"))/path.TARG]
            else:
                dH = [dJ*0.0]
                gradH = [gradJ*0.0]
                
            # dJ = list of np values ; dH = NC lines, np columns ;
            # gradJ = list of np values ; gradH = path.NC * ndof list
            
            self.sensitivities = (dJ,dH,gradJ,gradH)
            self.sensitivity_computed = True
            # if 0 in ineq_indices:
            #     T0 = inout.loadSol("./res/vm0.sol")
            #     inout.saveSol(x,T0,path.step(it,"TEMP0.sol"))
            # if 0 in ineq_indices:
            #     T1 = inout.loadSol("./res/vm1.sol")
            #     inout.saveSol(x,T1,path.step(it,"TEMP1.sol"))
        return self.sensitivities
  
    # List with ndof elements
    def dJ(self,x,**kwargs) :
        (dJ,dH,gradJ,gradH) = self.evalSensitivities(x,**kwargs)
        return dJ
  
    #dH = array with path.NC lines, and ndof columns
    def dH(self,x,**kwargs) :
        (dJ,dH,gradJ,gradH) = self.evalSensitivities(x,**kwargs)
        return dH
        
    # Gradient and transpose
    def dJT(self,x,**kwargs) :
        (dJ,dH,gradJ,gradH) = self.evalSensitivities(x,**kwargs)
        return gradJ
    
    def dHT(self,x,**kwargs) :
        (dJ,dH,gradJ,gradH) = self.evalSensitivities(x,**kwargs)
        return np.asarray(gradH).T
    
    # Retraction : shape update
    # dx = array of np values containing values of the scalar velocity field
    def retract(self, x, dx) :
        nam = x.rpartition('.')[0]
        it = int(nam.rpartition('.')[2])
        curmesh = x
        curphi  = path.step(it,"phi.sol")
        curgrad = path.step(it,"grad.sol")
        newmesh = path.step(it+1,"mesh")
        newphi  = path.TMPSOL

        # Assume that the next computations will be performed on a new mesh
        self.sensitivity_computed = False
        self.ucomputed = False
    
        ## Generation of a level set function for $\Omega^n$ on $D$
        # Put scalar velocity defined on D into the normal direction
        inout.saveSol(dx,path.TMPSOL)
        lstools.norvec(curmesh,curphi,path.TMPSOL,curgrad)
    
        # Advection of the level set function
        print("  Level Set advection")
        lstools.advect(curmesh,curphi,curgrad,1.0,newphi)   # time step taken into account in 
                                                            # calculation of descent
        lstools.enforceNonOptimizable(curmesh, newphi, newphi)
    
        # Creation of a mesh associated to the new shape
        print("  Local remeshing")
        retmmg = mshtools.mmg2d(curmesh,1,newphi,path.HMIN,path.HMAX,path.HAUSD,path.HGRAD,1,newmesh)
        return newmesh
    
    # Accept step
    def accept(self,results) :
        it    = len(results['J'])-1
        #if 'time' not in results:
        #    results['time'] = [time.time()]
        #else:
        #    results['time'].append(time.time())
        updateDict(results, 'time', time.time())        
        print("\n***************************************************")
        print("********            Iteration {}            ********".format(it))
        print("***************************************************")
        # Generation of a level set function for $\Omega^n$ on $D$
        print("  Creation of a level set function")
        lstools.mshdist(path.step(it,"mesh"),path.step(it,"phi.sol"))
        (J,H, AUX)= self.obj
        print("***  vol {} ; Compl {}, complMech {}, complTherm {}".format(J, AUX[0], AUX[1], AUX[2]))
        updateDict(results, 'compl', AUX[0])
        updateDict(results, 'complMech', AUX[1])
        updateDict(results, 'complTherm', AUX[2])
        inout.printHisto(it,J,H)
        pass
    
################ End of definition of Optimizable ###############
    
# Run optimization solver
optSettings = {
    "dt" : path.DT,
    "alphaJ" : path.AJ,
    "alphaC" : path.AC,
    "maxit" : path.MAXIT,
    "provide_gradient" : True,
    "maxtrials" : path.MAXITLS,
    "itnormalisation" : 20,
    "ineq_indices_threshold" : -0.3,
    "debug":3,
    "tol_qp":1.0e-20
}



results = nlspace_solve(StructureOptimizable(), optSettings)
    
###############################################################
####################       END PROGRAM      ###################
###############################################################


