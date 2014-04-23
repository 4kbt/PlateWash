function P = jan13Pendulum 

%	'jan13Pendulum'
	run3147PendulumParameters

	pendulumBody=genPointMassRect(pendulumBodyMass, pendulumBodyThickness, pendulumBodyWidth, pendulumBodyHeight, 10, 28 ,15);


	inlay=genPointMassRect(inlayMass, inlayThickness, inlayWidth, inlayHeight, 2, 15, 15);

	inlays=[ translatePMArray(inlay,[ pendulumBodyThickness/2-inlayThickness/2,pendulumBodyWidth/2-inlayWidth/2,0]);...
		translatePMArray(inlay,[-(pendulumBodyThickness/2-inlayThickness/2),-(pendulumBodyWidth/2-inlayWidth/2),0])];

	Pendulum = [pendulumBody; inlays]; 
	%Pendulum = [inlays]; 


	printDecimal(sum(Pendulum(:,1)), [HOMEDIR '/extracted/derivedPendulumMass.tex' ], 6);

	P = Pendulum;

end
