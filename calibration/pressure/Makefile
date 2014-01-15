include ../../Makefile.inc
## Pressure Calibration

TARGETS := run2937pressEncOutput.dat run2937pressEncFunction.gpl run2937pressEncData.dat

all : run2937pressEncPlot.eps $(TARGETS) 


#PressEnc gnuplot function
$(TARGETS): run2937pressEnc.m run2937pressEncOutputToFunction.sh $(MLIB)
	$(OCT) run2937pressEnc.m
	./run2937pressEncOutputToFunction.sh


PLOTFILE := run2937pressEncPlot.gpl

run2937pressEncPlot.eps: $(PLOTFILE) $(TARGETS)
	$(GNU) $(PLOTFILE)


clean :
	-rm $(TARGETS)
