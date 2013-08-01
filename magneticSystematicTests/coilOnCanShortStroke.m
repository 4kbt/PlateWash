run3147FixedParameters

%Red on Right
load('../runAnalysis/alwaysUnblindedResults/run3203pM3FilterOnly.dat');
bR = pM;

%Red on Left
load('../runAnalysis/alwaysUnblindedResults/run3204pM3FilterOnly.dat');
bL = pM;

load('../runAnalysis/alwaysUnblindedResults/run3205pM3FilterOnly.dat');
bL = [bL; pM];

%Zero applied field
b0 = [];
load('../runAnalysis/alwaysUnblindedResults/run3161pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/alwaysUnblindedResults/run3163pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/alwaysUnblindedResults/run3164pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/alwaysUnblindedResults/run3166pM3FilterOnly.dat');
b0 = [b0; pM];

clear pM;

%Clean up signs

bL(:,torCol) = bL(:,torCol) .* sign(bL(:,psSquareCol));
bR(:,torCol) = bR(:,torCol) .* sign(bR(:,psSquareCol));
b0(:,torCol) = b0(:,torCol) .* sign(b0(:,psSquareCol));

%Torque cut:
bL = bL( bL(:,torerrCol) < torErrThresh , :);
bR = bR( bR(:,torerrCol) < torErrThresh , :);
b0 = b0( b0(:,torerrCol) < torErrThresh , :);

bL = bL( bL(:,torerrCol) > torErrMin , :);
bR = bR( bR(:,torerrCol) > torErrMin , :);
b0 = b0( b0(:,torerrCol) > torErrMin , :);

bLTor = uncertaintyOverTime(bL(:,torCol), bL(:,torerrCol)) (end,:); 
bRTor = uncertaintyOverTime(bR(:,torCol), bR(:,torerrCol)) (end,:); 
b0Tor = uncertaintyOverTime(b0(:,torCol), b0(:,torerrCol)) (end,:); 

bL(:,torCol) = bL(:,torCol) - mean(bL(:,torCol));
bR(:,torCol) = bR(:,torCol) - mean(bR(:,torCol));
b0(:,torCol) = b0(:,torCol) - mean(b0(:,torCol));

%Nuke everything else torque-related.
for delCtr = 1:(columns(bL) / 65)
	bL(:, torCol+delCtr*65) = 0;
	bR(:, torCol+delCtr*65) = 0;
	b0(:, torCol+delCtr*65) = 0;
end


function o = diffOfTwoMeasurements(m1, m2)
	o = m1(1) - m2(1);
	o(2) = sqrt(m1(2)^2 +m2(2)^2);
end

LRDiff = diffOfTwoMeasurements(bLTor, bRTor)
L0Diff = diffOfTwoMeasurements(bLTor, b0Tor)
R0Diff = diffOfTwoMeasurements(bRTor, b0Tor)


[bLH bLX] = hist(bL(:,torCol));
hist(bL(:,torCol),300);
pause
hist(bR(:,torCol),300);
[bRH bRX] = hist(bR(:,torCol),100);
pause
[b0H b0X] = hist(b0(:,torCol), 100);
hist(b0(:,torCol),300);
pause


plot3(bR(:,105), bR(:,170), bR(:,16),'.', bL(:,170), bL(:,105), -bL(:,16),'.1')

pause
