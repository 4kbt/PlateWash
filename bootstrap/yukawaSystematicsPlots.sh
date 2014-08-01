#!/bin/bash

for  PLOTME in `ls output/bootstrapYukawa.Sys*.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME
	sed  -i '1,9{/^$/d}' $PLOTME 

	gnuplot -e "HOMEDIR = \"$1\"" yukawaSystematicsPlots.gpl
done

for  PLOTME in `ls output/*.plt`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME

	gnuplot -e "HOMEDIR = \"$1\"" preFitPlot.gpl
	#convert ${PLOTME}.eps -resize 3240x3240 -quality 96 ${PLOTME}.png  
	convert ${PLOTME}.eps -flatten -resize 3240x3240 ${PLOTME}.jpg  
done

