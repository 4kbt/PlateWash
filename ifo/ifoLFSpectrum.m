run3147FixedParameters

ifoData = minimalIFOLoad(3147, HOMEDIR);

F = psd(ifoData(:,1), (ifoData(:,2) - mean(ifoData(:,2)) ) * IFODistCal);

fake = 1e-10 * sin(2*pi*ifoData(:,1) / (2 * stepPeriod));

Fake = psd(ifoData(:,1), fake);

FreqOut = [F Fake];

o = [ifoData(:,1), (ifoData(:,2) - mean([IFOFringeTop IFOFringeBot]))* IFODistCal];

save 'ifoLFTimeDomain.dat' o

save 'ifoLFSpectrum.dat' FreqOut
