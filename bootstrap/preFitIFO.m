prePreFit

%Load analyzed torque data
pM = load([HOMEDIR 'runAnalysis/results/run3147pM3iFilterMerge.dat']);

ifoYukawaFitFlag = 1;
signalColumns = [0]; 

%Script to verify proper blinding.
CheckImposeBlind

calibrateDistance

%IFO threshold cut
minFringe = (0.5-sqrt(2)/4 ) * IFODistPerFringe;
maxFringe = (0.5+sqrt(2)/4 ) * IFODistPerFringe;
pM = pM( (pM(:,ifoACol) < maxFringe), : );
pM = pM( (pM(:,ifoBCol) < maxFringe), : );
pM = pM( (pM(:,ifoACol) > minFringe), : );
pM = pM( (pM(:,ifoBCol) > minFringe), : );

distanceCuts

save 'dataToBeIFOFit.dat' pM

%Sanity check
if rows(pM) < 2
        pM
        error('Insufficient data in pM. Wrong channel? Cut too hard?');
end

%These are the data which will be fit.
dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,ifopMCol) pM(:,ifoErrCol)];
