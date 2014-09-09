#!/bin/bash

myPathName=$1/bootstrap/

fn=output/makeArbFigure.tex

prefix=output/bootstrapArbFit
suffix=Levenberg.dat.eps

echo ''> $fn

for names in $(ls $prefix*$suffix)
do
	echo '\begin{figure}'    >> $fn
	echo '\begin{centering}' >> $fn

	echo "\\includegraphics[height=0.4\\pageheight, angle=270]{$myPathName$names}" >> $fn

	#Cutting out individual variables from filename
	trimmed=`echo $names | sed "s:$prefix::" | sed "s:$suffix::" | sed 's/\.//'`
	#see http://cboard.cprogramming.com/linux-programming/148874-sed-get-everything-between-two-charcters.html
	alpha=`echo  $trimmed | sed "s/.*a\([0-9e\.-]*\)l.*/\1/"`

	#get and process lambda
	lambda=`echo $trimmed | sed "s/.*l\([0-9e\.-]*\)slop.*/\1/"`
	lambda=`awk "BEGIN {print $lambda*1e6}"`

	#get and process slope
	slope=`echo  $trimmed | sed "s/.*slop\([0-9e\.-]*\).*/\1/"`
	slopeTeX=`echo $slope | sed 's/e/ \\\times 10^\{/'`

	echo '\par\end{centering}' >> $fn
	echo "\caption{Bootstrapped arbitrary fit with injected linear slope \$ $slopeTeX}\$ N-m/m,  Yukawa interaction with \$\\alpha=$alpha\$, \$\\lambda=$lambda\$ \$\\mu\$m }"  >> $fn
	echo  '\end{figure}' >> $fn
	echo '' >> $fn
done

