#!/bin/bash

#This script generates submake files for parallel making of dynamic targets.

#Run List
RL=$1

#Filename of the submake file "subMake.inc" perhaps?
FN=$2

#Dependency list, if you need it for an external call
DL=$3

#Target suffix "Filter.dat", perhaps?
TSUFFIX=$4

#M-file to be run.
ACTION=$5

#Dependencies (just the name of the Make variable, not the dollar-signed expansion.
DEPENDENCIES=$6

rm $FN $DL

for RN in $(cat ${RL})
do
	echo $RN
	echo run${RN}${TSUFFIX} : $ACTION \$\(${DEPENDENCIES}\) >> $FN
	echo -e "\t"\$\(OCT\) --eval \'nameCtr = $RN\' $ACTION  >> $FN
	echo >> $FN

	echo run${RN}Filter.dat >> $DL
done
