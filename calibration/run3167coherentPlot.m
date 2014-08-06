run3147FixedParameters
run3167sync3

load('run3147calFreq.dat');

f = freqOut(:,1); 

F = fir1(2*Nfilt, filterLow/2, 'high'); 

fil = filter(F, 1, pwData(:,16)-mean(pwData(:,16))); 

pwData(:,16) = fil;

pwData = pwData(3*Nfilt:end,:);

o = coherentTimeAverage(pwData , 8/f, TheoSampleTime, pwTimeCol);

coherentOut = [ (1:rows(o))'*TheoSampleTime*f/2, ... 
		 o(:,torCol)- mean(o(:,torCol)), ... 
		 o(:, columns(pwData) + torCol)/sqrt(rows(pwData)) ];

save 'run3167coherentPlot.dat' coherentOut
