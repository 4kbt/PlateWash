include ../Makefile.inc

BOUNCE := run3145bounce
TWIST  := run1690attractorTwist

all : $(BOUNCE).eps $(TWIST).eps

$(BOUNCE).dat : $(BOUNCE).m
	$(OCT) $(BOUNCE).m 
	

$(BOUNCE).eps : $(BOUNCE).gpl $(BOUNCE).dat $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat
	$(GNU) $(BOUNCE).gpl

$(TWIST).dat : $(TWIST).m
	$(OCT) $<

$(TWIST).eps : $(TWIST).gpl $(TWIST).dat
	$(GNU) $<
