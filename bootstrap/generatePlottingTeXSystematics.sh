#!/bin/bash

myPathName=$1/bootstrap/

fn=output/makeSymFigureSystematics.tex

echo '' > $fn

for names in $(ls output/bootstrapYukawa.Sys*.eps)
do
echo '\begin{figure}' >> $fn
echo '\begin{centering}' >> $fn
	echo "\\includegraphics[height=0.5\\textheight, angle=270]{$myPathName$names}" >> $fn
echo '\par\end{centering}' >> $fn

captionVal=`echo $names | sed "s:$myPathName::" | sed "s:output/bootstrapYukawa\.Sys::" | sed 's/\.dat\.eps//'`

echo "\\caption{$captionVal}" >> $fn

echo  '\end{figure}' >> $fn
echo  '\clearpage' >> $fn
done
