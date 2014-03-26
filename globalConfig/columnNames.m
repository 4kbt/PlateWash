#This script is executed by both Octave and Gnuplot. Choose syntax carefully.

numSystematics = 4;
numPWDAQSensors = 25;
numPWSensors = numPWDAQSensors+numSystematics;
numPSSensors = 15;
numIFOSensors = 25;
numSensors = numPWSensors+numPSSensors+numIFOSensors;

psSquareCol = 15;
torqueCol   = 16;
ifoDataCol  = 2;
pwTimeCol  = 10;
psTimeCol  = 5 ;
ifoTimeCol = 1 ;
aCol = numSensors+numPWSensors+psSquareCol;
aErrCol = aCol + numSensors*15;
bCol = aCol+numSensors;
bErrCol = bCol + numSensors*15;
torCol = torqueCol;
torerrCol = 6*numSensors+torCol;

#Systematics
magFieldCol         = numPWDAQSensors+1+numSensors;
magField2Col        = numPWDAQSensors+2+numSensors;
temperatureCol      = numPWDAQSensors+3+numSensors;
tempGradientCol     = numPWDAQSensors+4+numSensors;
