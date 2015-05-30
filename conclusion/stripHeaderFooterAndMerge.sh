#!/bin/bash
# Strips the header and follower from bootstrapped fit files in directory
# denoted by the first argument and aggregates them into a file denoted
# by the second arguement.

#Nuke the destination
rm $2
rm $2\.labelled

#Strip and aggregate the target files
for NAME in `ls $1/*`
do
	 head -n -9 $NAME | tail -n +11 >> $2
done

head -n 9 $NAME > $2\.labelled
cat $2 >> $2\.labelled
