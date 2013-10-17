include ../Makefile.inc

thesis.pdf : thesis.lyx
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
