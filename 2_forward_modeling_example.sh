#!/bin/bash

cd $SeisElastic2D/EXAMPLES/Model_generation

rm -rf CW_VTI_syn

tar -zxvf CW_VTI_syn.tar.gz

cd ./CW_VTI_syn

bash run_this_example.sh

cd $SeisElastic2D
