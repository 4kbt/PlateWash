run3147sync3
run3147FixedParameters
%run3147preSM3A

torqueCal = genTorqueCal;
pwData(:,torqueCol) = torqueCal * pwData(:,torqueCol);

'calibrating attractor'
pressEncP = getPressEncP(HOMEDIR);
psData(:,psSquareCol) = (touch2937 - polyval(pressEncP, psData(:,psSquareCol)) )*1e-6;

runLength = 10000;
pwData = pwData(1:runLength,:); 
psData = psData(1:runLength,:);

tt = [pwData(:,pwTimeCol), pwData(:,torqueCol) - mean(pwData(:,torqueCol))];
tp = [psData(:,psTimeCol), psData(:, psSquareCol)];

P  = psd(tt(:,1), tt(:,2) - mean(tt(:,2)));
PA = psd(tp(:,1), tp(:,2) - mean(tp(:,2)));

save 'run3147typicalTorque.dat' tt
save 'run3147typicalAttractor.dat' tp
save 'run3147typicalNoise.dat' P
save 'run3147typicalNoiseAttractor.dat' PA
