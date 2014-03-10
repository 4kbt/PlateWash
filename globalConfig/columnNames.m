#This script is executed by both Octave and Gnuplot. Choose syntax carefully.

numSystematics = 4;
numPWSensors = 25+numSystematics;
numPSSensors = 15;
numIFOSensors = 25;
numSensors = numPWSensors+numPSSensors+numIFOSensors;

psSquareCol = 15;
torqueCol   = 16;
ifoDataCol  = 2;
pwTimeCol  = 10;
psTimeCol  = 5 ;
ifoTimeCol = 1 ;
aCol = 105;
aErrCol = aCol + numSensors*15;
bCol = 170;
bErrCol = bCol + numSensors*15;
torCol = torqueCol;
torerrCol = 6*numSensors+torCol;

#Systematics
magFieldCol         = numPWSensors+1;
magField2Col        = numPWSensors+2;
temperatureCol      = numPWSensors+3;
tempGradientCol     = numPWSensors+4;
