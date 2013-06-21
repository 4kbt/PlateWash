#octave run2937pressEnc.m
~/bin/commentStrip.sh run2937pressEncOutput.dat
~/bin/whiteLineStrip.sh run2937pressEncOutput.dat

awk '{print "pressEncCalib(x) = ", $2, " + ", $1, " * x" } ' run2937pressEncOutput.dat > run2937pressEncFunction.gpl
