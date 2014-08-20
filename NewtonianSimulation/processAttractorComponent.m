more off;

%specified in makefile
%P = jan13Pendulum;

t = defineAttractorTranslation;

%Print for sanity
outPath

%specified in makefile
%attractors = { "jan13ScrewGaps" ; "jan13Spindles"; "jan13Attractor" }

for attrCtr = 1:rows(attractors); 

	attrString = char(attractors(attrCtr));

	if( exist("scatterMasses"))
		attrWholeString = attrString;
		attrString = attrString(1:end-1); 
	end

	A = eval(attrString);

	save([outPath '/' attrString 'Distribution.dat'], 'A');
	save([outPath '/' 'Pendulum' 'Distribution.dat'], 'P');

	if( exist("scatterMasses") )
		attrString = attrWholeString;
		P = scatterPMMassesYZGrid(P);
		A = scatterPMMassesYZGrid(A);
	end

	if( exist("randomAttractorRotate"))
		randomAngle = rand*2*pi;
		A = rotatePMArray(A, randomAngle, [1 0 0]);
	end

	for ctr = 1:rows(t)

		ctr

		At = rotatePMArray(A, t(ctr, 1), t(ctr, 2:4));

		At = translatePMArray(At, t(ctr, 5:7)); 

		[force(ctr, :) torque(ctr,:)] = pointMatrixGravity(P,At);

		save -text 'temp.dat' force torque;

	end

	pin = [1 1];
	stol = 1e-6; 
	fitScaleFactor = 1e15
	%Fit it linear
	[f,p,cvg,iter,corp,covp,covr,stdresid,Z,r2] = leasqr(t(:,5),torque(:,3)*fitScaleFactor,pin,"pwPoly",stol);
	linResiduals = torque(:,3) - f/fitScaleFactor;
	linOut = [p sqrt(diag(covp)) ] /fitScaleFactor;
	maxNonLin = max(abs(linResiduals));


	%Fit it quad
	pin = [1 1 1];
	[f,p,cvg,iter,corp,covp,covr,stdresid,Z,r2] = leasqr(t(:,5),torque(:,3)*fitScaleFactor,pin,"pwPoly",stol);
	quadResiduals = torque(:,3) - f/fitScaleFactor;


	%Save fit info, with errors
	errs = sqrt(diag(covp))/fitScaleFactor;
	p = p/fitScaleFactor;

	fitOut = [p errs];

%specified in makefile.
	outPath = [outPath '/']; %gets reused below
	outString = [ outPath  attrString '.dat' ];
	outMatrix = [t force torque linResiduals quadResiduals];
	save ("-text" , outString, "outMatrix")

	printSIErr(p(1) , errs(1), 1, -15, 'N-m/m$^2$', [ outPath attrString 'quad.tex']);
	printSIErr(p(2) , errs(2), 1, -15, 'N-m/m'    , [ outPath attrString 'lin.tex']);
	printSIErr(p(3) , errs(3), 1, -15, 'N-m', [ outPath attrString 'const.tex']);
	save([outPath attrString 'QuadFit.dat'], 'fitOut');
	save([outPath attrString 'LinFit.dat' ], 'linOut');
	printSI(maxNonLin, 2, -15, 'N-m', [outPath attrString 'maxnonlin.tex']);
end
