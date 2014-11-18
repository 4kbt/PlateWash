#!/bin/bash

sed 's/\\times 10\^{/e/g' $1 | \
sed 's/%//g' 		     | \
sed 's/ //g' 		     | \
sed 's/}//g' 		     | \
sed 's/\$//g'
