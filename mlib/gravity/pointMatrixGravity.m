%Returns the three axis force and torque on array1 by array2
%array entries of the form [m, x, y, z] 
function [force, torque]=pointMatrixGravity(array1,array2)

	force = [0 0 0];

	torque = [0 0 0];

	for i = 1:rows(array1)

			iforce=Gmmr2Array( array1(i,:),array2);
	
			itorque=cross(array1(i,2:4),iforce', 2);

			torque += itorque;
			force  += iforce';

	end
end
