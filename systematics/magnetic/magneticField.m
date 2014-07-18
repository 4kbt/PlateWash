coilProperties
fundamentalConstants

CoilFieldAtCenter = mu_0*CoilTurns*CoilCurrent/CoilDiameter;
printSigNumber(CoilFieldAtCenter, 'extracted/CoilFieldAtCenter.tex', 1);

coilTip = 1/3; %SWAG

verticalField = CoilFieldAtCenter*cos(coilTip);   printSI(verticalField,   1, -6, 'T', 'extracted/verticalField.tex'  );
transverseField = CoilFieldAtCenter*sin(coilTip); printSI(transverseField, 1, -6, 'T', 'extracted/transverseField.tex');
axialField = transverseField;			  printSI(axialField,      1, -6, 'T', 'extracted/axialField.tex'     );
