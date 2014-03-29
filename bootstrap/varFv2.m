%x is a column vector, length N
%sx is a column vector, length N
%B is a matrix, size NxL
%sB is a matrix, size NxL
%A and L are size Lx1
% in general, N >> L. 

function vF = varF(x,sx,B,sB,A,L,C, enableSystematics)

%	vF = 0;
%	return

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

	%Compute arguments to crossterm exponentials
	for ctri = 1:rows(L)
		for ctrj = 1:rows(L)
			 exparg(ctri,ctrj,:) = sx2 * L2ij(ctri,ctrj) / 2.0 - x * Lij(ctri,ctrj);
			exparg2(ctri,ctrj,:) = -sx2 * LiLj(ctri,ctrj) ;
			preFactor(ctri,ctrj,:) = ALT2m(ctri,ctrj).* (B(:,ctri) .* B(:,ctrj));
		end
	end

%Reference
%	for ctr = 1:rows(x)
%		 exparg(:,:,ctr) = sx2(ctr) * (L2ij) / 2.0 - x(ctr) * Lij;
%		exparg2(:,:,ctr) = -sx2(ctr) * LiLj ; 
%		preFactor(:,:,ctr) = ALT2m.* (B(ctr,:) * B(ctr,:).');
%	end

	%exponentiate
	 expval = exp(exparg);
	expval2 = exp(exparg2);
	
	%crossterms
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

	%compute vF
	vF =   (
		Q^2 *( crossTerm
		+ exp( 2 * (sx2 * IL2 -  x * IL) ) .* (sB.^2*enableSystematics + B.^2 .* ( 1 - exp( - sx2 * ( 1 ./ transpose(L.*L) ) ) ) ) * ALT.^2 )
		- 2*C*Q*exp( sx2/2.0 * IL2 - x * IL ) .* (sx2 * IL ) .* B * ALT  ...
		+ C^2 * sx2
		);

	if(isnan(vF))
		warning('varF2 threw a NaN');
	end

end

%Tests - must be positive, if sx and sb are zero, then vF should be zero.
%	svF = std(vF);
%
%	if( vF < -2*svF)
%		min(vF)
%		svF 
%		error('variance of F is less than zero. Furthermore, it is too negative. Fix.');
%	end

