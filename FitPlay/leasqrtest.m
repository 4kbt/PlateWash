%Multiple independent variables with leasqr. 

nObs = 100;
noiseLevel = 1;

realParams = [1; 2; 3; 4] ;

%Generate some independent variables
xvals = rand( nObs, rows(realParams));

%Generate some dependent observations
yvals = daFunc(xvals, realParams);

%Noise
yvals = yvals + noiseLevel * randn(nObs, columns(yvals));

dArchive = [xvals yvals];
bsO = [];

for bsCounter = 1:1000

	d = bootstrapData(dArchive);


ranSeed = 10*randn(size(realParams));

[f x cvg iter corp covp covr stdresid Z r2] = leasqr( d(:,1:columns(xvals)), d(:,end), ranSeed, "daFunc", 1e-10, 200, ones(size(d(:,end))),'dfdp');

	bsO = [bsO; x' r2]; 

end

save 'test.dat' bsO
