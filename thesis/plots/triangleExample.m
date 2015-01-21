%configuration
Npts   = 1500 
lambda = 100e-6;
alpha  = 1;
lin    = -2e-12;

%need these for parallel torque computation
lams   = ones(Npts , 1) * lambda;
alphas = ones(Npts , 1) * alpha ;

%bounds
xmin = 100e-6;
xmax = 800e-6;

%make torques
startPositions = (xmax-xmin)*rand( Npts , 1) + xmin;
stopPositions  = (xmax-xmin)*rand( Npts , 1) + xmin;

%torques
startYuks = yukawaVectorizedTorque( transpose(startPositions) , lambda , alpha );
stopYuks  = yukawaVectorizedTorque( transpose(stopPositions)  , lambda , alpha );

startLin = lin * startPositions ;
stopLin  = lin * stopPositions  ;

output = [startPositions stopPositions startYuks stopYuks startLin stopLin];

save("-ascii" , "triangleExample.dat", "output");
