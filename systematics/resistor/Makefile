include ../../Makefile.inc

PREREQUISITES := $(HOMEDIR)/runAnalysis/results Makefile

all: longStroke
	$(MAKE) -C plots

RLONG  := resistorLongStroke.m

LONGDAT := $(shell grep dat $(RLONG)  | grep plots | $(SINGLEQUOTECUTTER) )

LONGTEXFP  := $(shell grep filePath $(RLONG)  | head -n 1 | $(SINGLEQUOTECUTTER) )

LONGTEX    := $(shell grep tex $(RLONG)  | $(SINGLEQUOTECUTTER) )

LONGTEX  := $(addprefix $(LONGTEXFP),$(LONGTEX))

$(LONGTEX) $(LONGDAT)  longStroke  :  $(RLONG) $(PREREQUISITES)
	$(OCT) $(RLONG)
	$(HOMEDIR)/bin/mathify.sh extracted/*

clean : 
	-rm plots/*.dat
	-rm extracted/*.tex
	$(MAKE) -C plots clean

toy : 
	echo $(LONGTEX) 
