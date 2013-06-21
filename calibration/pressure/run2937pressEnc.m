run2937syncPS


o = trimSpikes(psData,15,0.005,10);


pressEncP = polyfit(o(:,15), o(:,13),1);


plot(o(:,15), o(:,13),'.', o(:,15), polyval(pressEncP,o(:,15)),'.');

save 'run2937pressEncOutput.dat' pressEncP
