run2937pressEnc

try
run3147preSM3A
catch
end

run3169sync3

pos = polyval(pressEncP, psData(:,psSquareCol));

c = coherentAverage( [psData(:,psTimeCol) pos], 2*stepPeriod/TheoSampleTime);

d = [diff(c(:,1)) c(2:end,2)]; 

s = [psData(1:1000,psTimeCol) pos(1:1000)];

m = [ mod(psData(:,psTimeCol), 2.0*stepPeriod) pos]; 

save 'run3169lagsCoh.dat'    c
save 'run3169lagsDiff.dat'   d
save 'run3169lagsSquare.dat' s
save 'run3169lagsMod.dat'    m
