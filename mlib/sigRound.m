function out = sigRound(num, prec)

	assert(prec > 0);
	%integer check
	assert(prec - floor(prec) == 0 );
	assert(size(num) == [1 1]);

	%abs is necessary to prevent complex/imaginary behaviour
	p = floor(log10(abs(num)));

	prec = prec - 1;

	n = num*10^(-p+prec);

	n = round(n);

	out = n * 10^(p-prec);
end

%!test
%!  n = sigRound( 0.8 , 1)
%!  assert(0.8 == n)

%!test
%!  n = sigRound( 0.83 , 1)
%!  assert(0.8 == n)

%!test
%!  n = sigRound( 0.87 , 1)
%!  assert(0.9 == n)

%!test
%!  n = sigRound( 31415 , 2)
%!  assert(31000 == n)

%!test
%!  n = sigRound( 1.063 , 2)
%!  assert(1.1 == n)

%!test
%!  n = sigRound( -1.063 , 2)
%!  assert(-1.1 == n)

%!test
%!  n = sigRound( -1.0630000 , 8)
%!  assert(-1.0630000 == n)
