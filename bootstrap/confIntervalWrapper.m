args = argv();

fn = args{1,1}

load(fn)

%"om" is the data field output from the bootstrapped fitter.
data = [om(:,2) om(:,3)]; 

minBinNum = 14; %Not sure how to pass configuration argument here.

cI = confidenceIntervals( data, minBinNum, "TurnerSmoothing", 0);

save [fn '.ci.dat'] cI
