#!/bin/awk -f
BEGIN {
	# How many lines
	lines=0;
	total1=0;
	total2=0;
	total3=0;
	total4=0;
	total5=0;
	total6=0;
}
{
	# this code is executed once for each line
	# increase the number of files
	lines++;
	# increase the total size, which is field #1
	total1+=$1;
	total3+=$3;
	total4+=$4;
	total5+=$5;
	total6+=$6;

	if(lines == 200){
		total1ave=total1/lines;
		total3ave=total3/lines;
		total4ave=total4/lines;
		total5ave=total5/lines;
		total6ave=total6/lines;
		printf("%e\t%e\t%e\t%e\t%e\n",total1ave, total3ave, total4ave, total5ave, total6ave);
		lines=0;
		total1=0;
		total2=0;
		total3=0;
		total4=0;
		total5=0;
		total6=0;
	}
}
