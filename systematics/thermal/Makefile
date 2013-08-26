include ../../Makefile.inc

PREREQUISITES = $(HOMEDIR)/runAnalysis/results

all: shortStroke longStroke

shortStroke :  thermalShortStroke.m $(PREREQUISITES)
	$(OCT) thermalShortStroke.m

longStroke  :  thermalLongStroke.m $(PREREQUISITES)
	$(OCT) thermalLongStroke.m



clean : 
	-rm output/*.dat
	-rm output/*.eps
