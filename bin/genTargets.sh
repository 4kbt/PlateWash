#!/bin/bash

#human-readable runlist
RUNSPEC=$1
#machine-readable runlist to be built
RUNNUMS=$2

#strip comments, strip blank lines

sed '/^\#/d' ${RUNSPEC} | \
sed '/^$/d' > ${RUNNUMS}
