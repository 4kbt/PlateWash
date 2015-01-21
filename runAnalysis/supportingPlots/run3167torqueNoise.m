run3167sync3
run3147preSM3A

pwData(:,torqueCol) = pwData(:,torqueCol)*torqueCal;

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

freqs = 10.^( (-3.1:.01:0) ) ;
freqs = freqs';

ResponseFunction = 1/kappa ./ ...
	sqrt( ( 1 - freqs.^2 / pendulumF0^2 ).^2 + 1/pendulumQ^2 );

AutocollimatorLimit = ...
	autocolNoise ./ ResponseFunction; 

ThermalLimit =  sqrt( 4 * k_B * 293 * kappa / pendulumQ ./ ( 2 * pi * freqs ) );

AL = [ freqs AutocollimatorLimit ]; 
TL = [ freqs ThermalLimit ];

save 'run3167ThermalLimit.dat' TL;
save 'run3167AutocollimatorLimit.dat' AL;

