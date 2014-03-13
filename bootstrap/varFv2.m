function vF = varF(x,sx,B,sB,A,L,C)

%	sx = 0 * sx;
%	sB = 0 * sB; 

	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;

	ALT = (A.*L.^2.*T);

	%Begin computing the cross-term
	LM = repmat(L,1,rows(L));
	Lij = 1./LM + 1./LM.';

	%This is not Lij^2. It's different, see calculation.
	L2ij = 1./LM.^2 + 1./(LM.^2).';

	exparg = zeros(rows(L), rows(L), rows(x));
	preFactor = exparg;

	sx2 = sx.^2;
	ALT2m = ALT * ALT.';

	for ctr = 1:rows(x)
		 exparg(:,:,ctr) = sx2(ctr) * (L2ij) / 2.0 - x(ctr) * Lij;
		exparg2(:,:,ctr) = -2*sx2(ctr) * (L2ij.*(Lij).^2) * ( L * L.');  %yes, I do mean L * L')
		preFactor(:,:,ctr) = ALT2m.* (B(ctr,:) * B(ctr,:).');
	end

	 expval = exp(exparg);
	expval2 = exp(exparg2);
	crossTerms = expval.*(expval2 - 1) .* preFactor;

	%Strip the diagonal
	for ctr = 1:rows(L)
		crossTerms(ctr,ctr,:) = 0;
	end

	%Sum it all up
	crossTerm = squeeze(sum(sum(crossTerms,1),2));

	warning ("off", "Octave:broadcast"); %for x-sx2/L term

	IL = 1./L.';
	IL2= 1./transpose ( L.^2 );

%	 [sx2 * IL2 - 2 * x * IL x sx sx2]



	%compute vF
	vF =   (
		Q^2 * crossTerm	
		+ Q^2 * exp( sx2 * IL2 - 2 * x * IL ) .* sB.^2 * ALT.^2
		- 2*C*Q*exp( sx2/2.0 * IL2 - x * IL ) .* (sx2 * IL ) .* B * ALT  ...
		+ C^2 * sx2
		);
%}
%	vF = 0;

%	save 'plotme2.dat' vF
%	vF = 0*vF;

	if(isnan(vF))
		error('varF2 threw a NaN');
	end

	svF = std(vF);

	if( vF < -2*svF)
		min(vF)
		svF 
		error('variance of F is less than zero. Furthermore, it is too negative. Fix.');
	end

end

%Tests - must be positive, if sx and sb are zero, then vF should be zero.
