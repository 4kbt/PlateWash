more off
pause = 0
%Import parameters
run3147FixedParameters

warning off Octave:divide-by-zero

%Calibrate duty/microe.
if( ~exist('pressEncP'))
	pressEncP = getPressEncP(HOMEDIR); 
end

%Need to put these somewhere.
bootstrapOut = [];
slopeOut = [];

%Load analyzed torque data
pM = load([HOMEDIR 'runAnalysis/results/run3147pM3iFilterMerge.dat']);

ifoYukawaFitFlag = 1;
signalColumns = [0]; 

%Script to verify proper blinding.
CheckImposeBlind

%Calibrate distance
pM(:,aCol) = (touch2937 - polyval(pressEncP, pM(:,aCol)) ) * 1e-6;
pM(:,bCol) = (touch2937 - polyval(pressEncP, pM(:,bCol)) ) * 1e-6;
pM(:,aErrCol) = pM(:,aErrCol) * pressEncP(1)*-1*1e-6;
pM(:,bErrCol) = pM(:,bErrCol) * pressEncP(1)*-1*1e-6;

%IFO threshold cut
minFringe = (0.5-sqrt(2)/4 ) * IFODistPerFringe;
maxFringe = (0.5+sqrt(2)/4 ) * IFODistPerFringe;
pM = pM( (pM(:,ifoACol) < maxFringe), : );
pM = pM( (pM(:,ifoBCol) < maxFringe), : );
pM = pM( (pM(:,ifoACol) > minFringe), : );
pM = pM( (pM(:,ifoBCol) > minFringe), : );


%shortCut = shortCut- 5e-6;
%Execute distance cuts
pM = pM( pM(:,aCol) >= shortCut , :);
pM = pM( pM(:,bCol) >= shortCut , :);

%Sanity check
if rows(pM) < 2
	pM
	error('Insufficient data in pM. Wrong channel? Cut too hard?');
end

%These are the data which will be fit.
dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,torCol) pM(:,torerrCol)];
