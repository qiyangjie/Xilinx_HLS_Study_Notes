set prj_name dma_tutorial_2_2
set top_name dma_tutorial_2_2
set file_dir_1 ../ip/dma_tutorial_2.h
set file_dir_2 ../ip/dma_tutorial_2_2.cpp 
############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project $prj_name
set_top $top_name
add_files $file_dir_1
add_files $file_dir_2
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
csynth_design
export_design -rtl verilog -format ip_catalog
exit
