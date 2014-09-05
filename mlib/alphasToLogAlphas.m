%This function converts from real space to a signed logarithmic space,
% with a crossover in sign at "alphaCrossover". 
% Crossover is expressed in the log, so -6 corresponds to a 10^-6 crossover
% For example, with a crossover of -6, -1e-4 corresponds to -2
function la = alphasToLogAlphas(a, alphaCrossover)

	l = log10(abs(a));
	s = sign(a);

	l = l + -alphaCrossover;
	l( l < 0 ) = 0;

	la = l.*s;

end

%!test
%! assert( -2 == alphasToLogAlphas( -1e-4 , -6) );

%!test
%! assert( 0 == alphasToLogAlphas( -6e-9, -6) );

%!test
%! crossover = -6; 
%! n = 1000;
%! s = -1.^(round(rand(n,1)));
%! r = 10.^(10*rand(n,1) + -crossover);
%! R = r.*s;
%! o = alphasToLogAlphas( R, crossover);
%! assert( sign(o) == sign(R));
%! assert( abs(o) == log10(abs(R)) - crossover);
