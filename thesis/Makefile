include ../Makefile.inc

thesis.pdf : thesis.lyx
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*
	$(LYX) thesis.lyx

