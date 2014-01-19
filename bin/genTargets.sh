#!/bin/bash
#This script converts a human-readable runlist into a consecutive runlist for processing.


#human-readable runlist
RUNSPEC=$1
#machine-readable runlist to be built
RUNNUMS=$2

#strip comments, strip blank lines

sed '/^\#/d' ${RUNSPEC} | \
sed '/^$/d' > ${RUNNUMS}
