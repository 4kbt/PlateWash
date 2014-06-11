#!/bin/bash

for  PLOTME in `ls output/bootstrapYukawa.Sys*.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME
	sed  -i '1,9{/^$/d}' $PLOTME 

	gnuplot -e "HOMEDIR = \"$1\"" yukawaSystematicsPlots.gpl
done

for  PLOTME in `ls output/preFitPlotData.a*.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME

	gnuplot -e "HOMEDIR = \"$1\"" preFitPlot.gpl 
done

