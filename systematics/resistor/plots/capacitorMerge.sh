#!/bin/bash

MERGEFILE=capacitorMerge.dat

rm $MERGEFILE

for ctr in 3181 3182; 
do
	cat longStroke${ctr}.dat >>  $MERGEFILE
done
