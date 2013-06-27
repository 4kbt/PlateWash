rhoTi=4507
pendulumBodyHeight=0.0321203
pendulumBodyWidth =0.0431448
pendulumBodyThickness= 0.070*0.0254
pendulumBodyMass=rhoTi*pendulumBodyHeight*pendulumBodyWidth*pendulumBodyThickness

rhoPt=16650
rhoInlay=rhoPt-rhoTi
inlayHeight=pendulumBodyHeight
inlayThickness=0.010*0.0254
inlayWidth=pendulumBodyWidth-27.610e-3
inlayMass=rhoInlay*inlayHeight*inlayThickness*inlayWidth



pendulumBody=genPointMassRect(pendulumBodyMass, pendulumBodyThickness, pendulumBodyWidth, pendulumBodyHeight, 10, 28 ,15);


inlay=genPointMassRect(inlayMass, inlayThickness, inlayWidth, inlayHeight, 2, 15, 15)

inlays=[ translatePMArray(inlay,[ pendulumBodyThickness/2-inlayThickness/2,pendulumBodyWidth/2-inlayWidth/2,0]);\
	translatePMArray(inlay,[-(pendulumBodyThickness/2-inlayThickness/2),-(pendulumBodyWidth/2-inlayWidth/2),0])];

Pendulum = [pendulumBody; inlays]; 
%Pendulum = [inlays]; 

