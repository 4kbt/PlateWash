%This script parses the thesis to determine the physical location of each bug.

fn = '../thesis.lyx'
tString = fileread(fn);

XXX = [];
XXXRC = [];
XXXMA = [];
XXXMI = [];

for ctr = 1:( columns(tString) - 5 )

	if( tString(ctr : (ctr + 2) ) == 'XXX')
		XXX = [XXX; ctr];

		switch( tString( ctr : ( ctr + 4 ) ))
			case 'XXXRC'
				XXXRC = [XXXRC; ctr];
			case 'XXXMA'
				XXXMA = [XXXMA; ctr];
			case 'XXXMI'
				XXXMI = [XXXMI; ctr];
		endswitch
	end 
end

save 'locationXXX.dat' XXX
save 'locationXXXRC.dat' XXXRC
save 'locationXXXMA.dat' XXXMA
save 'locationXXXMI.dat' XXXMI

%Make an interpretable histogram
lThesis = columns( tString );

histBins = 0:1/20:1;

NXXX = histc(XXX/lThesis, histBins);
NXXXRC = histc(XXXRC/lThesis, histBins);
NXXXMA = histc(XXXMA/lThesis, histBins);
NXXXMI = histc(XXXMI/lThesis, histBins);

hXXX   = [histBins' NXXX];
hXXXRC = [histBins' NXXXRC];
hXXXMA = [histBins' NXXXMA];
hXXXMI = [histBins' NXXXMI];

save 'histXXX.dat'   hXXX
save 'histXXXRC.dat' hXXXRC
save 'histXXXMA.dat' hXXXMA
save 'histXXXMI.dat' hXXXMI
