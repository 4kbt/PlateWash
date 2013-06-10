function out = OneTwoOmegaChunkCalibFit(data, timeCol, fitCol,  fLow, fHigh, cutLength)
fLow
fHigh
cutLength
	'fitting one omega'
	[b1 s1 f1 time1] = peakFitter3Chunk2(data(:,timeCol), data(:,fitCol), 1.0*fLow, 1.0*fHigh, cutLength);
	'fitting two omega'
	[b2 s2 f2 time2] = peakFitter3Chunk2(data(:,timeCol), data(:,fitCol), 2.0*fLow, 2.0*fHigh, cutLength);

	out = [time1' time2' b1 b2 s1' s2' f1' f2'];

end
