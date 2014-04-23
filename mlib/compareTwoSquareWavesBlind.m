%Evaluates the difference of a-b. Attempts to preserve the blind.
%*pMPosition denotes the location of the variable within the pM data structure. A should be 1, and B should be 2 in most reasonable calls.
function [abDiff aBins aH bBins bH aLockPos bLockPos]  = compareTwoSquareWavesBlind( a, b, sciCol, scierrCol, sciErrMin, lockCol, numSensors, ApMPosition, BpMPosition)

%Clean up signs (fixes any sign ambiguity)
a(:,sciCol) = a(:, sciCol) .* sign(a(:, lockCol));
b(:,sciCol) = b(:, sciCol) .* sign(b(:, lockCol));

%Torque cut:
sciErrThresh = torErrThresh([ a(:,sciCol); b(:,sciCol)]);
a = a( a(:,scierrCol) < sciErrThresh , :);
b = b( b(:,scierrCol) < sciErrThresh , :);

a = a( a(:,scierrCol) > sciErrMin , :);
b = b( b(:,scierrCol) > sciErrMin , :);

%Weighted mean (inefficiently)
aTor = uncertaintyOverTime(a(:,sciCol), a(:,scierrCol)) (end,:); 
bTor = uncertaintyOverTime(b(:,sciCol), b(:,scierrCol)) (end,:); 

%preserve the blind
a(:,sciCol) = a(:,sciCol) - aTor(1);
b(:,sciCol) = b(:,sciCol) - bTor(1);

%Nuke everything else sciCol-related.
for delCtr = 1:(columns(a) / numSensors)
	a(:, sciCol + delCtr * numSensors) = 0;
	b(:, sciCol + delCtr * numSensors) = 0;
end

%Take that difference!
abDiff = diffOfTwoMeasurements(aTor, bTor)

%Construct a pseudo stdDev from the aggregate
aDev = aTor(2) * sqrt(rows(a));
bDev = bTor(2) * sqrt(rows(b));

%This isn't the optimal bin spacing. It should scale somehow with rows(a)/rows(b)
aBins = (min(a(:,sciCol)):aDev:max(a(:,sciCol)));
bBins = (min(b(:,sciCol)):bDev:max(b(:,sciCol)));

%histograms
[aH aX] = hist(a(:,sciCol),aBins);
[bH bX] = hist(b(:,sciCol),bBins);

%rows to columns
aH = aH'; aBins = aBins';
bH = bH'; bBins = bBins';

%Return the positions of all the differences for future plotability.
aLockPos = [ a(:, lockCol + ApMPosition * numSensors)  ...
	     a(:, lockCol + BpMPosition * numSensors) ];
bLockPos = [ b(:, lockCol + ApMPosition * numSensors)  ...
	     b(:, lockCol + BpMPosition * numSensors) ];

end
