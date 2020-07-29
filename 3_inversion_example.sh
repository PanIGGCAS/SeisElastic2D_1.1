#!/bin/bash

cd $SeisElastic2D/EXAMPLES/FWI_EXAMPLES

tar -zxvf CW_VTI_syn.tar.gz

cd ./CW_VTI_syn

######################################################
## generate observed data

cp -r ./model_true_bin/*.bin ./submit_job/DATA

cd ./submit_job

cp -r parameter_FD_obs parameter

bash submit.sh

echo "observed data are generated !!!"

echo "see results at:"

echo $ALL_DATA

## inversion experiment

echo "Starting FWI EXAMPLE"

cd $SeisElastic2D/EXAMPLES/FWI_EXAMPLES/CW_VTI_syn

cp -r ./model_init_bin/*.bin ./submit_job/DATA

cd ./submit_job

cp -r parameter_FWI parameter

bash submit.sh

echo "inversion experiment is finished !!!"

echo "see results at:"

echo date

