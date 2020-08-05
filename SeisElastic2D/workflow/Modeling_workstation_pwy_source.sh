#!/bin/bash

ulimit -s unlimited

source ./parameter
export user=$(whoami)

cd $SUBMIT_DIR
#################### input parameters ###################################################
# directories
export SCRIPTS_DIR="$package_path/scripts"
export SUBMIT_RESULT="$SUBMIT_DIR/RESULTS/$job/Scale${Wscale}_${measurement_list}_${misfit_type_list}"     # final results
if [ -z "$working_path" ]; then
    export working_path=$SUBMIT_DIR
fi
export WORKING_DIR="$working_path/$Job_title/specfem/"  # directory on local nodes, where specfem runs
export DISK_DIR="$working_path/$Job_title/output/"      # temporary directory for data/model/gradient ...

echo "Submit job << $Job_title >> in : $SUBMIT_DIR  "
echo "Working directory: $WORKING_DIR"
echo "FINAL results in :  $SUBMIT_RESULT"
#########################################################################################
STARTTIME=$(date +%s)
echo "start time is :  $(date +"%T")"

rm -rf $WORKING_DIR
mkdir -p $WORKING_DIR

if $ReStart; then
    echo
    echo "Re-Starting job ..." 
    echo "Clean up result/DISK directories ..."
    rm -rf $SUBMIT_RESULT $DISK_DIR
    mkdir -p $SUBMIT_RESULT $DISK_DIR
else
    echo
    echo "Continue with current job ..."
fi 

echo 
echo "prepare data ..."
velocity_dir=$target_velocity_dir

bash $SCRIPTS_DIR/prepare_data_workstation_pwy_source.sh $velocity_dir 2> ./job_info/error_target

## SAVE
cp -r $SUBMIT_DIR/job_info/output $SUBMIT_RESULT/
cp -r $SUBMIT_DIR/parameter $SUBMIT_RESULT/

echo
echo " clean up local nodes (wait) ...... "
#rm -rf $working_path/$Job_title

ENDTIME=$(date +%s)
Ttaken=$(($ENDTIME - $STARTTIME))
echo
echo "finish time is : $(date +"%T")" 
echo "RUNTIME is :  $(($Ttaken / 3600)) hours ::  $(($(($Ttaken%3600))/60)) minutes  :: $(($Ttaken % 60)) seconds."

echo
echo "******************well done*******************************"
