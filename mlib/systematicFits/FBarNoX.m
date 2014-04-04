function fbar = FBarNoX(x,sx,B,A,L,C)
%	sx = sx*0;

	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;

	fbar = C*x;
	for ctr = 1:rows(L)
		fbar = fbar + Q*exp(                        -x./L(ctr ) ).* B(:,ctr) * (A(ctr).*L(ctr).^2.*T(ctr));
	end

%	fbar
%	sum(fbar1./fbar)
%	sum(fbar1./fbar1)
end
