%Multiple independent variables with leasqr. 

nObs = 100;
noiseLevel = 0.1;

realParams = [1 2 3 4]' ;

%Generate some independent variables
xvals = rand( nObs, columns(realParams));

%Generate some dependent observations
yvals = daFunc(xvals, realParams);

%Noise
yvals = yvals + noiseLevel * randn(nObs, columns(yvals));

ranSeed = randn(size(realParams));

[f x cvg iter corp covp covr stdresid Z r2] = leasqr( xvals, yvals, ranSeed, "daFunc", 1e-10, 200, ones(size(yvals)),'dfdp');

x

