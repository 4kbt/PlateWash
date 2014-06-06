function Flexure = jan14Flexure()
run3147PendulumParameters

vH = flexureHeight;
vW = flexureWidth;
vT = wallThickness;
vM = rhoAl * vH*vW*vT;

hH = wallThickness;
hL = flexureLength - 2 * wallThickness;
hW = flexureWidth; 
hM = rhoAl * vH*vW*vT; 

%Make component bars
vertBar  = genPointMassRect( vM, vT, vW, vH, 5, 5, 5);
horizBar = genPointMassRect( hM, hL, hW, hH, 5, 5, 5);

%double and place them correctly
vB2 = [translatePMArray(vertBar, [ (flexureLength - wallThickness)/2.0, 0, 0]);...
       translatePMArray(vertBar, [-(flexureLength - wallThickness)/2.0, 0, 0])];

hB2 = [translatePMArray(horizBar, [0, 0, (flexureHeight - wallThickness)/2.0]);...
       translatePMArray(horizBar, [0, 0,-(flexureHeight - wallThickness)/2.0])];

Flexure = [vB2; hB2];

Flexure = translatePMArray(Flexure, [ flexureSetBack + flexureLength/2.0,0,0]);


end
