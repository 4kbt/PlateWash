try
run3147preSM3A
catch
end

%large number yields prettier FFT.
[rTorque  wTorque ]  = freqz(fTorque , 1, Nfilt);
[rSensors wSensors]  = freqz(fSensors, 1, Nfilt);

oTor =  [wTorque /pi*NyquistFrequency, abs(rTorque )];
oSens = [wSensors/pi*NyquistFrequency, abs(rSensors)];

save 'run3147filterResponseTorque.dat'  oTor
save 'run3147filterResponseSensors.dat' oSens
save 'run3147filterTimeDomain.dat' fTorque
