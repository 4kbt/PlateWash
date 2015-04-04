run2937syncPS


o = trimSpikes(psData,15,0.005,5,5);


pressEncP = polyfit(o(:,15), o(:,13),1);

press = [o(:,15) o(:,13) polyval(pressEncP,o(:,15))];

plot(o(:,15), o(:,13),'.', o(:,15), polyval(pressEncP,o(:,15)),'.');

save('-ascii', 'run2937pressEncOutput.dat', 'pressEncP');

save('-ascii', 'run2937pressEncData.dat'  , 'press'    );
