function o = pendulumPMScan()
run3147PendulumParameters;

%d  = load('charlieOldAttractorFine.dat');
d = load([HOMEDIR '/systematics/microscopeScans/June2011TaScanFiberUpXupperLeft.dat']);

d = scanCenterAndRemoveLinear(d);

%offset it
d(:,3) = d(:,3) + 15e-6;
%cut it
d = d( d(:,3) < 20e-6  ,:);

%convert it
o = scanToPMArray (d, 	pendulumPMScanGridSize,...
			pendulumPMScanGridSize,...
			pendulumPMScanVertStep,...
			pendulumPMBodyDensity);

%Define inlay
o( o(:,2) > pendCenterToStep ,1) = ...
			pendulumPMScanGridSize.^2 *...
			pendulumPMScanVertStep    *...
			pendulumPMInlayDensity; 
maxHeight = max(o(:,4));

o = rotatePMArray( o, -pi/2, [1 0 0]);
o = rotatePMArray( o, -pi/2, [0 0 1]);

'TRANSLATING PENDULUM SCAN FACE TO MATCH TRADITIONAL PENDULUM BODY FACE'
o = translatePMArray(o, [(-maxHeight+pendulumBodyThickness/2.0) 0 0]);


end
