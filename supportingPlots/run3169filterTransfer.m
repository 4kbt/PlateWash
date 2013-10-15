more off;

try
run3147preSM3A
catch
end


run2937pressEnc
run3169sync3

driftFit = polyfit(pwData(:,pwTimeCol) - pwData(1,pwTimeCol), pwData(:,torqueCol),1);

P = psd(pwData(:,pwTimeCol), pwData(:,torqueCol) - polyval(driftFit, pwData(:,pwTimeCol) - pwData(1,pwTimeCol) ) );

run3147preSM3A

PF = psd(pwData(:,pwTimeCol), pwData(:,torqueCol)); 


pos = polyval(pressEncP, psData(:,psSquareCol) ); 

A = psd( psData(:,psTimeCol) , pos - mean( pos ));

loglog(P(:,1), sqrt(P(:,2)),'1', PF(:,1), sqrt(PF(:,2)))

save 'run3169filterTransferNF.dat' P 
save 'run3169filterTransferF.dat' PF
save 'run3169filterTransferA.dat' A

