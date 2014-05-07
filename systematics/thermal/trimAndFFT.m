function trimAndFFT(startTime, endTime, fn , attr1, attr2, baseP, shorR, rotWa)

	startTime = startTime - 365*2*86400;
	endTime   = endTime   - 365*2*86400;

	a1 = attr1( (attr1(:,1) > startTime ) & (attr1(:,1) < endTime) , :);
	a2 = attr2( (attr2(:,1) > startTime ) & (attr2(:,1) < endTime) , :);
	bP = baseP( (baseP(:,1) > startTime ) & (baseP(:,1) < endTime) , :);
	sR = shorR( (shorR(:,1) > startTime ) & (shorR(:,1) < endTime) , :);
	rW = rotWa( (rotWa(:,1) > startTime ) & (rotWa(:,1) < endTime) , :);

	PA1 = psd(a1(:,1), a1(:,2) - mean(a1(:,2)));
	PA2 = psd(a2(:,1), a2(:,2) - mean(a2(:,2)));
	PBP = psd(bP(:,1), bP(:,2) - mean(bP(:,2)));
	PSR = psd(sR(:,1), sR(:,2) - mean(sR(:,2)));
	PRW = psd(rW(:,1), rW(:,2) - mean(rW(:,2)));

	tFFT = [PA1 PA2(:,2) PBP(:,2) PSR(:,2) PRW(:,2)];

	save(fn, 'tFFT');
end
