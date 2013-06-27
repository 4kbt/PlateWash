%Rotates a point mass array by angle radians clockwise (as viewed from the origin) around rotVec (from origin)

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
