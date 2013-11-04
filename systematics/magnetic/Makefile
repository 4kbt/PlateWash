include ../../Makefile.inc

PREREQUISITES = $(HOMEDIR)/runAnalysis/results Makefile

all: shortStroke longStroke
	$(MAKE) -C plots

shortStroke :  coilOnCanShortStroke.m $(PREREQUISITES)
	$(OCT) coilOnCanShortStroke.m
	$(HOMEDIR)/bin/mathify.sh extracted/*

longStroke  :  coilOnCanLongStroke.m $(PREREQUISITES)
	$(OCT) coilOnCanLongStroke.m
	$(HOMEDIR)/bin/mathify.sh extracted/*


clean : 
	-rm plots/*.dat
	-rm extracted/*.tex
	$(MAKE) -C plots clean
