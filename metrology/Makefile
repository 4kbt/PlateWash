include ../Makefile.inc

BOUNCE := run3145bounce
TWIST  := run1690attractorTwist

FRINGES := run3305fringes
CRASH   := run3305capSweep
PLATEAU := run3310plateau

all : $(BOUNCE).eps $(TWIST).eps $(FRINGES).eps $(CRASH).eps $(PLATEAU).eps

$(BOUNCE).dat : $(BOUNCE).m
	$(OCT) $(BOUNCE).m 
	
run3145bounceAngleCull.dat : pendulumPositionAngle.m eyeballQuantities.m errorBudget.m
	$(OCT) pendulumPositionAngle.m
	$(OCT) eyeballQuantities.m
	$(OCT) errorBudget.m

$(BOUNCE).eps : $(BOUNCE).gpl $(BOUNCE).dat $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat run3145bounceAngleCull.dat
	$(GNU) $(BOUNCE).gpl

$(TWIST).dat : $(TWIST).m
	$(OCT) $<

$(TWIST).eps : $(TWIST).gpl $(TWIST).dat
	$(GNU) $<

$(FRINGES).eps: fringes33052nd.dat $(FRINGES).m $(FRINGES).gpl
	$(OCT) $(FRINGES).m
	$(GNU) $(FRINGES).gpl

$(CRASH).eps : $(CRASH).m $(CRASH).gpl
	$(OCT) $(CRASH).m
	$(GNU) $(CRASH).gpl

$(PLATEAU).eps : $(PLATEAU).m $(PLATEAU).gpl
	$(OCT) $(PLATEAU).m
	$(GNU) $(PLATEAU).gpl
