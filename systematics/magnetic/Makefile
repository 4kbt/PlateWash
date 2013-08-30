include ../../Makefile.inc

PREREQUISITES = $(HOMEDIR)/runAnalysis/results

all: shortStroke longStroke

shortStroke :  coilOnCanShortStroke.m $(PREREQUISITES)
	$(OCT) coilOnCanShortStroke.m

longStroke  :  coilOnCanLongStroke.m $(PREREQUISITES)
	$(OCT) coilOnCanLongStroke.m


clean : 
	-rm plots/*.dat
	-rm extracted/*.tex
	$(MAKE) -C plots clean
