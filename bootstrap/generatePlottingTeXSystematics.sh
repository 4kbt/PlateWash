#!/bin/bash

myPathName=$1/bootstrap/

fn=output/makeSymFigureSystematics.tex

echo '' > $fn

for names in $(ls output/bootstrapYukawa.Sys*.dat.eps)
do
#Begin including triangle plot
#pname=`echo $names | sed 's/\.dat\.eps/\.dat.plt\.eps/'`
pname=`echo $names | sed 's/\.dat\.eps/\.dat.plt\.jpg/'`

echo '\begin{figure}' >> $fn
echo '\begin{centering}' >> $fn
	echo "\\includegraphics[height=0.5\\textheight, angle=270,natwidth=3240,natheight=3240]{$myPathName$pname}" >> $fn
	#echo "\\includegraphics[height=0.5\\textheight, angle=270]{$myPathName$pname}" >> $fn
echo '\par\end{centering}' >> $fn

captionVal=`echo $names | sed "s:$myPathName::" | sed "s:output/bootstrapYukawa\.Sys::" | sed 's/\.dat\.eps//'`

echo "\\caption{Triangle plot for $captionVal}" >> $fn

echo  '\end{figure}' >> $fn
echo  '\clearpage' >> $fn

#Begin analysis plot
echo '\begin{figure}' >> $fn
echo '\begin{centering}' >> $fn
	echo "\\includegraphics[height=0.5\\textheight, angle=270]{$myPathName$names}" >> $fn
echo '\par\end{centering}' >> $fn

captionVal=`echo $names | sed "s:$myPathName::" | sed "s:output/bootstrapYukawa\.Sys::" | sed 's/\.dat\.eps//'`

echo "\\caption{Analysis results for $captionVal}" >> $fn

echo  '\end{figure}' >> $fn
echo  '\clearpage' >> $fn

done
