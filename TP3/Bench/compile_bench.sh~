#!/bin/bash

source ../Confmodelsim/config 

## nettoyage
if [ -d ../Libs/LIB_TP3_BENCH ] 
then /bin/rm -rf ../Libs/LIB_TP3_BENCH
fi

## creation de la librairie de travail
vlib ../Libs/LIB_TP3_BENCH

## compilation
vcom -2008 -work LIB_TP3_BENCH bench_ctrl_oven.vhd
vcom -2008 -work LIB_TP3_BENCH config_bench_ctrl_oven_behavioral_all.vhd
#vcom -2008 -work LIB_TP3_BENCH bench_counter_oven.vhd
#vcom -2008 -work LIB_TP3_BENCH config_bench_counter_oven_behavioral.vhd
#vcom -2008 -work LIB_TP3_BENCH bench_complete_oven.vhd
#vcom -2008 -work LIB_TP3_BENCH config_bench_complete_oven_behavioral.vhd
