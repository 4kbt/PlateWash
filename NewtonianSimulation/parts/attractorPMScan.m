function o = attractorPMScan()
run3147PendulumParameters;

d = load([HOMEDIR '/systematics/microscopeScans/charlieOldAttractorFine.dat']);

d = scanCenterAndRemoveLinear(d);

%offset it
d(:,3) = d(:,3) + 15e-6;
%cut it
d = d( d(:,3) < 20e-6  ,:);

%convert it
o = scanToPMArray (d, 	attractorPMScanGridSize,...
			attractorPMScanGridSize,...
			attractorPMScanVertStep,...
			attractorPMDensity);

maxHeight = max(o(:,4));

o = rotatePMArray( o, -pi/2, [1 0 0]);
o = rotatePMArray( o,  pi/2, [0 0 1]);
o = translatePMArray(o, [maxHeight 0 0]);
end
