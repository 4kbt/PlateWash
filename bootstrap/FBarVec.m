function fbar = FBarVec(x,sx,B,A,L,C)
	T = YukFiniteSizeCorrections(L);
	Q = YukPreFactor;

	fbar =  exp( (sx.^2/2.0-x) * (1./L.')).*B * (A.*L.^2.*T) + C*x; 
end
