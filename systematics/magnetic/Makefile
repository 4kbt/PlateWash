include ../../Makefile.inc

PREREQUISITES = $(HOMEDIR)/runAnalysis/results Makefile

TMF=thermalMagneticField

all: shortStroke longStroke field $(TMF).eps
	$(MAKE) -C plots

shortStroke :  coilOnCanShortStroke.m $(PREREQUISITES)
	$(OCT) coilOnCanShortStroke.m
	$(HOMEDIR)/bin/mathify.sh extracted/*

longStroke  :  coilOnCanLongStroke.m $(PREREQUISITES)
	$(OCT) coilOnCanLongStroke.m
	$(HOMEDIR)/bin/mathify.sh extracted/*

field       :  magneticField.m coilProperties.m $(PREREQUISITES)
	$(OCT) magneticField.m
	$(HOMEDIR)/bin/mathify.sh extracted/*

$(TMF).eps : $(TMF).gpl
	$(GNU) $(TMF).gpl


clean : 
	-rm plots/*.dat
	-rm extracted/*.tex
	$(MAKE) -C plots clean
