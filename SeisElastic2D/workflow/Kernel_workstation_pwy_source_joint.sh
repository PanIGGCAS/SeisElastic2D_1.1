#!/bin/bash

ulimit -s unlimited

source ./parameter
export user=$(whoami)

cd $SUBMIT_DIR
#################### input parameters ###################################################
# directories
export SCRIPTS_DIR="$package_path/scripts" 
export SUBMIT_RESULT="$SUBMIT_DIR/RESULTS/$job/Scale${Wscale}_${measurement_list}_${misfit_type_list}"  # final results
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

rm -rf $WORKING_DIR # commented by PWY 14-01-2018
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

echo
echo "prepare starting model ..."
rm -rf $DISK_DIR/m_current
cp -r $initial_velocity_dir    $DISK_DIR/m_current

echo
echo "********************************************************************************************************"
echo "       Welcome job << $job >> " 
echo "       Scale: '$Wscale'; measurement: '${measurement_list}'; misfit_type: '${misfit_type_list}' " 
echo "********************************************************************************************************"

echo "Forward/Adjoint simulation for current model ...... "
velocity_dir=$DISK_DIR/m_current
compute_adjoint=true

bash $SCRIPTS_DIR/Adjoint_workstation_pwy_source.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current

echo 
echo "sum event kernel ...... "
mkdir -p $DISK_DIR/misfit_kernel
mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe $kernel_list $WORKING_DIR $DISK_DIR 2> ./job_info/error_sum_kernel

if $VISCOELASTIC ; then
    # remove attenuation kernels first
    if $TROMP_METHOD; then
      rm -r $DISK_DIR/misfit_kernel/*Qkappa*
      rm -r $DISK_DIR/misfit_kernel/*Qmu*
      rm -r $DISK_DIR/misfit_kernel/*Qalpha*
      rm -r $DISK_DIR/misfit_kernel/*Qbeta*
      echo "compute attenuation kernels"
      bash $SCRIPTS_DIR/Adjoint_attenuation_workstation.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current
      echo "summing attenuation kernels..."
      mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe 'Qkappa_kernel,Qmu_kernel,Qalpha_kernel,Qbeta_kernel' $WORKING_DIR $DISK_DIR 2> ./job_info/error_sum_kernel_attenuation
    fi
fi

if $smooth ; 
then
    echo 
    echo "smooth misfit kernel ... "
    if [ $solver == 'specfem3D' ];
    then 
        rm -rf OUTPUT_FILES 
        mkdir OUTPUT_FILES
        mkdir OUTPUT_FILES/DATABASES_MPI
        cp $DISK_DIR/misfit_kernel/proc*external_mesh.bin OUTPUT_FILES/DATABASES_MPI/   
    fi
    mpirun -np $NPROC_SPECFEM ./bin/xsmooth_sem $sigma_x $sigma_z $kernel_list $DISK_DIR/misfit_kernel/ $DISK_DIR/misfit_kernel/ false 2> ./job_info/error_smooth_kernel
fi

echo
echo "******************finish all for scale $Wscale **************"

cp -r $SUBMIT_DIR/parameter $SUBMIT_RESULT/
cp -r $DISK_DIR/misfit_kernel $SUBMIT_RESULT/
#mkdir -p $SUBMIT_RESULT/WD
#cp -r $DISK_DIR/misfit_kernel $SUBMIT_RESULT/WD
echo
echo " clean up local nodes (wait) ...... "
#rm -rf $working_path/$Job_title
#rm -rf OUTPUT_FILES

ENDTIME=$(date +%s)
Ttaken=$(($ENDTIME - $STARTTIME))
echo
echo "finish time is : $(date +"%T")" 
echo "RUNTIME is :  $(($Ttaken / 3600)) hours ::  $(($(($Ttaken%3600))/60)) minutes  :: $(($Ttaken % 60)) seconds."

echo
echo "******************well done*******************************"

cp -r $SUBMIT_DIR/job_info/output $SUBMIT_RESULT/
