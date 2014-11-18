#!/bin/bash

sed 's/\\times 10\^{/\t/g' $1 | \
sed 's/%//g'                  | \
sed 's/ //g'                  | \
sed 's/\\pm/\t/'              | \
sed 's/}//g'                  | \
sed 's/\$//g'
