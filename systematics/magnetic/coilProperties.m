%Checked 1/7/2014
CoilDiameter = 31.5*0.0254;
CoilDiameterErr = 0.25*0.0254;
printSIErr(CoilDiameter, CoilDiameterErr, 2, -3, 'extracted/CoilDiameter.tex')

CoilTurns = 190*2;
printInteger( CoilTurns, 'extracted/CoilTurns.tex');

CoilCurrent = 0.8;
CoilCurrentErr = 0.1;
printSI(CoilCurrent, CoilCurrentErr, 1, -3, 'A', 'extracted/CoilCurrent.tex');
