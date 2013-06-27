function [force torque] = rectMatrixIterator(m1, m2, rotationTranslation)

more off;

force = zeros(rows(rotationTranslation),3);
torque = force;

%This function really should use Euler Angles, but I don't yet have a use case for the general function.

if(columns(rotationTranslation) ~= 7)
	error('rotation/translation vector does not have 7 columns.');
end

for i = 1:rows(rotationTranslation)

%	m = m2


rotationTranslation(i,1)
rotationTranslation(i,2:4)

	m = rotatePMArray(m2, rotationTranslation(i,1), rotationTranslation(i,2:4));
	m = translatePMArray(m, rotationTranslation(i,5:7));

	[force(i,:),torque(i,:)]=pointMatrixGravity(m1,m);
	if(mod(i,10)==2)
		hold on        
		displayPoints(m1,m);
    	end
        save -text 'tempForceTorque.dat' force torque;

end

end %function
