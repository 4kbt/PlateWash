#!/bin/bash

for  PLOTME in `ls output/bootstrapArbFit*Levenberg.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME
	gnuplot arbFitPlots.gpl
done

