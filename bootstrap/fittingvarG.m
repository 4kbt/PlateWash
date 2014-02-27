%usage:
%x: start position
%y: end position
%sx: std dev of x
%sy: std dev of y
%B: vector of systematic central values
%sB: vector of systematic std devs
%A: Vector of alphas
%L: Vector of lambdas
%C: slope
%This function presently calculates for force, not torque, the difference should only correspond to a shift in alpha.
%This function assumes parallel plates.
function vg = fittingvarG(x,y,sx,sy,B,sB, A,L,C)

	accum = 0;

	for l = 1:rows(B)
		for j = 1:rows(B)
			if (j ~= l )
	accum = accum +  ... 
	A(l)*B(l)*A(j)*B(j)*(   
		   exp( (sx.^2/2-x)/L(l) + (sx.^2/2 - x)/L(j) ) 
		+  exp( (sy.^2/2-y)/L(l) + (sy.^2/2 - y)/L(j) ) 
		-  exp( (sy.^2/2-y)/L(l) + (sx.^2/2 - x)/L(j) )
		-  exp( (sx.^2/2-x)/L(l) + (sy.^2/2 - y)/L(j) ) 
	); % close multiplication
			
			end
		end
	end
	
	accum = accum ...  
	+sum(A.^2.*(B.^2+sB.^2) .* (  %diagonal squared terms
	  exp( (sx.^2-2*x)./L)  
	+ exp( (sy.^2-2*y)./L)  
	- 2*exp( ( sx.^2/2 - x + sy.^2/2 - y )./L )
	)) ...  % close diagonal squared terms 
	+2*C*sum( A.*B.*(  %linear-yukawa crossterms
	 exp(-x./L + sx^2./(2*L.^2)).*(x - sx.^2./L) 
	+exp(-y./L + sy^2./(2*L.^2)).*(y - sy.^2./L) 
	-exp(sx^2./(2*L)-x./L)*y 
	-exp(sy^2./(2*L)-y./L)*x 
	)) ...  % close linear-yukawa crossterms 
	+C.^2.*( (x-y).^2 + sx.^2 + sy.^2) ...  %linearsquared terms
	- GBar(x,y,sx,sy,B,sB,A,L,C).^2 ; % average value of G

	vg = accum;

end
