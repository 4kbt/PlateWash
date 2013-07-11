#!/bin/bash

for  PLOTME in `ls output/bootstrapYukawa*.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME
	gnuplot yukawaPlots.gpl
done

