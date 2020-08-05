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

    echo "prepare starting model ..."
    cp -r $initial_velocity_dir    $DISK_DIR/m_current

else
    echo
    echo "Continue with current job ..."
fi 

echo
echo "********************************************************************************************************"
echo "       Welcome job << $job >> " 
echo "       Scale: '$Wscale'; measurement: '${measurement_list}'; misfit_type: '${misfit_type_list}' " 
echo "********************************************************************************************************"
echo

echo "prepare data ..."
velocity_dir=$target_velocity_dir

bash $SCRIPTS_DIR/prepare_data_workstation_pwy_source.sh $velocity_dir 2> ./job_info/error_target

cp -Rf $DISK_DIR/m_current   $SUBMIT_RESULT/m_$(($iter_start-1))
# iteration loop
for (( iter=$iter_start;iter<=$iter_end;iter++ ))
do
    smooth_x=$(echo $(echo "$sigma_x $iter $sigma_x_rate" | awk '{ print $1-($2-1)*$3 }'))
    smooth_z=$(echo $(echo "$sigma_z $iter $sigma_z_rate" | awk '{ print $1-($2-1)*$3 }'))
    echo "          ***************************************"
    echo "          ** iteration $iter **"
    echo "          smooth_x=${smooth_x} smooth_z=${smooth_z} "
    echo "          ***************************************"

    echo "Forward/Adjoint simulation for current model ...... "
    velocity_dir=$DISK_DIR/m_current
    compute_adjoint=true
    
    bash $SCRIPTS_DIR/Adjoint_workstation_pwy_source.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current_$iter
    
    echo
    echo "sum data misfit ...... "
    mkdir -p $DISK_DIR/data_misfit
    step_length=0.0
    ./bin/data_misfit.exe $iter $step_length $compute_adjoint $NPROC_SPECFEM $DISK_DIR 2> ./job_info/error_sum_misfit_$iter


    file=$DISK_DIR/data_misfit/search_status.dat
    is_cont=$(awk -v "line=1" 'NR==line { print $1 }' $file)
    is_done=$(awk -v "line=2" 'NR==line { print $1 }' $file)
    is_brak=$(awk -v "line=3" 'NR==line { print $1 }' $file)
    step_length=$(awk -v "line=4" 'NR==line { print $1 }' $file)
    optimal_step_length=$(awk -v "line=5" 'NR==line { print $1 }' $file)
    echo "is_cont=$is_cont; is_done=$is_done; is_brak=$is_brak"
    if [ $is_brak -eq 1 ]; then
        echo "stop due to close zero data misfit!"
        break
    fi

    echo 
    echo "sum event kernel ...... "
    mkdir -p $DISK_DIR/misfit_kernel
    mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe $kernel_list $WORKING_DIR $DISK_DIR 2> ./job_info/error_sum_kernel_$iter

    if $VISCOELASTIC ; then
        if $TROMP_METHOD ; then
        # remove attenuation kernels first
          rm -r $DISK_DIR/misfit_kernel/*Qkappa*
          rm -r $DISK_DIR/misfit_kernel/*Qmu*
          rm -r $DISK_DIR/misfit_kernel/*Qalpha*
          rm -r $DISK_DIR/misfit_kernel/*Qbeta*
          echo "compute attenuation kernels"
          bash $SCRIPTS_DIR/Adjoint_attenuation.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current
          echo "summing attenuation kernels..."
          mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe 'Qalpha_kernel,Qbeta_kernel' $WORKING_DIR $DISK_DIR 2> ./job_info/error_sum_kernel_attenuation
        fi
    fi

    if $smooth ; then
        echo 
        echo "smooth misfit kernel ... "
        if [ $solver == 'specfem3D' ];
        then
            rm -rf OUTPUT_FILES
            mkdir OUTPUT_FILES
            mkdir OUTPUT_FILES/DATABASES_MPI
            cp $DISK_DIR/misfit_kernel/proc*external_mesh.bin OUTPUT_FILES/DATABASES_MPI/
        fi

        mpirun -np $NPROC_SPECFEM ./bin/xsmooth_sem $smooth_x $smooth_z $kernel_list $DISK_DIR/misfit_kernel/ $DISK_DIR/misfit_kernel/ $GPU_MODE > ./job_info/error_smooth_kernel_$iter
    fi

    echo 
    echo "optimization --> gradient/direction ... "
    mkdir -p $DISK_DIR/optimizer
    ./bin/optimization.exe $NPROC_SPECFEM $DISK_DIR $kernel_list $precond_list $model_list $iter 2> ./job_info/error_optimizer_$iter

    echo
    echo 'line search along the update direction ......'

    # line search
    while [ $is_done -eq 0 -a $is_brak -eq 0 -a $is_cont -eq 1 ]
    do

        echo 
        echo "update model ... "
        mkdir -p $DISK_DIR/m_try
        ./bin/model_update.exe $NPROC_SPECFEM $DISK_DIR $model_list $step_length 2> ./job_info/error_update_model_$iter

        echo
        echo "Forward simulation for update model ...... "
        velocity_dir=$DISK_DIR/m_try
        compute_adjoint=false
        
        bash $SCRIPTS_DIR/Adjoint_workstation_pwy_source.sh $velocity_dir $compute_adjoint 2> ./job_info/error_update_$iter

        echo
        echo "sum data misfit ...... "
        mkdir -p $DISK_DIR/data_misfit
        ./bin/data_misfit.exe $iter $step_length $compute_adjoint $NPROC_SPECFEM  $DISK_DIR 2> ./job_info/error_sum_misfit

        file=$DISK_DIR/data_misfit/search_status.dat
        is_cont=$(awk -v "line=1" 'NR==line { print $1 }' $file)
        is_done=$(awk -v "line=2" 'NR==line { print $1 }' $file)
        is_brak=$(awk -v "line=3" 'NR==line { print $1 }' $file)
        step_length=$(awk -v "line=4" 'NR==line { print $1 }' $file)
        optimal_step_length=$(awk -v "line=5" 'NR==line { print $1 }' $file)
        echo " is_cont=$is_cont; is_done=$is_done; is_brak=$is_brak"

        if [ $is_done -eq 1 ]; 
        then
            echo 
            echo "final model optimal_step_length=$optimal_step_length"
            ./bin/model_update.exe $NPROC_SPECFEM $DISK_DIR $model_list $optimal_step_length 2> ./job_info/error_update_model
            cp $DISK_DIR/m_try/proc* $DISK_DIR/m_current/
            cp -r  $DISK_DIR/m_current   $SUBMIT_RESULT/m_$iter
            break 
        fi

        if [ $is_brak -eq 1 ];
        then
            echo "stop due to failure of data misfit reduction!"
            break
        fi

    done  # end of line search

    if [ $is_brak -eq 1 ];
    then
        echo 
        echo "Terminate all iterations in $job"
        break
    fi

    echo 
    echo "prepare for next iteration ..."
    cp -r  $DISK_DIR/optimizer/g_new.bin $DISK_DIR/optimizer/g_old.bin
    cp -r  $DISK_DIR/optimizer/p_new.bin $DISK_DIR/optimizer/p_old.bin
    cp -r  $DISK_DIR/optimizer/m_new.bin $DISK_DIR/optimizer/m_old.bin

    echo 
    echo "******************finish iteration $iter for ${misfit_type_list} $job ************"
done  # end of iterative updates

echo
echo "******************finish all iterations for ${misfit_type_list} $job *************"

cp -r $SUBMIT_DIR/parameter $SUBMIT_RESULT/
cp -r $DISK_DIR/data_misfit $SUBMIT_RESULT/
#cp -r $SUBMIT_DIR/job_info/output $SUBMIT_RESULT/

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

#cp -r $SUBMIT_DIR/job_info/output $SUBMIT_RESULT/
