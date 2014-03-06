function fbar = FBar(x,sx,B,A,L,C)
	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;

	fbar =  Q*exp( (sx.^2/2.0-x) * (1./L.')).* B * (A.*L.^2.*T) + C*x; 
end
