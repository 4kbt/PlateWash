function gbar = GBarVec(x,y,sx,sy,B,sB,A,L,C)

	size( exp( (sx.^2/2.0-x) * (1./L.')).*B)  
	Term1 =  exp( (sx.^2/2.0-x) * (1./L.')).*B * (A.*L.^2); 
	Term2 = -exp( (sy.^2/2.0-y) * (1./L.')).*B * (A.*L.^2); 
	Term3 =  C *(x-y);

	gbar = Term1+Term2+Term3;
end


%!test
%!
