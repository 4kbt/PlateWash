include ../Makefile.inc

EXTRACTEDDEPS := $(shell grep filename thesis.lyx | awk '{print $$2}' | sed 's/\"//g')

DEEPMAKES := $(shell find `pwd`/plots/ -name Makefile)

PLOTTARGETS := $(shell grep eps  $(DEEPMAKES) | awk '{print $$1}' | grep eps | sed 's/Makefile://g'| sed 's/://g')


thesis.pdf : thesis.lyx $(EXTRACTEDDEPS)
	$(OCT) ../globalConfig/run3147FixedParameters.m
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*
	$(LYX) thesis.lyx
	date > buildDate.txt

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
