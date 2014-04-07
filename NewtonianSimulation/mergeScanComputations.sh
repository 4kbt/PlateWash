#!/bin/bash

OF=SimulationOutput/scans/scanMerge.dat

rm $OF

for fn in `ls SimulationOutput/scans/*.dat`
do 
	echo $fn
	cat $fn >> $OF
	echo >> $OF
	echo >> $OF
done
