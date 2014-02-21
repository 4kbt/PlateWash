#!/bin/bash
# $1 is awk file, $2 is data directory

DIR=aveTempData/

for NAME in `ls $2`
do
	FN=$2$NAME
	awk -f $1 $FN | tail -n +2 > $DIR`echo $NAME |sed 's/\./Ave\./'`
done

for CTR in `seq 1 16`
do
	cat ${DIR}*Node${CTR}Ave.dat > ${DIR}merge${CTR}.dat
done


