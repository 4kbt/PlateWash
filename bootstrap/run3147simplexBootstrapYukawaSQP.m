more off

run3147FixedParameters
%Calibrate duty/microe.
if( ~exist('pressEncP'))
        %run2937pressEnc
	pressEncP = load([HOMEDIR 'calibration/pressure/run2937pressEncOutput.dat']);
end


bootstrapOut = [];

slopeOut = [];

more off; 




%pM(:,torqueCol) = randn(rows(pM),1)*1e-15;

pM = load([HOMEDIR 'runAnalysis/results/run3147pM3FilterMerge.dat']);

if( max(abs(pM(:,torqueCol)) == 0) )
	if( exist('unBlind') & unBlind == 0)
		pM(:,torqueCol) = randn(rows(pM),1).*pM(:,torerrCol);
	else
		error('blind persists, but blind should not persist');
	end
else
	if( exist('unBlind') & unBlind == 0)
		if(fakeTheData == 0)
			error('Blind VIOLATED! WTF, MATE? This error should never happen');
		end
	else
		'Torque column is unblinded. Are you ready for this?'
			pause 
	end
end

dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,torCol) pM(:,torerrCol)];
dBSArchive = dBSArchive(dBSArchive(:,4) < torErrThresh,:);
dBSArchive = dBSArchive(abs(dBSArchive(:,3)) < torErrThresh,:);

if rows(dBSArchive) < 2
	error('Insufficient data. Wrong channel? Cut too hard?');
end

pause = 0 ; 

for bootStrapCounter = 1:30000

bootStrapCounter

d = bootstrapData(dBSArchive);

'bootstrapping complete'

%d = d( abs(d(:,3))< 5e-14 ,:);

d(:,1) = touch2937 - polyval(pressEncP, d(:,1));
d(:,2) = touch2937 - polyval(pressEncP, d(:,2));

%Save the real data
dArchive = d; 
%plot3(dArchive(:,1), dArchive(:,2), dArchive(:,3),'+')



pause


x = d(:,1:2);					      %independent variables

y = d(:,3);                                  %Dependent variable
%
%Nonlinear least squares regression
pin=1e-15*ones(1,1);                                    %There are 7 parameters

pMMeanTorque = mean(y);

% Function to fit
%F = inline("p(1)*(x(:,1)-x(:,2)) - pMMeanTorque", "x", "p");
%F = inline("p(1)*(x(:,1)-x(:,2)) - 3", "x", "p");
F = @(x,p) p(1)*(x(:,1)-x(:,2)) - pMMeanTorque;
%F = @(x,p,m) p(1)*(x(:,1)-x(:,2)) - m;
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

%plot(q,z)

%pause

[qmin qmindex] = min(z);

p = q(qmindex) 
slopeOut = [slopeOut; p];

%From square wave
%p = -4.23e-15/545.58

%from floating bootstrap
%p = -6.9032e-18

%%plot3(x(:,1), x(:,2), y,'+1')
%hold on
%plot3(x(:,1), x(:,2), F(x,p),'+3');
%hold off

%pause

d(:,3) = d(:,3) - F( x, p) ; 

errorEstimate = std(d(:,3));

dSci = dArchive; 


%pMSci = pMSci(1:1334,:);
dSci = dSci(dSci(:,1) >= pfTouch+10,:);
dSci = dSci(dSci(:,2) >= pfTouch+10,:);
%dSci = dSci(dSci(:,1) < 500,:);
%dSci = dSci(dSci(:,2) < 500,:);
%pMSci = pMSci(pMSci(:,psB+9) > 30,:);
%dSci = chuckDataLine (dSci, 3);  %%%%% IS THIS LEGAL?! <-- probably, especially if only applied once. 

%xSci = [polyval(dutyencp, pMSci(:,psA+9)) polyval(dutyencp, pMSci(:,psB+9)) ]; 
xSci = dSci(:,1:2);

%% UNCOMMENT ME!!!
dSci(:,3) = dSci(:,3) - F( xSci, p) ; 


%plot3(xSci(:,1), xSci(:,2), dSci(:,3),'+1')
%hold on
%plot3(xSci(:,1), xSci(:,2), 0.*xSci(:,1),'+3');
%hold off

data = [xSci(:,2), xSci(:,1) , dSci(:,3), 1.0*dSci(:,4)];


preData= [ data(:,1)*1e-6, data(:,2)*1e-6, data(:,3),data(:,4)];

%lambdas, alphas
cSFunc = @(x) chiSquareVectorYukawa(preData, x(1), x(2));


try
ranSeed = [ 10^( rand*3.0-6) , (-1).^(round(rand)+1)*10^(rand*11-5)]
%[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-10 inf inf 0 0 1]);
%[x, csMin, info, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax], [1, realmax])
[x, csMin, info, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax], [1, realmax],2000,1e-20)

%When analyzing, consider a cut on csMin
bsO = [ x(1) x(2) csMin nf iter info ranSeed];

%if fit converged, save it.
if(info == 101) 
	bootstrapOut(bootStrapCounter,:) = bsO; 
end

save 'run3147simplexBootstrapYukawa.floatLin10ChopLongSQPSlope.dat' slopeOut
save 'run3147simplexBootstrapYukawa.floatLin10ChopLongSQP.dat' bootstrapOut
catch
	'FIT ERROR! BED HAS BEEN POOPED!'
	errorMessage
end

end %bsCnt


