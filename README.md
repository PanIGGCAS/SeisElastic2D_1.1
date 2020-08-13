# SeisElastic2D_1.1

SeisElastic2D is an open-source package for multiparameter FWI in isotropic-, anisotropic- and visco-elastic media built upon several exiting packages including SPECFEM2D, seisDD, etc. Note that the SPECFEM2D package in SeisElastic2D has been updated to calculate the sensitivity kernels in isotropic-, VTI-, TTI- and visco-elastic media with various model parameterizations.

This package can be installed on large parallel computing cluster and local workstation with multiple processors. It provides different misfit functions, model parameterizations, advanced optimization methods, flexible inversion strategies and workflows, etc.  These features make it promising to overcome the difficulties in multiparameter elastic FWI and bridge the gap between adademic studies and industrial application. Using SeisElastic2D, we have applied isotropic-, VTI- and visco-elastic FWI to practical seismic data for hydrocarbon reservoir characterization.

Compared to SeisElastic2D version 1.0 (https://github.com/crewesleo/SeisElastic2D), this new version has the following updates:

(1) The package structure has been re-organized for easy-using;

(2) Scripts are provided for setting the paths, installing the packages, runing the forward modelling and FWI experiment on a local workstation;

(3) Three different approaches are provided for calculating the Q sensitivity kernels in visco-elastic FWI;

(4) New parameters are added for forward modelling and FWI with complex topographic variations;

(5) Scripts for 3D forward modelling and FWI experiments with GPU are added (the 3D modeling and FWI examples will be provided in SeisElastic3D.)

##################################################################
##################################################################

Please follow the steps below for installing and running the examples on a local workstation with at least 8 processors available:

(1) Install the prerequisite packages, as introduced in section 2.2.1 of the manual;
    
    a. Intel® Parallel Studio XE for Linux is available at
       https://software.intel.com/content/www/us/en/develop/articles/qualify-for-free-software.html
    b. openmpi_4.3.0 is available at https://www.open-mpi.org/software/ompi/v4.0/

(2) Set the paths for SeisElastic2D by source 0_setup.sh, as introduced in section 2.2.2 of the manual. 
    Before running 0_setup.sh, please change the corresponding paths in 0_setup.sh for openmpi and ifort, as shown in the following:
    
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

(3) Install scotch, SPECFEM2D and SeisElastic2D by bash 1_compile.sh, as introduced in sections 2.2.3 and 2.2.4 of the manual. Before running 1_compile.sh, please set the paths of icc and mpicc in ./specfem2d/src/meshfem2D/scotch_6.0.4/src/Makefile.inc for installing scotch, as shown in the following:

    CCS		= /home/wenyongp/intel/compilers_and_libraries_2020.1.217/linux/bin/intel64/icc
    CCP		= /home/wenyongp/Programs/Openmpi-4.0.3/bin/mpicc
    CCD		= /home/wenyongp/Programs/Openmpi-4.0.3/bin/mpicc

(4) Do forward modeling by bash 2_forward_modeling_example.sh, as introduced in section 3 of the manual.

(5) Do inversion experiment by bash 3_inversion_example.sh, as introduce in sections 2.2.4 and 4 of the manual;

(6) Plot the results by bash 4_plot_results.sh.

##################################################################
##################################################################

For downloading and using this package for your own studies, please cite the following publications:

Pan, W., Innanen, K & Wang, Y., 2020. Parameterization analysis and field validation of VTI-elastic full-waveform inversion in a walk-away vertical seismic profile configuration, Geophysics. 85(3), B87-B107.

Pan, W. & Innanen, K., 2019. Amplitude-based misfit functions in viscoelastic full-waveform inversion applied to walk-away vertical seismic profile data, Geophysics. 84(5), B335-B351.

Pan, W., Innanen, K., Geng Y. & Li, J., 2019. Interparameter tradeoff quantification for isotropic-elastic full-waveform inversion with various model parameterizations, Geophysics. 84, R185-R206.

Pan, W., Geng, Y. & Innanen, A. K., 2018. Interparameter tradeoff quantification and reduction in isotropic-elastic full-waveform inversion: synthetic experiments and Hussar land dataset application, Geophysical Journal International. 213, 1305-1333.

Pan, W., Innanen, K. & Geng, Y., 2018. Elastic full-waveform inversion and parameterization analysis applied to walk-away vertical seismic profile data for unconventional (heavy oil) reservoir characterization, Geophysical Journal International. 213, 1934-1968.

Yuan, O. Y., Simons, F. J. & Tromp, J., 2016. Double-difference adjoint seismic tomography, Geophysical Journal International. 206, 1599-1618.

Yuan, O. Y., Simons, F. J. & Bozdag, E., 2015. Multiscale adjoint waveform tomography for surface and body waves, Geophysics. 80, R281-R302.

Yuan, O. Y. & Simons, F. J., 2014. Multiscale adjoint waveform-difference tomography using wavelets, Geophysics. 79, WA79-WA95.



For any concern about this package, please feel free to contact Wenyong Pan via wenyongpan@mail.iggcas.ac.cn
