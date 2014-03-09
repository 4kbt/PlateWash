function fbar = FBar(x,sx,B,A,L,C)
%	sx = sx*0;

	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;

	IL = 1./L.';
        IL2= 1./transpose ( L.^2 );


	fbar =  Q*exp( (sx.^2 / 2.0 * IL2 - x * IL ) ).* B * (A.*L.^2.*T) + C*x; 
end
