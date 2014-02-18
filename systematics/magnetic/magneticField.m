coilProperties
fundamentalConstants

CoilFieldAtCenter = mu_0*CoilTurns*CoilCurrent/CoilDiameter;
printSigNumber(CoilFieldAtCenter, 'extracted/CoilFieldAtCenter.tex', 1);

coilTip = 1/3; %SWAG

verticalField = CoilFieldAtCenter*cos(coilTip);   printSigNumber(verticalField,   'extracted/verticalField.tex'  ,1);
transverseField = CoilFieldAtCenter*sin(coilTip); printSigNumber(transverseField, 'extracted/transverseField.tex',1);
axialField = transverseField;			  printSigNumber(axialField,      'extracted/axialField.tex'     ,1);
