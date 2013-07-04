## Pressure Calibration

TARGETS = run2937pressEncOutput.dat run2937pressEncFunction.gpl

#PressEnc gnuplot function
$(TARGETS): run2937pressEnc.m run2937pressEncOutputToFunction.sh $(MLIB)
	$(OCT) run2937pressEnc.m
	./run2937pressEncOutputToFunction.sh

include ../../Makefile.inc

clean :
	rm $(TARGETS)
