%Rotates a point mass array by angle radians counter-clockwise (as viewed from the origin) around rotVec (from origin)

function rotArray = rotatePMArray(array, angle, rotVec)

	modulus = sqrt(rotVec * rotVec');
	x = rotVec(1)/modulus; y = rotVec(2)/modulus; z = rotVec(3)/modulus; 
	
%	## http://www.gamedev.net/reference/articles/article1199.asp
	c = cos(angle); s = sin(angle); t = 1.0 - c;

	R = \
	[ t*x*x + c,	t*x*y+s*z,	t*x*z-s*y;\
	  t*x*y-s*z, 	t*y*y+c,	t*y*z+s*x;\
	  t*x*z+s*y,	t*y*z-s*x,	t*z*z+c];

	points = array(:,2:4)';

	rotArray = array;

	rotArray(:,2:4) = (R*points)';

end

%!test
%! m = [1 1 0 0];
%! o = rotatePMArray(m, pi/2.0, [0 0 1]); 
%! assert(  sum( o - [1 0 1 0]) < 4 * eps)

%!test
%! nMasses = 6;
%! for nSteps = 1:100
%!   m = randn(nMasses,4);
%!   rvec = randn(1,3);
%!   ang = 2 * pi / nSteps;
%!   o = m;
%!   for ctr = 1:nSteps
%!     o = rotatePMArray(o, ang , rvec);
%!   end
%!   totalErr = sum(sum( o - m));
%!   assert(totalErr < eps * nSteps*nMasses*4)
%! end

%!test
%! q = [1 1 0 0];
%! v = [];
%! for ctr = 1:100
%!	a = 2 * pi * rand;
%!	p = rotatePMArray(q, a, [0 0 1]);
%!	v = [v;a , mod(atan(p(:,2)./p(:,3)), pi/2) - mod( a, pi/2) ];
%! end
%! plot(v(:,1), v(:,2)/eps)
%! assert( abs(v(:,2) < 10*eps) );
