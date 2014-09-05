#complement of alphasToLogAlphas
#Crossover is expressed in the log. -6 corresponds to a 10^-6 crossover

function a = logAlphasToAlphas(la, alphaCrossover)

	l = abs(la) + alphaCrossover;
	s = sign(la);

	a = s.*10.^l;
end

%!test
%! crossover = -6; 
%! n = 1000;
%! s = -1.^(round(rand(n,1)));
%! r = 10.^(10*rand(n,1) + -crossover);
%! R = s.*r;
%! assert( R == logAlphasToAlphas( alphasToLogAlphas( R, -crossover) , -crossover) );

%!test
%! assert( 0 == logAlphasToAlphas( 0 , -6));
