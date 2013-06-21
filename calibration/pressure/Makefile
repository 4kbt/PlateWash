## Pressure Calibration

include ../../Makefile.inc

#PressEnc gnuplot function
run2937pressEncOutput.dat run2937pressEncFunction.gpl : run2937pressEnc.m run2937pressEncOutputToFunction.sh $(MLIB)
	$(OCT) run2937pressEnc.m
	./run2937pressEncOutputToFunction.sh


