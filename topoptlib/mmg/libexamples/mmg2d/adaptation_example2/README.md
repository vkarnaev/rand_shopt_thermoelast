# Basic use of the **mmg2d** library to perform mesh adaptation with 2 calls of the library and deletion of the metric between the call.

## I/ Implementation
This example:  
  1. build mesh and metric at MMG5 format;
  2. call the MMG2D library;
  3. get the mesh and metric and save its;
  4. remove the metric to not reuse it;
  5. call again the MMG2D library;
  3. get the final mesh.

  We read mesh and solution files using the **MMG2D_loadMesh** and **MMG2D_loadSol** functions.
  Results are saved using **MMG2D_saveMesh** and **MMG2D_saveSol** functions.


## II/ Compilation
  1. Build and install the **mmg2d** shared and static library. We suppose in the following that you have installed the **mmg2d** library in the **_$CMAKE_INSTALL_PREFIX_** directory (see the [installation](https://github.com/MmgTools/Mmg/wiki/Setup-guide#iii-installation) section of the setup guide);
  2. compile the main.c file specifying:
    * the **mmg2d** include directory with the **-I** option;
    * the **mmg2d** library location with the **-L** option;
    * the **mmg2d** library name with the **-l** option;
    * with the shared library, you must add the ***_$CMAKE_INSTALL_PREFIX_** directory to your **LD_LIBRARY_PATH**.

> Example 1  
>  Command line to link the application with the **mmg2d** static library
> ```Shell
> gcc -I$CMAKE_INSTALL_PREFIX/include/mmg/mmg2d main.c -L$CMAKE_INSTALL_PREFIX/lib -lmmg2d -lm
> ```

> Example 2  
>  Command line to link the application with the **mmg2d** shared library:  
> ```Shell
> gcc -I$CMAKE_INSTALL_PREFIX/include/mmg/mmg2d main.c -L$CMAKE_INSTALL_PREFIX/lib -lmmg2d
> export LD_LIBRARY_PATH=$CMAKE_INSTALL_PREFIX/lib:$LD_LIBRARY_PATH
> ```
