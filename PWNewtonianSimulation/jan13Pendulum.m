function P = jan13Pendulum 

	'jan13Pendulum'

	rhoTi=4507; printInteger(rhoTi, 'extracted/titaniumDensity.tex');
	pendulumBodyHeight=0.0321203; printSigNumber(pendulumBodyHeight, 'extracted/pendulumBodyHeight.tex',6);
	pendulumBodyWidth =0.0431448; printSigNumber(pendulumBodyWidth, 'extracted/pendulumBodyWidth.tex',6); %How did I get a part in 10^6?
	pendulumBodyThickness= 0.070*0.0254; printSigNumber(pendulumBodyThickness, 'extracted/pendulumBodyThickness.tex', 2); %1 part in 10^2 seems coarse?
	pendulumBodyMass=rhoTi*pendulumBodyHeight*pendulumBodyWidth*pendulumBodyThickness;

	rhoPt=16650; printInteger(rhoPt, 'extracted/denseDensity.tex');
	rhoInlay=rhoPt-rhoTi
	inlayHeight=pendulumBodyHeight
	inlayThickness=0.010*0.0254 ; printSigNumber(inlayThickness, 'extracted/inlayThickness.tex', 2); 
	inlayWidth=pendulumBodyWidth-27.610e-3 ; printSigNumber(inlayWidth, 'extracted/inlayWidth.tex', 5);
	inlayMass=rhoInlay*inlayHeight*inlayThickness*inlayWidth; printSigNumber(inlayMass, 'extracted/inlayMass.tex', 2); 


	pendulumBody=genPointMassRect(pendulumBodyMass, pendulumBodyThickness, pendulumBodyWidth, pendulumBodyHeight, 10, 28 ,15);


	inlay=genPointMassRect(inlayMass, inlayThickness, inlayWidth, inlayHeight, 2, 15, 15)

	inlays=[ translatePMArray(inlay,[ pendulumBodyThickness/2-inlayThickness/2,pendulumBodyWidth/2-inlayWidth/2,0]);\
		translatePMArray(inlay,[-(pendulumBodyThickness/2-inlayThickness/2),-(pendulumBodyWidth/2-inlayWidth/2),0])];

	Pendulum = [pendulumBody; inlays]; 
	%Pendulum = [inlays]; 


	printDecimal(sum(Pendulum(:,1)), 'extracted/derivedPendulumMass.tex', 6);

	P = Pendulum;

end
