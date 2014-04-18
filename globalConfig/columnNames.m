#This script is executed by both Octave and Gnuplot. Choose syntax carefully. Use only # as a comment character.

numSystematics = 4;
numPWDAQSensors = 25;
numPWSensors = numPWDAQSensors+numSystematics;
numPSSensors = 15;
numIFOSensors = 25;
numSensors = numPWSensors+numPSSensors+numIFOSensors;

pwTimeCol  = 10;
torqueCol  = 16;
torCol = torqueCol;
torerrCol = 6*numSensors+torCol;



ABErrOffset = numSensors*15;
psTimeCol   = 5 ;
psSquareCol = 15;
aCol = numSensors+numPWSensors+psSquareCol;
aErrCol = aCol + ABErrOffset;
bCol = aCol+numSensors;
bErrCol = bCol + ABErrOffset;

ifoTimeCol  = 1;
ifoDataCol  = 2;
ifopMCol = numPWSensors+numPSSensors+ifoDataCol;
ifoACol = ifopMCol + numSensors;
ifoBCol = ifopMCol + 2* numSensors;

#Systematics
magFieldCol         = numPWDAQSensors+1;
magFieldACol        = magFieldCol+numSensors;
magField2Col        = numPWDAQSensors+2;
magField2ACol       = magField2Col+numSensors;
temperatureCol      = numPWDAQSensors+3;
temperatureACol     = temperatureCol+numSensors;
tempGradientCol     = numPWDAQSensors+4;
tempGradientACol    = tempGradientCol+numSensors;

#Chisquared unit conversion factors, not columns, but needed for chisquaredWSystematics.m
XSUnits = 1e-12;
XLUnits = 1e-4;


