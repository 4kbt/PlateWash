run3167sync3
run3147preSM3A

lnStart = floor(1.25*86400/TheoSampleTime);
lnEnd   = floor(1.4*86400/TheoSampleTime);

PF = psd(pwData(:,pwTimeCol), pwData(:,torqueCol));
LN = psd(pwData(lnStart:lnEnd, pwTimeCol), pwData(lnStart:lnEnd,torqueCol));

RS = [pwData(:,pwTimeCol), pwData(:,torqueCol)];
RSLN = [pwData(lnStart:lnEnd, pwTimeCol), pwData(lnStart:lnEnd, torqueCol)];

save 'run3167timeData.dat' RS;
save 'run3167timeDataLN.dat' RSLN
save 'run3167fft.dat' PF;
save 'run3167fftLN.dat' LN 
