%x is a column vector, length N
%sx is a column vector, length N
%B is a matrix, size NxL
%sB is a matrix, size NxL
%A and L are size Lx1
% in general, N >> L. 

function vF = varF(x,sx,B,sB,A,L,C)

%	sx = 0 * sx;
%	sB = 0 * sB; 

	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;

	ALT = (A.*L.^2.*T);

	%Begin computing the cross-term
	LM = repmat(L,1,rows(L));
	Lij = 1./LM + 1./LM.';

	L2ij = Lij.^2;
	LiLj = 1 ./ ( L * L.' );

	%Preallocate for speed
	exparg = zeros(rows(L), rows(L), rows(x));
	exparg2 = exparg;
	preFactor = exparg;

	sx2 = sx.^2;
	ALT2m = ALT * ALT.';

	
%	InvL = 1./L;
%	TCross2 = -InvL*transpose(sx2);
%	for ctr = 1:rows(L)
%		test2(ctr,:,:) = InvL(ctr)*TCross2;
%	end

	for ctri = 1:rows(L)
	for ctrj = 1:rows(L)
                 exparg(ctri,ctrj,:) = sx2 * L2ij(ctri,ctrj) / 2.0 - x * Lij(ctri,ctrj);
                exparg2(ctri,ctrj,:) = -sx2 * LiLj(ctri,ctrj) ;
                preFactor(ctri,ctrj,:) = ALT2m(ctri,ctrj).* (B(:,ctri) .* B(:,ctrj));
        end
	end
%	ea = exparg;
%	ea2 = exparg2;
%	pf = preFactor;

%Reference
%	for ctr = 1:rows(x)
%		 exparg(:,:,ctr) = sx2(ctr) * (L2ij) / 2.0 - x(ctr) * Lij;
%		exparg2(:,:,ctr) = -sx2(ctr) * LiLj ; 
%		preFactor(:,:,ctr) = ALT2m.* (B(ctr,:) * B(ctr,:).');
%	end

%	1
%	sum(sum(sum(preFactor)))
%	2
%	sum(sum(sum(pf)))
%	3

%	if(test2 == exparg2)
%		error('woohoo')
%	end

	 expval = exp(exparg);
	expval2 = exp(exparg2);
	crossTerms = expval.*(1 - expval2 ) .* preFactor;

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
		+ Q^2 * exp( 2 * sx2 * IL2 - 2 * x * IL ) .* (sB.^2 + B.^2 .* ( 1 - exp( - sx2 * ( 1 ./ transpose(L.*L) ) ) ) ) * ALT.^2
		- 2*C*Q*exp( sx2/2.0 * IL2 - x * IL ) .* (sx2 * IL ) .* B * ALT  ...
		+ C^2 * sx2
		);
%}
%	vF = 0;

%	save 'plotme2.dat' vF
%	vF = 0*vF;

	if(isnan(vF))
		warning('varF2 threw a NaN');
	end

	svF = std(vF);

	if( vF < -2*svF)
		min(vF)
		svF 
		error('variance of F is less than zero. Furthermore, it is too negative. Fix.');
	end

end

%Tests - must be positive, if sx and sb are zero, then vF should be zero.
