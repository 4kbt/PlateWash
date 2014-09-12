#!/bin/bash

myPathName=$1/bootstrap/

fn=output/makeSymFigureSystematics.tex

echo '' > $fn

prefix=output/bootstrapYukawa.Sys
suffix=.dat.eps

for names in $(ls $prefix*$suffix)
do
#Begin including triangle plot
#pname=`echo $names | sed 's/\.dat\.eps/\.dat.plt\.eps/'`
pname=`echo $names | sed 's/\.dat\.eps/\.dat.plt\.jpg/'`

# adapted from arbfit script
        #Cutting out individual variables from filename
        trimmed=`echo $names | sed "s:$prefix::" | sed "s:$suffix::"` 
        #see http://cboard.cprogramming.com/linux-programming/148874-sed-get-everything-between-two-charcters.html
        alpha=`echo  $trimmed | sed "s/.*a\([0-9e\.-]*\)l.*/\1/"`

        #get and process lambda
        lambda=`echo $trimmed | sed "s/.*l\([0-9e\.-]*\)slop.*/\1/"`
        lambda=`awk "BEGIN {print $lambda*1e6}"`

        #get and process slope
        slope=`echo  $trimmed | sed "s/.*slop\([0-9e\.-]*\)Sys.*/\1/"`
        if [ "$slope" = '0' ];  then
                slopeTeX=0
        else
                slopeTeX=`echo $slope | sed 's/e/ \\\times 10^\{/' | sed 's/$/}/'`
        fi

	systematic=`echo $trimmed | sed "s/.*[0-9]Sys\([MinusPlusNull]*\).*/\1/"`

	if   [ "$systematic" = "Null"  ]
	then
		sysText="The foil systematic was not corrected."
	elif [ "$systematic" = "Plus"  ]
	then
		sysText="The foil systematic was added to the original data."
	elif [ "$systematic" = "Minus" ]
	then
		sysText="The foil systematic was subtracted from the original data"
	fi


echo '\begin{figure}[p]' >> $fn
echo '\begin{leftfullpage}' >> $fn
echo '\begin{centering}' >> $fn
	echo "\\includegraphics[height=0.85\\textheight, angle=270,natwidth=3240,natheight=3240]{$myPathName$pname}" >> $fn
	#echo "\\includegraphics[height=0.5\\textheight, angle=270]{$myPathName$pname}" >> $fn
echo '\par\end{centering}' >> $fn

	captionString="A signal was injected with linear slope \$ $slopeTeX\$ N-m/m,  Yukawa interaction with \$\\alpha=$alpha\$, \$\\lambda=$lambda\$ \$\\mu\$m. $sysText"

        echo "\caption{Triangle plot. $captionString }"  >> $fn

#echo "\\caption{Triangle plot for $captionVal\. A signal was injected at \$\\alpha=a\$, \$\\lambda=l\$, and with a linear slope of {\\tt slop}. Plus, Null, and Minus are with the foil correction added, not-added, and subtracted. }" >> $fn
echo  '\end{leftfullpage}' >> $fn
echo  '\end{figure}' >> $fn
echo  '\clearpage' >> $fn

#Begin analysis plot
echo '\begin{figure}' >> $fn
echo '\begin{fullpage}' >> $fn
echo '\begin{centering}' >> $fn
	echo "\\includegraphics[height=0.5\\textheight, angle=270]{$myPathName$names}" >> $fn
echo '\par\end{centering}' >> $fn

echo "\\caption{Yukawa Plot, all systematics. $captionString}" >> $fn

echo  '\end{fullpage}' >> $fn
echo  '\end{figure}' >> $fn
echo  '\clearpage' >> $fn


#Begin gravity plot
gname=`echo $names | sed 's/.eps/.grav.eps/'`
echo '\begin{figure}' >> $fn
echo '\begin{centering}' >> $fn
	echo "\\includegraphics[height=0.5\\textheight, angle=270]{$myPathName$gname}" >> $fn
echo '\par\end{centering}' >> $fn

echo "\\caption{Yukawa Plot, gravity only. $captionString}" >> $fn

echo  '\end{figure}' >> $fn
echo  '\clearpage' >> $fn

done
