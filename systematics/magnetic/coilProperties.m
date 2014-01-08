%Checked 1/7/2014
CoilDiameter = 31.5*0.0254;
CoilDiameterErr = 0.25*0.0254;
printSigErr(CoilDiameter, CoilDiameterErr, 'extracted/CoilDiameter.tex')

CoilTurns = 190*2;
printInteger( CoilTurns, 'extracted/CoilTurns.tex');

CoilCurrent = 0.8;
printDecimal(CoilCurrent, 'extracted/CoilCurrent.tex', 1);
