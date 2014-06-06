run3147FixedParameters

run3077sync3

theta = [pwData(:,pwTimeCol), pwData(:,psdCol)*psdToRadians];

P = psd(theta(:,1) , theta(:,2) - mean(theta(:,2)));

loglog(P(:,1), sqrt(P(:,2)))

save 'run3077thetaPSD.dat' P
