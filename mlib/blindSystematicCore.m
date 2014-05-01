clear pM;

%All possible blind differences
if(exist('bR'))
	[lrDiff blBins blH brBins brH bLPositions bRPositions] = compareTwoSquareWavesBlind( bL,bR, torCol, torerrCol, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);
	[r0Diff brBins brH b0Bins b0H bRPositions b0Positions] = compareTwoSquareWavesBlind( bR,b0, torCol, torerrCol, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);
end %if
	[l0Diff blBins blH b0Bins b0H bLPositions b0Positions] = compareTwoSquareWavesBlind( bL,b0, torCol, torerrCol, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);


%Output...

filePath = ['extracted/' strokeType];
plotPath = ['plots/' strokeType];

if(exist('bR'))
	printSigError( lrDiff(1), lrDiff(2) , [filePath 'StrokeLRDiff.tex']);
	printSigError( r0Diff(1), r0Diff(2) , [filePath 'StrokeR0Diff.tex']);
end %if
	printSigError( l0Diff(1), l0Diff(2) , [filePath 'StrokeL0Diff.tex']);

	olHist = [blBins blH];
if(exist('bR'))
	orHist = [brBins brH];
end %if
	o0Hist = [b0Bins b0H];

	save( [plotPath 'StrokeolHist.dat'], "olHist");
if(exist('bR'))
	save( [plotPath 'StrokeorHist.dat'], "orHist");
end %if
	save( [plotPath 'Strokeo0Hist.dat'], "o0Hist");

	save( [plotPath 'Strokeo0Positions.dat'], "b0Positions");
	save( [plotPath 'StrokeoLPositions.dat'], "bLPositions");
if(exist('bR'))
	save( [plotPath 'StrokeoRPositions.dat'], "bRPositions");
end
