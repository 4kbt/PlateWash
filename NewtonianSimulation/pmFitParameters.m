eMerge = [];

for ctr = 1:9
	try
		load (['SimulationOutput/scans/attractorPMScan' num2str(ctr) '.dat']);
		eMerge = [eMerge; outMatrix];	
	catch
	end
end

fitScaleFactor = 1e15;
stol = 1e-7

pin = [1 1]*1e-3;
        %Fit it
[f,p,cvg,iter,corp,covp,covr,stdresid,Z,r2] = leasqr(eMerge(:,5),eMerge(:,13)*fitScaleFactor,pin,"pwPoly", stol, 300);

linResiduals = eMerge(:,13) - f/fitScaleFactor;
linFitOut = [p sqrt(diag(covp))]/ fitScaleFactor;



pin = [1 1 1]*1e-3;
        %Fit it
[f,p,cvg,iter,corp,covp,covr,stdresid,Z,r2] = leasqr(eMerge(:,5),eMerge(:,13)*fitScaleFactor,pin,"pwPoly", stol, 300);

quadResiduals = eMerge(:,13) - f/fitScaleFactor;
quadFitOut = [p sqrt(diag(covp))]/ fitScaleFactor;

outMatrix = [eMerge linResiduals quadResiduals];

