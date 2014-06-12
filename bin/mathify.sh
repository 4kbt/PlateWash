#!/bin/bash

#Appends dollar signs to beginning and end of a document

for i in $@
do
	if [ "`head -c 1 $i`" != '$' ]
	then
		sed -i '1i \$' $i
		echo $ >> $i

	fi
done


