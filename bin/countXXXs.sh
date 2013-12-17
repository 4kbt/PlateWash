#!/bin/bash
#Counts the number of XXXs (case insensitive) in the file given in the first argument. 
#Output is preceded by timing information in both seconds since 1970 and human-readable form.

echo  `date +"%s %Y %m %d %H %M %S"` `grep -io xxx $1 | wc -l` `wc $1` ` grep "begin_inset Graphics" $1 | wc -l`
