function gbar = GBarVec(x,y,sx,sy,B,sB,A,L,C)
	gbar = FBarVec(x,sx,B,A,L,C) - FBarVec(y,sy,B,A,L,C);	
end


%!test
%!
