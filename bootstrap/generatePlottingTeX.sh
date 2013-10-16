#!/bin/bash

myPathName=$1/bootstrap/

fn=output/makeSymFigure.tex

echo '\begin{figure}' > $fn
for names in $(ls output/bootstrapYukawa*.SimulFloata*.eps)
do
	echo "\\includegraphics[height=5.4cm,angle=270]{$myPathName$names}" >> $fn
done

echo  '\end{figure}' >> $fn
