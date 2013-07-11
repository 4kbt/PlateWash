#!/bin/bash

for  PLOTME in `ls output/bootstrapArbFit*.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME
	gnuplot arbFitPlots.gpl
done

