#!/bin/bash

for  PLOTME in `ls output/bootstrapYukawa.Sim*.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME
	gnuplot yukawaPlots.gpl
done

