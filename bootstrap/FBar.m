function fbar = FBar(x,sx,B,A,L,C)
%	sx = sx*0;

	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;

%	IL = 1./L.';
%       IL2= 1./transpose ( L.^2 );


%	fbar1 =  Q*exp( (sx.^2 / 2.0 * IL2 - x * IL ) ).* B * (A.*L.^2.*T) + C*x; 
	%alternative, also functional
	fbar = C*x;
	for ctr = 1:rows(L)
		fbar = fbar + Q*exp( sx.^2 / 2.0 /L(ctr)^2- x/L(ctr ) ).* B(:,ctr) * (A(ctr).*L(ctr).^2.*T(ctr));
%		fbar = fbar + Q*exp( -x./L(ctr ) ).* B(:,ctr) * (A(ctr).*L(ctr).^2.*T(ctr));
	end
%	sum(fbar1./fbar)
%	sum(fbar1./fbar1)
end
