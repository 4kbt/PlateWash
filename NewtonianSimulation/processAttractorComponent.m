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

	if( exist(scatterMasses) )
		attrString = attrWholeString;
		P = scatterPMMasses(P);
		A = scatterPMMasses(A);
	end

	for ctr = 1:rows(t)

		ctr

		At = rotatePMArray(A, t(ctr, 1), t(ctr, 2:4));

		At = translatePMArray(At, t(ctr, 5:7)); 

		[force(ctr, :) torque(ctr,:)] = pointMatrixGravity(P,At);

%		if (mod(ctr,10) == 1 )
%			displayPoints(P,At);
%			pause(0.1);
%		end

		save -text 'temp.dat' force torque;

	end

%specified in makefile.
%	outPath = 'SimulationOutput/'
	outPath = [outPath '/']; %gets reused below
	outString = [ outPath  attrString '.dat' ];

	outMatrix = [t force torque];
	save ("-text" , outString, "outMatrix")

	pin = [1 1 1] * 1e-15; 

	%Fit it
	%t(:,5)
	%torque(:,3)
	[f,p,cvg,iter,corp,covp,covr,stdresid,Z,r2] = leasqr(t(:,5),torque(:,3),pin,"pwPoly");
	%[f,p,cvg,iter,corp,covp,covr,stdresid,Z,r2] = leasqr([1; 2; 3; 4;5],[1;2;3;4;5],pin,"pwPoly")

	%Save fit info, with errors
	errs = sqrt(covr);

	printSigError(p(1) , errs(1), [ outPath attrString 'quad.tex']);
	printSigError(p(2) , errs(2), [ outPath attrString 'lin.tex']);
	printSigError(p(3) , errs(3), [ outPath attrString 'const.tex']);

end
