function fbar = FBarNoX(x,sx,B,A,L,C,Pstruct, Astruct)

	T = YukFiniteSizeCorrections(L,Pstruct,Astruct);

	fbar = C*x;
	for ctr = 1:rows(L)
		fbar = fbar + Pstruct.YPF*exp(                        -x./L(ctr ) ).* B(:,ctr) * (A(ctr).*L(ctr).^2.*T(ctr));
	end
end
