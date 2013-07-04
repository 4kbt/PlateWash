more off

run3147FixedParameters
%Calibrate duty/microe.
if( ~exist('pressEncP'))
        %run2937pressEnc
	pressEncP = load([HOMEDIR 'calibration/pressure/run2937pressEncOutput.dat']);
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
dBSArchive = dBSArchive(dBSArchive(:,4) < torErrThresh,:);
dBSArchive = dBSArchive(abs(dBSArchive(:,3)) < torErrThresh,:);


%Post-analysis signal injection.
testInjection = 0 
if( testInjection == 1)
	alpha = 100
	lambda = 100e-6
	yo = yukawaForceLaw(alpha, lambda, 1e-6, 3e-3, 1e-6);

	interp1(yo(:,1), yo(:,2), (touch2937 - polyval(pressEncP, dBSArchive(:,1)))*1e-6)
	dBSArchive(:,3) = interp1(yo(:,1), yo(:,2), (touch2937 - polyval(pressEncP, dBSArchive(:,1)))*1e-6) - interp1(yo(:,1), yo(:,2), (touch2937 - polyval(pressEncP,dBSArchive(:,2)))*1e-6) + randn(rows(dBSArchive), 1).*dBSArchive(:,4);

end

%Sanity check
if rows(dBSArchive) < 2
	error('Insufficient data. Wrong channel? Cut too hard?');
end

pause = 0; 


%Bootstrap loop
for bootStrapCounter = 1:30000

	bootStrapCounter

	d = bootstrapData(dBSArchive);

	'bootstrapping complete'

	%d = d( abs(d(:,3))< 5e-14 ,:);

	d(:,1) = touch2937 - polyval(pressEncP, d(:,1));
	d(:,2) = touch2937 - polyval(pressEncP, d(:,2));

	%Save the real data
	dArchive = d; 


	%Crude linear fit
	x = d(:,1:2);					      %independent variables

	y = d(:,3);                                  %Dependent variable
	%
	%Nonlinear least squares regression
	pin=1e-15*ones(1,1);                                    %There are 7 parameters

	pMMeanTorque = mean(y);

	% Function to fit
	F = @(x,p) p(1)*(x(:,1)-x(:,2)) - pMMeanTorque;
	% This is the Octave fitting routine
	%[f,p,kvg,iter,corp,covp,covr,stdresid,Z,r2]=leasqr(x,y,pin,F,1e-6);
	% End of script



	z = [];
	q = [];

	%
	'beginning fit'
	for p = -2e-17:1e-20:2e-17
		z = [z sum( (F(x,p) - y).^2)];

		q = [q p];
	end

	[qmin qmindex] = min(z);

	p = q(qmindex) 
	slopeOut = [slopeOut; p];

	d(:,3) = d(:,3) - F( x, p) ; 

	errorEstimate = std(d(:,3));

	dSci = dArchive; 


	%pMSci = pMSci(1:1334,:);
	dSci = dSci(dSci(:,1) >= pfTouch+10,:);
	dSci = dSci(dSci(:,2) >= pfTouch+10,:);
	%dSci = dSci(dSci(:,1) < 500,:);
	%dSci = dSci(dSci(:,2) < 500,:);

	xSci = dSci(:,1:2);

	%% UNCOMMENT ME!!!
	%dSci(:,3) = dSci(:,3) - F( xSci, p) ; 


	preData = [xSci(:,2)*1e-6, xSci(:,1)*1e06 , dSci(:,3), dSci(:,4)];

	%lambdas, alphas
	%cSFunc = @(x) chiSquareVectorYukawa(preData, x(1), x(2));
	cSFunc = @(x) chiSquareVectorYukawaWSlope(preData, x(1), x(2), x(3));


	%Fit begins
	ranSeed = [ 10^( rand*3.0-6) , (-1).^(round(rand)+1)*10^(rand*11-5), (rand-0.5)*10^-15]
	%ranSeed = [ 10^( rand*3.0-6) , (-1).^(round(rand)+1)*10^(rand*11-5)]
	try
		%[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-10 inf inf 0 0 1]);
		%[x, csMin, info, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax], [1, realmax])
		%[x, csMin, info, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax], [1, realmax],2000,1e-20)

		[x, csMin, info, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax,-realmax], [.01, realmax, realmax],2000,1e-20)

		%When analyzing, make a cut on csMin
		%bsO = [ x(1) x(2) csMin nf iter info ranSeed];
		bsO = [ x(1) x(2) csMin nf iter info ranSeed x(3)];

		%if fit converged, save it.
		if(info == 101) 
			bootstrapOut(bootStrapCounter,:) = bsO; 
		end

		save 'run3147simplexBootstrapYukawa.floatLin10ChopLongSQPSlope.dat' slopeOut
		save 'run3147simplexBootstrapYukawa.SimulFloat10ChopLongSQP.dat' bootstrapOut
	catch
		'FIT ERROR! BED HAS BEEN POOPED!'
		errorMessage
	end

end %bsCnt
