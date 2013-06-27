%numsteps=10

angStart = 0;
angStop  = 2*pi;
angSteps = 53;

for i=1:angSteps
	rot(i) = (angStop-angStart)/angSteps*(i-1);
end

rot = rot'; 

%clearplot
clf
hold on
rectMatrixBellowsRUN3147
rectAttForce = force
rectAttTorque = torque
hold off
%pause

save rectMatrixBrickRUN2296.mat rot rectAttForce rectAttTorque

