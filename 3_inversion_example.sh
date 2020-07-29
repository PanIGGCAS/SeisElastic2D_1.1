#!/bin/bash

## running one inversion example on a local workstation

rm -rf $ALL_DATA/*
rm -rf $WORK_PATH/*

cd $SeisElastic2D/EXAMPLES/FWI_EXAMPLES

tar -zxvf CW_VTI_syn.tar.gz

cd ./CW_VTI_syn

######################################################
## generate observed data

cd ./submit_job

cp -r parameter_FD_obs parameter

bash submit.sh

echo "observed data are generated !!!"

echo "see results at:"

echo $ALL_DATA

## inversion experiment

echo "Starting FWI EXAMPLE"

rm -rf $WORK_PATH/*

cd $SeisElastic2D/EXAMPLES/FWI_EXAMPLES/CW_VTI_syn

cd ./submit_job

cp -r parameter_inversion parameter

bash submit.sh

echo "###########################################################################"

echo "inversion experiment is finished !!!"

cd $SeisElastic2D

echo "see results at: ./EXAMPLES/FWI_EXAMPLES/CW_VTI_syn/submit_job/RESULTS/inversion/Scale0_WD_AD"

date


