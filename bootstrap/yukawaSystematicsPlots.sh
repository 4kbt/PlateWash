#!/bin/bash

for  PLOTME in `ls output/bootstrapYukawa.Sys*.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME
	gnuplot yukawaPlots.gpl
done

