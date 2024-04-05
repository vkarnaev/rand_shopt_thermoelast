#!/usr/bin/pythonw
# -*-coding:Utf-8 -*

import os
import sys

# Global parameters
REFDIR        = 1       # Reference for Dirichlet B.C
REFISO        = 10      # Reference for the boundary edges of the shape
REFINT        = 3       # Reference of the interior domain
REFEXT        = 2       # Reference of the exterior domain
NC            = 1                                        # Number of contraints (=load cases)
REFNEU        = 11       # Reference for Neumann B.C
REFFOU        = REFISO   # Reference for Fourier-Robin B.C

# Parameters of the mesh
HMIN          = 0.01 #0.005
HMAX          = 0.03 #0.010
MESHSIZ       = 0.5*(HMIN + HMAX)
HAUSD         = 0.01
HGRAD         = 1.3

# Physical parameters
YOUNGMODULUS = 200.0      # GPa
POISSONRATIO = 0.3      
LAMEL      = YOUNGMODULUS * POISSONRATIO / ((1+POISSONRATIO)*(1-2*POISSONRATIO))          	#0.5769	# Lamé parameter lambda
LAMEM      = YOUNGMODULUS  / (1+2*POISSONRATIO)							#0.3846	# Lamé parameter mu
THERMK     = 15.0e-2;	# Diffusion coefficient K for the temperature
THERMBETA  = 10;	# Coupling term for Fourier B.C.
THERMQGEN  = 0.0;	# Heat generated inside the structure
THERMDIR   = 0.0;	# Temperature at the Dirichlet boundary
ALPHATH    = 1.5e-5;	# Coupling term for thermo-elasticity
ALPHATHERM = YOUNGMODULUS * ALPHATH / (1 - 2*POISSONRATIO)
DENSITY    = 3.6  # Density of the material
GX         = 0.0        # Horizontal component of mechanical load on ref REFNEU
GY         = -1.0       # Vertical component of mechanical load on ref REFNEU
THERMWAVE  = 500.0;		# Maximal difference between the external temperature and THERMDIR
KERNELPARAM = 0.1;


# Other parameters

DT	          = 1.0*MESHSIZ   # Timestep optimization algorithm
EPS           = 1e-10 # Precision parameter
EPSP          = 1e-20 # Precision parameter for packing
ALPHA         = 1.0*MESHSIZ # Parameter for velocity extension - regularization    
MAXIT         = 300  # Maximum number of iterations in the shape optimization process
MAXITLS       = 3   # Maximum number of iterations in the line search procedure
MAXCOEF       = 2.0  # Maximum allowed move between two iterations (in # * MESHSIZ)
MINCOEF       = 0.02 # Minimum allowed move between two iterations (in # * MESHSIZ)
TOL           = 0.02  # Tolerance for a slight increase in the merit
AJ            = 0.3   # Weight of objective in null-space optimization algorithm
AC            = 0.5   #  Weight of constraint in null-space optimization algorithm
TARG          = 5e-3  # Threshold for integral compliance
STOCHTARG     = 35*TARG  # Threshold for integral compliance
FINALTIME     = 1.0 # Final time 
DELTATIME     = 0.05 #0.01 # Length of time intervals
NTIMESTEPS    = int(FINALTIME/DELTATIME)  # Number of timesteps
WEIGHTAVG     = 1.0

# Paths to folders
RES     = "./res/"       # Directory for results
PLOTDIR = RES + "plot/"  # Directory for test of libraries
TESTDIR = RES + "test/"  # Directory for test of libraries
SCRIPT  = "./sources/"   # Directory for sources

# Call for the executables of external codes
FREEFEM = "FreeFem++ -nw"
MSHDIST = "mshdist"
#ADVECT  = "~/Advection/build/advect"
#MMG2D   = "~/mmg/build/bin/mmg2d_O3"
ADVECT  = "~/Documents/researches/num/topoptlib/Advection/build/advect"
MMG2D   = "~/Documents/researches/num/topoptlib/mmg/build/bin/mmg2d_O3"

# Path to FreeFem scripts
FFTEST         = SCRIPT + "testFF.edp"
FFINIMSH       = SCRIPT + "inimsh.edp"
FFINIKLT       = SCRIPT + "KLT.edp"
FFINIKLS       = SCRIPT + "KLS.edp"
FFINILS        = SCRIPT + "inils.edp"
FFTHELAS       = SCRIPT + "thermoelasticity.edp"
FFTHELASSTOCH  = SCRIPT + "thermoelasticity_stoch.edp"
FFELAS         = SCRIPT + "elasticity.edp"
FFCPLY         = SCRIPT + "compliance.edp"
FFCPLYSTOCH    = SCRIPT + "compliance_stoch.edp"
FFCPEL         = SCRIPT + "complianceElastic.edp"
FFGRADCP       = SCRIPT + "gradCp.edp"
FFGRADCPSTOCH  = SCRIPT + "gradCp_stoch.edp"
FFGRADCPEL     = SCRIPT + "gradCpEl.edp"
FFVOL          = SCRIPT + "volume.edp"
FFGRADV        = SCRIPT + "gradV.edp"
FFNORVEC       = SCRIPT + "norvec.edp"
FFTHERMO       = SCRIPT + "thermal.edp"
FFTHERMOSTOCH  = SCRIPT + "thermal_stoch.edp"
FFADJTS        = SCRIPT + "adjoint.edp"
FFADJTSSTOCH   = SCRIPT + "adjoint_stoch.edp"
FFVISUAL       = SCRIPT + "visualizationcutmesh.edp"
FFNONOPT       = SCRIPT + "nonoptimizable.edp"

# Names of output and exchange files
EXCHFILE = RES + "exch.data"
DEFMMG2D = RES + "DEFAULT.mmg2d"
LOGFILE  = RES + "log.data"
HISTO    = RES + "histo.data"
STEP     = RES + "step"
TMPSOL   = RES + "temp.sol"
MATRIXINNER   = RES + "matrixInner.sol"
TEMPERATUREPATTERN   = RES + "T_"
TEMPERATUREEXTENSION	= ".sol"
DISPLPATTERN   = RES + "u_"
DISPLEXTENSION	= ".sol"
ADJOINTTEMPERATUREPATTERN   = RES + "R_"
ADJOINTTEMPERATUREEXTENSION = ".sol"
ADJOINTDISPLACEMENTPATTERN   = RES + "w_"
ADJOINTDISPLACEMENTEXTENSION = ".sol"
TESTMESH = TESTDIR + "test.mesh"
TESTPHI  = TESTDIR + "test.phi.sol"
TESTSOL  = TESTDIR + "test.grad.sol"
FIGOBJ   = PLOTDIR + "objective.eps"
FIGCONSTR  = PLOTDIR + "constraints.eps"
FIGCPLY  = PLOTDIR + "compliance.eps"

# Shortcut for various file types
def step(n,typ) :
  return STEP + "." + str(n) + "." + typ
  
def nametime(timestep,typ):
  return STEP + ".time_" + str(timestep) + "." + typ

def temperatureName(timestep):
  return TEMPERATUREPATTERN + str(timestep) + "." + "sol"
