#!/bin/bash

#Change to indicated directory
cd $1

for CTR in `seq -f "%04g" 1 3400`
do
	FN=run${CTR}pw.hdr
	if [ -e "$FN" ]
		then
		echo ${CTR}PW
		grep -A 1 Title  $FN | sed "1d" 
		if [ -e "run${CTR}pw.not" ]
		then
			cat run${CTR}pw.not
		fi
	fi

	FN=run${CTR}ps.hdr
	if [ -e "$FN" ]
		then
		echo ${CTR}PS
		grep -A 1 Title  $FN | sed "1d" 
		if [ -e "run${CTR}pw.not" ]
		then
			cat run${CTR}pw.not
		fi
	fi

	FN=run${CTR}ifo.dat
	if [ -e "$FN" ]
	then
		echo ${CTR}IFO
		head -n 2 $FN | sed "1d"
	fi

done
