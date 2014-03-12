function vF = varF(x,sx,B,sB,A,L,C)

%	sx = 0 * sx;
%	sB = 0 * sB; 

	T = YukFiniteSizeCorrections(L);
	if(T<0) error('T is broken. fix.'); end
	Q = YukPreFactor;

	ALT = (A.*L.^2.*T);

	%Begin computing the cross-term
	LM = repmat(L,1,rows(L));
	Lij = 1./LM + 1./LM.';

	exparg = zeros(rows(L), rows(L), rows(x));
	preFactor = exparg;

	sx2 = sx.^2;
	ALT2m = ALT * ALT.';

	for ctr = 1:rows(x)
		exparg(:,:,ctr) = sx2(ctr) * (Lij.^2) / 2.0 - x(ctr) * Lij;
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

	warning ("off", "Octave:broadcast"); %for x-sx2/L term

	IL = 1./L.';
	IL2= 1./transpose ( L.^2 );

%	 [sx2 * IL2 - 2 * x * IL x sx sx2]



	%compute vF
	vF =   (
		Q^2 * crossTerm	
		+ Q^2 * exp( sx2 * IL2 - 2 * x * IL ) .* ( B.^2 + sB.^2 ) * ALT.^2
		+ 2*C*Q*exp( sx2/2.0 * IL2 - x * IL ) .* ( x - sx2 * IL ) .* B * ALT  ...
		+ C^2*(x.^2 + sx2)
		- FBar(x,sx,B,A,L,C).^2 
		);
%}
%	vF = 0;

%	save 'plotme2.dat' vF
%	vF = 0*vF;

	svF = std(vF);

	if( vF < -2*svF)
		min(vF)
		svF 
		error('variance of F is less than zero. Furthermore, it is too negative. Fix.');
	end

end

%Tests - must be positive, if sx and sb are zero, then vF should be zero.
