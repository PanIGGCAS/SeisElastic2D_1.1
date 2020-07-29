#!/bin/bash

# ulimit -s unlimited
## set the path for intel compiler. The users need to adjust the following paths according to your own computer
alias ifort='/home/wenyongp/intel/compilers_and_libraries_2020.1.217/linux/bin/intel64/ifort'
source /home/wenyongp/intel/bin/ifortvars.sh ia32
source /home/wenyongp/intel/bin/compilervars.sh intel64
## set the path for Openmpi
export PATH=/home/wenyongp/Programs/Openmpi-4.0.3/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/wenyongp/Programs/Openmpi-4.0.3/lib
## set the path for Seismic Unix
export CWPROOT=/home/wenyongp/Programs/SU
export PATH=$PATH:/home/wenyongp/Programs/SU/bin

## set the path for SeisElastic2D

mkdir -p ALL_DATA
mkdir -p Working_Path

export FWI_EXAMPLES=$PWD/EXAMPLES/FWI_EXAMPLES
export WORK_PATH=$PWD/Working_Path
export ALL_DATA=$PWD/ALL_DATA
export SeisElastic2D=$PWD/SeisElastic2D
export seisDD=$PWD/SeisElastic2D
export SCRIPTS=$PWD/SeisElastic2D/scripts
export WORKFLOW=$PWD/SeisElastic2D/workflow
export SRC=$PWD/SeisElastic2D/SRC
export SPECFEM2D=$PWD/specfem2d
export SPECFEM3D=$PWD/specfem3d
export SPECFEM3D_GPU=$PWD/specfem3d_GPU
export SPECFEM3D_GLOBE=$PWD/specfem3d_globe
export VISUALIZE=$PWD/visualize
export FD_EXP=$PWD/Model_generation

