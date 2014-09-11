run3147sync3
run3147FixedParameters
%run3147preSM3A

%Blind that puppy.
pwData(:,torqueCol) = 0;

'calibrating attractor'
pressEncP = getPressEncP(HOMEDIR);
psData(:,psSquareCol) = (touch2937 - polyval(pressEncP, psData(:,psSquareCol)) )*1e-6;

tp = [psData(:,psTimeCol), psData(:, psSquareCol)];

save 'run3147randomAttractorExample.dat' tp
