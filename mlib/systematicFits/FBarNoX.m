function fbar = FBarNoX(x,sx,B,A,L,C,Pstruct, Astruct)
%	sx = sx*0;

	T = YukFiniteSizeCorrections(L,Pstruct,Astruct);
	Q = YukPreFactor(Pstruct);

	fbar = C*x;
	for ctr = 1:rows(L)
		fbar = fbar + Q*exp(                        -x./L(ctr ) ).* B(:,ctr) * (A(ctr).*L(ctr).^2.*T(ctr));
	end

%	fbar
%	sum(fbar1./fbar)
%	sum(fbar1./fbar1)
end
