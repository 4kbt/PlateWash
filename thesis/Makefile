include ../Makefile.inc

EXTRACTEDDEPS := $(shell grep filename thesis.lyx | awk '{print $$2}' | sed 's/\"//g')


thesis.pdf : thesis.lyx $(EXTRACTEDDEPS)
	$(OCT) ../globalConfig/run3147FixedParameters.m
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*
	$(MAKE) -C plots
	$(LYX) thesis.lyx

clean : 
	-rm *.pdf
	-rm *.lyx~
	-rm *.lyx.emergency
	-rm *.aux
	-rm *.bib.bak
	-rm *.log
	$(MAKE) clean -C plots 
