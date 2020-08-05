#!/bin/bash

ulimit -s unlimited

source ./parameter
export user=$(whoami)

cd $SUBMIT_DIR
#################### input parameters ###################################################
# directories
export SCRIPTS_DIR="$package_path/scripts"
export SUBMIT_RESULT="$SUBMIT_DIR/RESULTS/$job/Scale${Wscale}_${measurement_list_01}_${measurement_list_02}_${misfit_type_list}"     # final results
if [ -z "$working_path" ]; then
    export working_path=$SUBMIT_DIR
fi
#export WORKING_DIR="$working_path/$Job_title/specfem/"  # directory on local nodes, where specfem runs
#export DISK_DIR="$working_path/$Job_title/output/"      # temporary directory for data/model/gradient ...

export WORKING_DIR_01="$working_path/$Job_title/01/specfem/"  # directory on local nodes, where specfem runs
export DISK_DIR_01="$working_path/$Job_title/01/output/"      # temporary directory for data/model/gradient ...

export WORKING_DIR_02="$working_path/$Job_title/02/specfem/"  # directory on local nodes, where specfem runs
export DISK_DIR_02="$working_path/$Job_title/02/output/"      # temporary directory for data/model/gradient ...

echo "Submit job << $Job_title >> in : $SUBMIT_DIR  "
echo "Working directory for $measurement_list_01 misfit: $WORKING_DIR_01"
echo "Working directory for $measurement_list_02 misfit: $WORKING_DIR_02"
echo "FINAL results in :  $SUBMIT_RESULT"

#########################################################################################
STARTTIME=$(date +%s)
echo "start time is :  $(date +"%T")"

rm -rf $WORKING_DIR_01
mkdir -p $WORKING_DIR_01

rm -rf $WORKING_DIR_02
mkdir -p $WORKING_DIR_02

if $ReStart; then
    echo
    echo "Re-Starting job ..." 
    echo "Clean up result/DISK directories ..."
    rm -rf $SUBMIT_RESULT $DISK_DIR_01 $DISK_DIR_02
    mkdir -p $SUBMIT_RESULT $DISK_DIR_01 $DISK_DIR_02

    echo "prepare starting model ..."
    cp -r $initial_velocity_dir    $DISK_DIR_01/m_current
    cp -r $initial_velocity_dir    $DISK_DIR_02/m_current
else
    echo
    echo "Continue with current job ..."
fi 

echo
echo "********************************************************************************************************"
echo "       Welcome job << $job >> " 
echo "       Scale: '$Wscale'; measurements: '${measurement_list_01}' and '${measurement_list_02}'; misfit_type: '${misfit_type_list}' " 
echo "********************************************************************************************************"
echo

echo "prepare data ..."
velocity_dir=$target_velocity_dir

bash $SCRIPTS_DIR/prepare_data_workstation_pwy_source_joint.sh $velocity_dir 2> ./job_info/error_target

mkdir -p $SUBMIT_RESULT/m_$(($iter_start-1))
cp -Rf $DISK_DIR_01/m_current/*  $SUBMIT_RESULT/m_$(($iter_start-1))
# iteration loop
for (( iter=$iter_start;iter<=$iter_end;iter++ ))
do
    mkdir -p $SUBMIT_RESULT/m_$iter

    is_brak_01=0
    is_brak_02=0
    while [ $is_brak_01 -eq 0 ]
    do

        smooth_x=$(echo $(echo "$sigma_x $iter $sigma_x_rate" | awk '{ print $1-($2-1)*$3 }'))
        smooth_z=$(echo $(echo "$sigma_z $iter $sigma_z_rate" | awk '{ print $1-($2-1)*$3 }'))
        echo "          ***************************************"
        echo "          ** iteration $iter **"
        echo "          ** measurement 01 : '${measurement_list_01}'**"
        echo "          smooth_x=${smooth_x} smooth_z=${smooth_z} "
        echo "          ***************************************"

        echo "Forward/Adjoint simulation for current model ...... "
        velocity_dir=$DISK_DIR_01/m_current
        compute_adjoint=true
    
        bash $SCRIPTS_DIR/Adjoint_workstation_pwy_source_joint_01.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current_01_$iter
    
        echo
        echo "sum data misfit ...... "
        mkdir -p $DISK_DIR_01/data_misfit
        step_length_01=0.0
        ./bin/data_misfit.exe $iter $step_length_01 $compute_adjoint $NPROC_SPECFEM $DISK_DIR_01 2> ./job_info/error_sum_misfit_01_$iter


        file=$DISK_DIR_01/data_misfit/search_status.dat
        is_cont_01=$(awk -v "line=1" 'NR==line { print $1 }' $file)
        is_done_01=$(awk -v "line=2" 'NR==line { print $1 }' $file)
        is_brak_01=$(awk -v "line=3" 'NR==line { print $1 }' $file)
        step_length_01=$(awk -v "line=4" 'NR==line { print $1 }' $file)
        optimal_step_length_01=$(awk -v "line=5" 'NR==line { print $1 }' $file)
        echo "is_cont=$is_cont_01; is_done=$is_done_01; is_brak=$is_brak_01"
        if [ $is_brak_01 -eq 1 ]; then
            echo "stop due to close zero data misfit!"
            break
        fi

        echo 
        echo "sum event kernel ...... "
        mkdir -p $DISK_DIR_01/misfit_kernel
        mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe $kernel_list_01 $WORKING_DIR_01 $DISK_DIR_01 2> ./job_info/error_sum_kernel_01_$iter

        if $VISCOELASTIC ; then
            if $TROMP_METHOD ; then
            # remove attenuation kernels first
              rm -r $DISK_DIR_01/misfit_kernel/*Qkappa*
              rm -r $DISK_DIR_01/misfit_kernel/*Qmu*
              rm -r $DISK_DIR_01/misfit_kernel/*Qalpha*
              rm -r $DISK_DIR_01/misfit_kernel/*Qbeta*
              echo "compute attenuation kernels"
              bash $SCRIPTS_DIR/Adjoint_attenuation.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current_01
              echo "summing attenuation kernels..."
              mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe 'Qalpha_kernel,Qbeta_kernel' $WORKING_DIR_01 $DISK_DIR_01 2> ./job_info/error_sum_kernel_attenuation_01
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
                cp $DISK_DIR_01/misfit_kernel/proc*external_mesh.bin OUTPUT_FILES/DATABASES_MPI/
            fi

            mpirun -np $NPROC_SPECFEM ./bin/xsmooth_sem $smooth_x $smooth_z $kernel_list_01 $DISK_DIR_01/misfit_kernel/ $DISK_DIR_01/misfit_kernel/ $GPU_MODE > ./job_info/error_smooth_kernel_01_$iter
        fi

        echo 
        echo "optimization --> gradient/direction ... "
        mkdir -p $DISK_DIR_01/optimizer
        ./bin/optimization.exe $NPROC_SPECFEM $DISK_DIR_01 $kernel_list_01 $precond_list $model_list_01 $iter 2> ./job_info/error_optimizer_01_$iter

        echo
        echo 'line search along the update direction ......'

        # line search
        while [ $is_done_01 -eq 0 -a $is_brak_01 -eq 0 -a $is_cont_01 -eq 1 ]
        do

            echo 
            echo "update model ... "
            mkdir -p $DISK_DIR_01/m_try
            ./bin/model_update.exe $NPROC_SPECFEM $DISK_DIR_01 $model_list_01 $step_length_01 2> ./job_info/error_update_model_01_$iter

            echo
            echo "Forward simulation for update model ...... "
            velocity_dir=$DISK_DIR_01/m_try
            compute_adjoint=false
        
            bash $SCRIPTS_DIR/Adjoint_workstation_pwy_source_joint_01.sh $velocity_dir $compute_adjoint 2> ./job_info/error_update_01_$iter

            echo
            echo "sum data misfit ...... "
            mkdir -p $DISK_DIR_01/data_misfit
            ./bin/data_misfit.exe $iter $step_length_01 $compute_adjoint $NPROC_SPECFEM  $DISK_DIR_01 2> ./job_info/error_sum_misfit_01

            file=$DISK_DIR_01/data_misfit/search_status.dat
            is_cont_01=$(awk -v "line=1" 'NR==line { print $1 }' $file)
            is_done_01=$(awk -v "line=2" 'NR==line { print $1 }' $file)
            is_brak_01=$(awk -v "line=3" 'NR==line { print $1 }' $file)
            step_length_01=$(awk -v "line=4" 'NR==line { print $1 }' $file)
            optimal_step_length_01=$(awk -v "line=5" 'NR==line { print $1 }' $file)
            echo " is_cont=$is_cont_01; is_done=$is_done_01; is_brak=$is_brak_01"

            if [ $is_done_01 -eq 1 ]; 
            then
                echo 
                echo "final model optimal_step_length=$optimal_step_length_01"
                ./bin/model_update.exe $NPROC_SPECFEM $DISK_DIR_01 $model_list_01 $optimal_step_length_01 2> ./job_info/error_update_model_01
                cp $DISK_DIR_01/m_try/proc* $DISK_DIR_01/m_current/
                cp -r  $DISK_DIR_01/m_current/*   $SUBMIT_RESULT/m_$iter
                cp -r  $DISK_DIR_01/m_current/* $DISK_DIR_02/m_current
                break 
            fi

            if [ $is_brak_01 -eq 1 ];
            then
                echo "stop 01 due to failure of data misfit reduction!"
                break
            fi

        done  # end of line search

        if [ $is_brak_01 -eq 1 ];
        then
            echo 
            echo "Terminate the iterations for 01 in $job"
            break
        fi

        if [ $is_done_01 -eq 1 ];
        then
            break
        fi

        echo 
        echo "prepare for next iteration ..."
        cp -r  $DISK_DIR_01/optimizer/g_new.bin $DISK_DIR_01/optimizer/g_old.bin
        cp -r  $DISK_DIR_01/optimizer/p_new.bin $DISK_DIR_01/optimizer/p_old.bin
        cp -r  $DISK_DIR_01/optimizer/m_new.bin $DISK_DIR_01/optimizer/m_old.bin
    done # end of 01    

    while [ $is_brak_02 -eq 0 ]
    do

        echo "          ***************************************"
        echo "          ** iteration $iter **"
        echo "          ** measurement 02 : '${measurement_list_02}'**"
        echo "          smooth_x=${smooth_x} smooth_z=${smooth_z} "
        echo "          ***************************************"

        echo "Forward/Adjoint simulation for current model ...... "
        velocity_dir=$DISK_DIR_02/m_current
        compute_adjoint=true
    
        bash $SCRIPTS_DIR/Adjoint_workstation_pwy_source_joint_02.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current_02_$iter
    
        echo
        echo "sum data misfit ...... "
        mkdir -p $DISK_DIR_02/data_misfit
        step_length_02=0.0
        ./bin/data_misfit.exe $iter $step_length_02 $compute_adjoint $NPROC_SPECFEM $DISK_DIR_02 2> ./job_info/error_sum_misfit_02_$iter


        file=$DISK_DIR_02/data_misfit/search_status.dat
        is_cont_02=$(awk -v "line=1" 'NR==line { print $1 }' $file)
        is_done_02=$(awk -v "line=2" 'NR==line { print $1 }' $file)
        is_brak_02=$(awk -v "line=3" 'NR==line { print $1 }' $file)
        step_length_02=$(awk -v "line=4" 'NR==line { print $1 }' $file)
        optimal_step_length_02=$(awk -v "line=5" 'NR==line { print $1 }' $file)
        echo "is_cont=$is_cont_02; is_done=$is_done_02; is_brak=$is_brak_02"
        if [ $is_brak_02 -eq 1 ]; then
            echo "stop due to close zero data misfit!"
            break
        fi

        echo 
        echo "sum event kernel ...... "
        mkdir -p $DISK_DIR_02/misfit_kernel
        mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe $kernel_list_02 $WORKING_DIR_02 $DISK_DIR_02 2> ./job_info/error_sum_kernel_02_$iter

        if $VISCOELASTIC ; then
            if $TROMP_METHOD ; then
            # remove attenuation kernels first
              rm -r $DISK_DIR_02/misfit_kernel/*Qkappa*
              rm -r $DISK_DIR_02/misfit_kernel/*Qmu*
              rm -r $DISK_DIR_02/misfit_kernel/*Qalpha*
              rm -r $DISK_DIR_02/misfit_kernel/*Qbeta*
              echo "compute attenuation kernels"
              bash $SCRIPTS_DIR/Adjoint_attenuation.sh $velocity_dir $compute_adjoint 2> ./job_info/error_current_02
              echo "summing attenuation kernels..."
              mpirun -np $NPROC_SPECFEM ./bin/sum_kernel.exe 'Qalpha_kernel,Qbeta_kernel' $WORKING_DIR_02 $DISK_DIR_02 2> ./job_info/error_sum_kernel_attenuation_02
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
                cp $DISK_DIR_02/misfit_kernel/proc*external_mesh.bin OUTPUT_FILES/DATABASES_MPI/
            fi

            mpirun -np $NPROC_SPECFEM ./bin/xsmooth_sem $smooth_x $smooth_z $kernel_list_02 $DISK_DIR_02/misfit_kernel/ $DISK_DIR_02/misfit_kernel/ $GPU_MODE > ./job_info/error_smooth_kernel_02_$iter
        fi

        echo 
        echo "optimization --> gradient/direction ... "
        mkdir -p $DISK_DIR_02/optimizer
        ./bin/optimization.exe $NPROC_SPECFEM $DISK_DIR_02 $kernel_list_02 $precond_list $model_list_02 $iter 2> ./job_info/error_optimizer_02_$iter

        echo
        echo 'line search along the update direction ......'

        # line search
        while [ $is_done_02 -eq 0 -a $is_brak_02 -eq 0 -a $is_cont_02 -eq 1 ]
        do

            echo 
            echo "update model ... "
            mkdir -p $DISK_DIR_02/m_try
            ./bin/model_update.exe $NPROC_SPECFEM $DISK_DIR_02 $model_list_02 $step_length_02 2> ./job_info/error_update_model_02_$iter

            echo
            echo "Forward simulation for update model ...... "
            velocity_dir=$DISK_DIR_02/m_try
            compute_adjoint=false
        
            bash $SCRIPTS_DIR/Adjoint_workstation_pwy_source_joint_02.sh $velocity_dir $compute_adjoint 2> ./job_info/error_update_02_$iter

            echo
            echo "sum data misfit ...... "
            mkdir -p $DISK_DIR_02/data_misfit
            ./bin/data_misfit.exe $iter $step_length_02 $compute_adjoint $NPROC_SPECFEM  $DISK_DIR_02 2> ./job_info/error_sum_misfit_02

            file=$DISK_DIR_02/data_misfit/search_status.dat
            is_cont_02=$(awk -v "line=1" 'NR==line { print $1 }' $file)
            is_done_02=$(awk -v "line=2" 'NR==line { print $1 }' $file)
            is_brak_02=$(awk -v "line=3" 'NR==line { print $1 }' $file)
            step_length_02=$(awk -v "line=4" 'NR==line { print $1 }' $file)
            optimal_step_length_02=$(awk -v "line=5" 'NR==line { print $1 }' $file)
            echo " is_cont=$is_cont_02; is_done=$is_done_02; is_brak=$is_brak_02"

            if [ $is_done_02 -eq 1 ]; 
            then
                echo 
                echo "final model optimal_step_length=$optimal_step_length_02"
                ./bin/model_update.exe $NPROC_SPECFEM $DISK_DIR_02 $model_list_02 $optimal_step_length_02 2> ./job_info/error_update_model_02
                cp $DISK_DIR_02/m_try/proc* $DISK_DIR_02/m_current/
                cp -r  $DISK_DIR_02/m_current/*   $SUBMIT_RESULT/m_$iter
                cp -r  $DISK_DIR_02/m_current/* $DISK_DIR_01/m_current
                break 
            fi

            if [ $is_brak_02 -eq 1 ];
            then
                echo "stop 02 due to failure of data misfit reduction!"
                break
            fi

        done  # end of line search

        if [ $is_brak_02 -eq 1 ];
        then
            echo 
            echo "Terminate the iterations of 02 in $job"
            break
        fi

        if [ $is_done_02 -eq 1 ];
        then
            break
        fi

        echo 
        echo "prepare for next iteration ..."
        cp -r  $DISK_DIR_02/optimizer/g_new.bin $DISK_DIR_02/optimizer/g_old.bin
        cp -r  $DISK_DIR_02/optimizer/p_new.bin $DISK_DIR_02/optimizer/p_old.bin
        cp -r  $DISK_DIR_02/optimizer/m_new.bin $DISK_DIR_02/optimizer/m_old.bin
    done # end of 02

    if [ $is_brak_01 -eq 1 -a $is_brak_02 -eq 1 ];
    then
        echo 
        echo "Terminate all iterations in $job"
        rm -rf $SUBMIT_RESULT/m_$iter
        break
    fi    

    echo 
    echo "******************finish iteration $iter for ${misfit_type_list} $job ************"
done  # end of iterative updates

echo
echo "******************finish all iterations for ${misfit_type_list} $job *************"

cp -r $SUBMIT_DIR/parameter $SUBMIT_RESULT/
cp -r $DISK_DIR_01/data_misfit $SUBMIT_RESULT/data_misfit_01
cp -r $DISK_DIR_02/data_misfit $SUBMIT_RESULT/data_misfit_02
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
