#!/bin/bash

#Promote internal variables to LyX-accessible text
./run3147parsePreSM3A.sh
mathify.sh extracted/*

#Filter transfer functions
octave  run3147filterFrequencyResponse.m
gnuplot run3147filterFrequencyResponse.gpl

#Filters applied to real data
octave run3169filterTransfer.m
gnuplot run3169filterTransfer.gpl

#Window functions --> needs work for delays
octave  run3147windowTransferFunctions.m
gnuplot run3147windowTransferFunctions.gpl

