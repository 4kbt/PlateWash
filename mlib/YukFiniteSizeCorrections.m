%P and A are PendStruct and AttrStruct respectively
%L is a vector of lambdas.
function Y = YukFiniteSizeCorrections(L, P, A)

		%pendulum effects
	Y =(
	    (	
		(1-exp(-P.a1  ./L)) .* %inlay thickness
		(1-exp(-(P.thickness1-P.a1)./L)) %pendlum thickness
	    ) .*
	  	%attractor
	    (	A.pa1 *   %attractor sheet term
		(1-exp(-A.da1 ./L))   %sheet thickness
	      + A.pal1 *  %Backer plate term
		(1-exp(-A.dal1./L)) .* ... %plate thickness
		exp(-A.da1./L) 	     ...%plate distance
	    )
	   );

	if(Y < 0)
		Y
		warning('Yukawa finite size correction less than zero')
	end
	
end
