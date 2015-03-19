function [m e ang angErr] = photoDisplacement( P , plateThickness);

	RealImageWidth   = [ mean( P(:,3) ), mean( P(:,4)) / sqrt( rows(P) )];
	MirrorImageWidth = [ mean( P(:,5) ), mean( P(:,6)) / sqrt( rows(P) )];
	GapDistance      = [ mean( P(:,7) ), mean( P(:,8)) / sqrt( rows(P) )]; 
	
	ImageWidth       = [ RealImageWidth; MirrorImageWidth]; 

	Width = mean(ImageWidth(:,1));
	WidthErr = mean( ImageWidth(:,1) ) / sqrt( rows(ImageWidth) );

	m = GapDistance (1) * plateThickness / Width;
	
	e = GapDistance (2) * plateThickness / Width; 

	%AngleComputation
	X = P(:,1);
	Y = P(:,7);
	DY = P(:,8);

	[fit fitErr] = wpolyfit( X, Y, DY, 1);

	dfit = sqrt(sumsq(inv(fitErr.R'))'/fitErr.df)*fitErr.normr;

	ang = fit(1);
	angErr = dfit(1);

endfunction
