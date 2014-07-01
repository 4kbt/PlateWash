include ../Makefile.inc

BOUNCE := run3145bounce

all : $(BOUNCE).eps

$(BOUNCE).dat : $(BOUNCE).m
	$(OCT) $(BOUNCE).m 
	

$(BOUNCE).eps : $(BOUNCE).gpl $(BOUNCE).dat $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat
	$(GNU) $(BOUNCE).gpl
