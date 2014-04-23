run3147FixedParameters

pM = load('../runAnalysis/alwaysUnblindedResults/run3147pM3iFilterMerge.dat');

calibrateDistance

blurTorque

plot(pM(:,aCol), pM(:,torqueACol),'.', pM(:,bCol), pM(:,torqueBCol),'.')
semilogy(min(pM(:,aMaxCol), pM(:,bMaxCol)), abs(pM(:,ifopMCol)),'.')

o = [min(pM(:,aMaxCol), pM(:,bMaxCol)), pM(:,ifopMCol)];

aboveThreshold = o( o(:,2) > IFOTouchThreshold , : );
definitelyTouching = max(aboveThreshold(:,1)) 
%guaranteed range checking
assert( definitelyTouching < shortCut );

save 'ifoVsClosestApproach.dat' o

shortCutPlot = transpose([ 10.^(-13:-6)]);
shortCutPlot = [ones(size(shortCutPlot))*shortCut shortCutPlot];
save 'shortCutPlot.dat' shortCutPlot

abTorques = [pM(:,aCol), pM(:,torqueACol)];
abTorques = [abTorques ; [pM(:,bCol), pM(:,torqueBCol)]];
save 'positionVsTorque.dat' abTorques


touchPoints = abTorques(:,1) < definitelyTouching;
touchingTorques = [abTorques( touchPoints, 1 ), abTorques(touchPoints,2)];

save 'touchingTorques.dat' touchingTorques

bsO = [];
for ctr = 1:10000
	b = bootstrapData(touchingTorques);
	p = polyfit(b(:,1), b(:,2), 1);
	bsO = [bsO; p];
end

m = mean(bsO)
s = std(bsO)

bestTouchFit = [touchingTorques(:, 1 ), touchingTorques(:,1) * m(1) + m(2)];
save 'ifoTorqueBestFit.dat' bestTouchFit

printSigError( m(1), s(1), '../extracted/translationTorqueFit.tex');
