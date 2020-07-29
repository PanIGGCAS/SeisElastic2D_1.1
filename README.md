# SeisElastic2D_1.1

SeisElastic2D is an open-source package for multiparameter FWI in isotropic-, anisotropic- and visco-elastic media built upon several exiting packages including SPECFEM2D, seisDD, etc. Note that the SPECFEM2D package in SeisElastic2D has been updated to calculate the sensitivity kernels in isotropic-, VTI-, TTI- and visco-elastic media with various model parameterizations.

This package is developed on parallel computing cluster with OpenMPI/MPI. It provides different misfit functions, model parameterizations, advanced optimization methods, flexible inversion strategies and workflows, etc.  These features make it promising to overcome the difficulties in multiparameter elastic FWI and bridge the gap between adademic studies and industrial application. Using SeisElastic2D, we have applied isotropic-, VTI- and visco-elastic FWI to practical seismic data for hydrocarbon reservoir characterization.

Compared to SeisElastic2D version 1.0 (https://github.com/crewesleo/SeisElastic2D), this new version has the following updates:

(1) The package structure has been changed for easy-using;

(2) Scripts are provided for runing the forward modelling and FWI experiments on local workstation;

(3) Three different approaches are provided for calculating the Q sensitivity kernels in visco-elastic FWI;

(4) New parameters are added for forward modelling and FWI with complex topographic variations;

(5) Scripts for 3D forward modelling and FWI experiments with GPU are added (the 3D modeling and FWI codes are not provided!)

(6) One single shell script are added for user to setup the environment paths and run the forward modeling and FWI experiments. 

****************************************************************************************************************************************
****************************************************************************************************************************************
Please following the steps listed below for installing the package:

(1) Install the prerequisite packages, as introduced in section 2.2.1 of the manual;

(2) Set the paths for SeisElastic2D with the script of 0_setup.sh (source 0_setup.sh), as introduced in section 2.2.2 of the manual;

(3) Install scotch, SPECFEM2D and SeisElastic2D with the script of 1_compile.sh, as introduced in sections 2.2.3 and 2.2.4 of the manual; (Before bash 1_compile.sh, please set the paths of icc and mpicc in Makefile.inc for installing scotch.)

(4) Do forward modeling, as introduced in section 3 of the manual. Script of 2_forward_modeling_example.sh is provided to do forward modeling and generate the model files.

(5) Do inversion experiment, as introduce in sections 2.2.4 and 4 of the manual; Script of 3_inversion_example.sh is provided to do inversion experiment.

(6) plot the results with the script of 4_plot_results.sh.

****************************************************************************************************************************************
****************************************************************************************************************************************


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
