#!/bin/bash

MERGEFILE=resistorMerge.dat

rm $MERGEFILE

for ctr in 3176 3177 3178 3179 3180; 
do
	cat longStroke${ctr}.dat >>  $MERGEFILE
done
