#!/bin/bash

# parameters
source ./parameter
data_tag='DATA_obs'
velocity_dir=$1
SAVE_FORWARD=false

# local id (from 0 to $ntasks-1)

iproc=0

# allocate tasks over all sources
# ntasks in parallel and nsrc in total
# nsrc_per_task=$(( $NSRC / $ntasks ))
# take ceiling 
nsrc_per_task_ceiling=$(echo $(echo "$NSRC $ntasks" | awk '{ print $1/$2 }') | awk '{printf("%d\n",$0+=$0<0?0:0.999)}')
ntasks_ceiling=$(echo $(echo "$NSRC $ntasks" | awk '{print $1%$2}')) 
# take floor 
nsrc_per_task_floor=$(echo $(echo "$NSRC $ntasks" | awk '{ print int($1/$2) }'))

echo "nsrc_per_task_ceiling is $nsrc_per_task_ceiling"
echo "ntasks_ceiling is $ntasks_ceiling"
echo "nsrc_per_task_floor is $nsrc_per_task_floor"


# source for this task

#isource=1

#STARTTIME=$(date +%s)
#if  $ExistDATA && [ -d "$DATA_DIR" ]; then
#   bash $SCRIPTS_DIR/copy_data.sh $isource $data_tag $data_list $WORKING_DIR $DISK_DIR $DATA_DIR
#else
#   bash $SCRIPTS_DIR/Forward_${solver}.sh $isource $NPROC_SPECFEM $data_tag $data_list \
#      $velocity_dir $SAVE_FORWARD $WORKING_DIR $DISK_DIR $DATA_DIR $job 2>./job_info/error_Forward_simulation
#fi
#if [ $isource -eq 1 ] ; then
#    ENDTIME=$(date +%s)
#    Ttaken=$(($ENDTIME - $STARTTIME))
#    echo "Data preparation took $Ttaken seconds"
#fi

# source for this task
for ((isource=1; isource<=${NSRC}; isource++));
do 
    STARTTIME=$(date +%s)
    if  $ExistDATA && [ -d "$DATA_DIR" ]; then
       bash $SCRIPTS_DIR/copy_data.sh $isource $data_tag $data_list $WORKING_DIR $DISK_DIR $DATA_DIR
    else
       bash $SCRIPTS_DIR/Forward_${solver}.sh $isource $NPROC_SPECFEM $data_tag $data_list \
          $velocity_dir $SAVE_FORWARD $WORKING_DIR $DISK_DIR $DATA_DIR $job 2>./job_info/error_Forward_simulation
    fi
 if [ $isource -eq 1 ] ; then
     ENDTIME=$(date +%s)
     Ttaken=$(($ENDTIME - $STARTTIME))
     echo "Data preparation took $Ttaken seconds"
 fi
done
