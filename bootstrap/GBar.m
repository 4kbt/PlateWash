function gbar = GBar(x,y,sx,sy,B,sB,A,L,C)

%	gbar = ...
%	sum(A.*B.*( ...
%		 exp( (sx.^2/2-x)./L) ...
%		-exp( (sy.^2/2-y)./L) ...
%	) ...
%	+ C*(x-y));

%gbar = (yukawaVectorizedTorque(x, L , A) - yukawaVectorizedTorque(y, L, A) + C.*(x - y) );

gbar = FBar(x,sx,B,sB,A,L,C) - FBar(y,sy,B,sB,A,L,C);

%x
%y
%yVx = yukawaVectorizedTorque(x, L , A)
%yVy = yukawaVectorizedTorque(y, L , A)
%yVs = C.*(x - y)


end
