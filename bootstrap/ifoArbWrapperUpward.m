preFitIFO

%Upward-going data; the magic number is Jan 1 2012. See ifoAR.eps
pM = pM( ( ( pM(:, ifopMTimeCol ) - 94694400 ) / 86400.0 < 77 ), : );

%These are the data which will be fit.
dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,ifopMCol) pM(:,ifoErrCol)];


%if( 1 == testInjection)
%	postLockinSignalInjection
%end
testInjection = 0;
preFitPlot

outfilename = ['output/bootstrapArbFitUpward.bootstrappedFits.dat'];
bootstrapArbIFO
