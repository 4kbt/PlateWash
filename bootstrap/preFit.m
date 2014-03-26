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
pM = load([HOMEDIR 'runAnalysis/results/run3147pM3FilterMerge.dat']);

%Inject random data to preserve the blind. 
if( max(abs(pM(:,torqueCol)) == 0) )
	if( exist('unBlind') & unBlind == 0)
		pM(:,torqueCol) = randn(rows(pM),1).*pM(:,torerrCol);
	else
		error('blind persists, but blind should not persist');
	end
else
%Interlock to prevent unblinding
	if( exist('unBlind') & unBlind == 0)
		if(fakeTheData == 0)
			error('Blind VIOLATED! WTF, MATE? This error should never happen');
		end
	else
		'Torque column is unblinded. Are you ready for this?'
			pause 
	end
end



%These are the data which will be fit.
dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,torCol) pM(:,torerrCol)];

%Calibrate distance
dBSArchive(:,1) = (touch2937 - polyval(pressEncP, dBSArchive(:,1)) ) * 1e-6;
dBSArchive(:,2) = (touch2937 - polyval(pressEncP, dBSArchive(:,2)) ) * 1e-6;


postLockinSignalInjection;
pM(:,aCol) = (touch2937 - polyval(pressEncP, pM(:,aCol)) ) * 1e-6;
pM(:,bCol) = (touch2937 - polyval(pressEncP, pM(:,bCol)) ) * 1e-6;

pM(:,aErrCol) = pM(:,aErrCol) * pressEncP(1)*-1*1e-6;
pM(:,bErrCol) = pM(:,bErrCol) * pressEncP(1)*-1*1e-6;

pM(:,torqueCol) = dBSArchive(:,3);

torErrThresh = 10*std(pM(:,torqueCol))

%Torque threshold cut
dBSArchive = dBSArchive(dBSArchive(:,4)      < torErrThresh,:);
dBSArchive = dBSArchive(abs(dBSArchive(:,3)) < torErrThresh,:);

pM = pM( (abs(pM(:,torCol)) < torErrThresh),:);
pM = pM( (pM(:,torerrCol)   < torErrThresh),:);

%Minimum noise threshold
dBSArchive = dBSArchive(dBSArchive(:,4)      > torErrMin,:);
pM = pM( (pM(:,torerrCol)   > torErrMin),:);

%Execute distance cuts
dBSArchive = dBSArchive(dBSArchive(:,1) >= shortCut,:);
dBSArchive = dBSArchive(dBSArchive(:,2) >= shortCut,:);
%dBSArchive = dBSArchive(dBSArchive(:,1) >= longCut,:);
%dBSArchive = dBSArchive(dBSArchive(:,2) >= longCut,:);

pM = pM( pM(:,aCol) >= shortCut , :);
pM = pM( pM(:,bCol) >= shortCut , :);

%Sanity check
if rows(dBSArchive) < 2
	error('Insufficient data. Wrong channel? Cut too hard?');
end

