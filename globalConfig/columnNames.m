#This script is executed by both Octave and Gnuplot. Choose syntax carefully. Use only # as a comment character.

numSystematics = 4;
numPWDAQSensors = 25;
numPWSensors = numPWDAQSensors+numSystematics;
numPSSensors = 15;
numIFOSensors = 25;
numSensors = numPWSensors+numPSSensors+numIFOSensors;
diffErrOffset = 6*numSensors;

pwTimeCol  = 10;
pwPhiTopCol = 21;
pwFBOutCol = 23;
torqueCol  = 16;
torCol = torqueCol;
torerrCol = diffErrOffset+torCol;
torqueACol = torqueCol + numSensors;
torqueBCol = torqueCol + 2*numSensors; 

psdCol = 15; 


ABErrOffset = numSensors*15;
psTimeCol   = 5 ;
psSquareCol = 15;
aCol = numSensors+numPWSensors+psSquareCol;
aErrCol = aCol + ABErrOffset;
aMaxCol = aCol + 7*numSensors;
bCol = aCol+numSensors;
bErrCol = bCol + ABErrOffset;
bMaxCol = bCol + 8*numSensors; #yes, aMaxCol++.


ifoTimeCol  = 1;
ifoDataCol  = 2;
ifopMCol = numPWSensors+numPSSensors+ifoDataCol;
ifoErrCol =  ifopMCol+diffErrOffset;
ifoACol = ifopMCol + numSensors;
ifoBCol = ifopMCol + 2* numSensors;

#Systematics
magFieldCol         = numPWDAQSensors+1;
magFieldACol        = magFieldCol+numSensors;
magFieldBCol        = magFieldCol+2*numSensors;
magField2Col        = numPWDAQSensors+2;
magField2ACol       = magField2Col+numSensors;
magField2BCol       = magField2Col+2*numSensors;
temperatureCol      = numPWDAQSensors+3;
temperatureACol     = temperatureCol+numSensors;
temperatureBCol     = temperatureCol+2*numSensors;
tempGradientCol     = numPWDAQSensors+4;
tempGradientACol    = tempGradientCol+numSensors;
tempGradientBCol    = tempGradientCol+2*numSensors;

#Chisquared unit conversion factors, not columns, but needed for chisquaredWSystematics.m
XSUnits = 1e-12;
XLUnits = 1e-4;

#Distance determination
pfTouch =  56+17+ 12+2 ;  #swag
touch2937 =  147 -2 + pfTouch;
#Distance cut
shortCut = (pfTouch+10)*1e-6; 
