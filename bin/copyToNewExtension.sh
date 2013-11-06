#!/bin/bash

#copy all files from *.{first arg} to *.{second arg}
#If $3 exists, it defines a new root.

for f in $3*.$1 ; 
do
	cp "$f" $3"`basename $f .$1`.$2"
done
