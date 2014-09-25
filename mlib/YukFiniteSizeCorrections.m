function Y = YukFiniteSizeCorrections(L)

	DoNotExtractPendulumParameters = 1;
	PendulumParameters
	AttractorParameters

		%pendulum effects
	Y =(
	    (	
		(1-exp(-a1  ./L)) .* %inlay thickness
		(1-exp(-(thickness1-a1)./L)) %pendlum thickness
	    ) .*
	  	%attractor
	    (	pa1 *   %attractor sheet term
		(1-exp(-da1 ./L))   %sheet thickness
	      + pal1 *  %Backer plate term
		(1-exp(-dal1./L)) .* ... %plate thickness
		exp(-da1./L) 	     ...%plate distance
	    )
	   );

	if(Y < 0)
		Y
		warning('Yukawa finite size correction less than zero')
	end
	
end
