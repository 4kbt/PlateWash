preFitIFO
%if( 1 == testInjection)
%	postLockinSignalInjection
%end
testInjection = 0;
preFitPlot

outfilename = ['output/bootstrapArbFit.bootstrappedFits.dat'];
bootstrapArbIFO
