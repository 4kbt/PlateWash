include ../Makefile.inc

PREREQUISITES = ../runAnalysis/results

shortStroke : coilOnCanShortStroke.m $(PREREQUISITES)
	$(OCT) coilOnCanShortStroke.m

clean : 
	rm output/*.dat
	rm output/*.eps
