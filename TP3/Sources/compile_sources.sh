#!/bin/bash

source ../Confmodelsim/config 

## nettoyage
if [ -d ../Libs/LIB_TP3 ] 
then /bin/rm -rf ../Libs/LIB_TP3
fi

## creation de la librairie de travail
vlib ../Libs/LIB_TP3

## compilation
#vcom +cover=bfs -work  LIB_TP3 counter_oven.vhd
#vcom +cover=bfs -work  LIB_TP3 counter_oven_behavioral.vhd
vcom +cover=bfs -work  LIB_TP3 ctrl_oven.vhd
vcom +cover=bfs -work  LIB_TP3 ctrl_oven_behavioral.vhd
vcom +cover=bfs -work  LIB_TP3 area_optimization/ctrl_oven_behavioral_binary.vhd
vcom +cover=bfs -work  LIB_TP3 area_optimization/ctrl_oven_behavioral_onehot.vhd
vcom +cover=bfs -work  LIB_TP3 area_optimization/ctrl_oven_behavioral_gray.vhd
#vcom +cover=bfs -work  LIB_TP3 complete_oven.vhd
#vcom +cover=bfs -work  LIB_TP3 complete_oven_behavioral.vhd

