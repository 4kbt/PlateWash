function vF = varF(x,sx,B,sB,A,L,C)

	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;
	T = L;

	ALT = (A.*L.^2.*T);

	%Begin computing the cross-term
	LM = repmat(L,1,rows(L));
	Lij = LM + LM.';

	sx2 = sx.^2;
	ALT2m = ALT * ALT.';

	for ctr = 1:rows(x)
		exparg(:,:,ctr) = (sx2(ctr)/2-x(ctr)) * Lij;
		preFactor(:,:,ctr) = ALT2m.* (B(ctr,:) * B(ctr,:).');
	end

	expval = exp(exparg);
	crossTerms = expval.*preFactor;

	%Strip the diagonal
	for ctr = 1:rows(L)
		crossTerms(ctr,ctr,:) = 0;
	end

	%Sum it all up
	crossTerm = squeeze(sum(sum(crossTerms,1),2));

	%compute vF
	vF = Q*(
		crossTerm	
		+ exp( (sx2-2*x) * (1./L.')).*(B.^2+sB.^2) * ALT.^2
		+ 2*C*exp( (sx2/2.0-x) * (1./L.')).*(x-sx2*(1./L.')) .*B * ALT  ...
		+ C^2*x.^2 
		- FBarVec(x,sx,B,A,L,C).^2 );

end
