function yo = yukawaForceLaw(alpha, lambda, shortest, longest, spacing)

	%import parameters
	run3147PendulumParameters

	iW = w1/2.0 - j1; %inlayWidth

	x = shortest:spacing:longest;
	x = x';

	%need to work out sign
	tor = 2*pi*G * alpha * lambda.^2 * h1*((w1/2)^2 - (w1/2-iW)^2)/2 *(ph1-pl1) * (1-exp(-a1/lambda))* (\
	pa1 .*\
		       ( exp(-(x                      )/lambda) * (1-exp(-da1 /lambda)) -\
			 exp(-(x+    (thickness1 - a1))/lambda) * (1-exp(-da1 /lambda))) 
	+ pal1 .*\
		       ( exp(-(x+da1                  )/lambda) * (1-exp(-dal1/lambda)) -\
			 exp(-(x+da1+(thickness1 - a1))/lambda) * (1-exp(-dal1/lambda)))\
	);
	yo = [x tor];

end

%!test
%! alpha = 10;
%! lambda = 100e-6;
%!
%! fl = yukawaForceLaw(alpha,lambda, 1e-6,3e-3, 1e-6);
%!
%! yl = yukawaVectorizedTorque(fl(:,1)', lambda,alpha);
%!
%! assert( max(abs(fl(:,2)./yl) - 1) < 1e-10 );
%! assert( sign(fl(:,2)).*sign(yl) == 1);
