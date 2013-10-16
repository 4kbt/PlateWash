#!/bin/bash

myPathName=$1/bootstrap/

fn=output/makeSymFigure.tex

echo '\begin{figure}' > $fn
echo '\begin{centering}' >> $fn
for names in $(ls output/bootstrapYukawa*.SimulFloata*.eps)
do
	echo "\\includegraphics[height=0.4\\columnwidth, angle=270]{$myPathName$names}" >> $fn
done
echo '\par\end{centering}' >> $fn
echo '\label{BootstrappedSignalInjection}' >> $fn
echo '\caption{Bootstrapped fitting with signal injections}' >> $fn

echo  '\end{figure}' >> $fn
