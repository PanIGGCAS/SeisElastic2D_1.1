#!/bin/bash

#####################################################################
## Compile scotch, which is needed by specfem2d for mesh partitioning.

echo "install scotch"

cd $SeisElastic2D/specfem2d/src/meshfem2D
rm -rf scotch_6.0.4
tar -zxvf scotch_6.0.4.tar.gz
cd ./scotch_6.0.4/src

## before install scotch, the users need to changed the paths for icc and mpicc in Makefile.inc.

make clean
make scotch
make ptscotch

echo "finish installing scotch"

## If scotch is installed successfully, please proceed forward.
#####################################################################
## Configure specfem2d

echo "configure specfem2d"

cd $SeisElastic2D/specfem2d

./configure CC=icc FC=ifort MPIFC=mpif90 --with-mpi --with-scotch-dir=./src/meshfem2D/scotch_6.0.4

## Compile specfem2d

echo "compile specfem2d"

make clean
make all

echo "finish compiling specfem2d"

#####################################################################
## Compile SeisElastic2D

echo "compile SeisElastic2D"

cd $SeisElastic2D/SeisElastic2D/lib

echo "finish compiling SeisElastic2D"

echo date

