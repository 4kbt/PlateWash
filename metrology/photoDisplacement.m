function [m e ang angErr] = photoDisplacement( P , plateThickness);

	RealImageWidth   = uncertaintyOverTime( P(:,3), P(:,4) )(end,:);
	MirrorImageWidth = uncertaintyOverTime( P(:,5), P(:,6) )(end,:);
	GapDistance 	 = uncertaintyOverTime( P(:,7), P(:,8) )(end,:);

	%This is important. The gap is physically half of its apparent size.
	GapDistance      = GapDistance / 2.0; 
		
	ImageWidth       = [ RealImageWidth; MirrorImageWidth]; 

	Width = uncertaintyOverTime( ImageWidth(:,1), ImageWidth(:,2))(end,:);

	m = GapDistance (1) * plateThickness / Width(1);
	
	e = GapDistance (2) * plateThickness / Width(1); 

	%AngleComputation
	X = P(:,1);
	%Factors of two for reflection
	Y =  P(:,7) / 2.0;
	DY = P(:,8) / 2.0;

	[fit fitErr] = wpolyfit( X, Y, DY, 1);

	dfit = sqrt(sumsq(inv(fitErr.R'))'/fitErr.df)*fitErr.normr;

	ang = fit(1);
	angErr = dfit(1);

endfunction
