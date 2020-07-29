#!/bin/bash

cd $SeisElastic2D/EXAMPLES/FWI_EXAMPLES

rm -rf RESULTS_example

tar -zxvf RESULTS_example.tar.gz

cd $SeisElastic2D

## plot the true and initial models of elastic constants in VTI-elastic media

python $VISUALIZE/plot_bin_VTI_true_initial_models_SE2D_manual c11 8

## plot the inverted elastic constants in VTI-elastic media

python $VISUALIZE/plot_bin_VTI_inverted_models_SE2D_manual c11 8
