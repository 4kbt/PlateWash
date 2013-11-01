include ../Makefile.inc

EXTRACTEDDEPS := $(shell grep filename thesis.lyx | awk '{print $$2}' | sed 's/\"//g')

PLOTTARGETS := $(shell grep eps  plots/Makefile | awk '{print $$1}' | grep eps | sed 's/^/plots\//')


thesis.pdf : thesis.lyx $(EXTRACTEDDEPS)
	$(OCT) ../globalConfig/run3147FixedParameters.m
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*
	$(LYX) thesis.lyx

$(PLOTTARGETS) :
	$(MAKE) -C plots

clean : 
	-rm *.pdf
	-rm *.lyx~
	-rm *.lyx.emergency
	-rm *.aux
	-rm *.bib.bak
	-rm *.log
	$(MAKE) clean -C plots 
