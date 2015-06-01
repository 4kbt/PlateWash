#!/bin/bash
# $1 is HOMEDIR.

for  PLOTME in `ls *Merge.dat`
do
	echo $PLOTME
	export GNUPLOTME=$PLOTME

	#Removes blank lines from the first nine lines?
	sed  -i '1,9{/^$/d}' $PLOTME 

	# copies $(OCT) from Makefile.inc; it is definitive reference
	# apologies for the repetition, not sure how to resolve it correctly
	octave --no-init-file \
		--eval 'global HOMEDIR = "'$1'";'\
	        --eval 'initializeOctave;'\
	        --eval 'ignore_function_time_stamp("all");'\
	        -p $1/globalConfig/ \
	        -q \
		confIntervalWrapper.m $PLOTME

	gnuplot -e "HOMEDIR = \"$1\"" yukawaSystematicsPlots.gpl
	gnuplot -e "HOMEDIR = \"$1\"" yukawaSystematicsPlotsZoom.gpl
	gnuplot -e "HOMEDIR = \"$1\"; gravityOnly = 1" yukawaSystematicsPlots.gpl
	gnuplot -e "HOMEDIR = \"$1\"; gravityOnly = 1" yukawaSystematicsPlotsZoom.gpl
done

#for  PLOTME in `ls output/*.plt`
#do
#	echo $PLOTME
#	export GNUPLOTME=$PLOTME
#
#	gnuplot -e "HOMEDIR = \"$1\"" preFitPlot.gpl
#	#convert ${PLOTME}.eps -resize 3240x3240 -quality 96 ${PLOTME}.png  
#	convert ${PLOTME}.eps -flatten -resize 3240x3240 ${PLOTME}.jpg  
#done

