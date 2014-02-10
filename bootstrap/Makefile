include ../Makefile.inc

PREREQUISITES =  *.m $(HOMEDIR)/calibration/pressure/run2937pressEncOutput.dat $(MLIB) $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat

FITA:=--eval 'alpha = 100;  lambda = 200e-6; injSlope =  5e-11;'
FITB:=--eval 'alpha = 0;    lambda = 200e-6; injSlope = -4e-12;'
FITC:=--eval 'alpha = -100; lambda = 200e-6; injSlope =  6e-12;'
FITD:=--eval 'alpha = 500;  lambda = 200e-6; injSlope = -1e-11;'
FITE:=--eval 'alpha = 1;    lambda = 100e-6; injSlope = -2e-12;'
FITF:=--eval 'alpha = 1;    lambda = 56e-6;  injSlope = -3e-11;'
FITG:=--eval 'alpha = -1;   lambda = 56e-6;  injSlope = -1e-11;'
FITH:=--eval 'alpha = 200;  lambda = 30e-6;  injSlope =  0e-11;'
FITI:=--eval 'alpha = 500;  lambda = 200e-6; injSlope =  1e-11;'

all : yukawaFit arbFit test newtonianInjection

yukawaFit : $(PREREQUISITES)
	$(OCT)  yukawaWrapper.m
	./yukawaPlots.sh
	$(MAKE) TeXFigure

test:yukawaFitTest arbFitTest

FITNPATH := $(HOMEDIR)NewtonianSimulation/SimulationOutput/
FITNAFILE := jan13OffsetAttractor.dat
FITNAPATH := $(FITNPATH)$(FITNAFILE)
FITNA:= --eval 'fileInjection = "$(FITNAPATH)";'
FITNBFILE := fullAttractor.dat
FITNBPATH := $(FITNPATH)$(FITNBFILE)
FITNB:= --eval 'fileInjection = "$(FITNBPATH)";'

INJFILE := output/bootstrapYukawa.SimulFloataInjectedLevenburg.dat

newtonianInjection : $(PREREQUISITES)
	$(OCT) $(FITNA) yukawaWrapper.m
	cp $(INJFILE) $(INJFILE).$(FITNAFILE)
	$(OCT) $(FITNB) yukawaWrapper.m
	cp $(INJFILE) $(INJFILE).$(FITNBFILE)

yukawaFitTest : $(PREREQUISITES)
	$(OCT) $(FITA) yukawaWrapper.m
	$(OCT) $(FITB) yukawaWrapper.m
	$(OCT) $(FITC) yukawaWrapper.m
	$(OCT) $(FITD) yukawaWrapper.m
	$(OCT) $(FITE) yukawaWrapper.m
	$(OCT) $(FITF) yukawaWrapper.m
	$(OCT) $(FITG) yukawaWrapper.m
	$(OCT) $(FITH) yukawaWrapper.m
	$(OCT) $(FITI) yukawaWrapper.m
	./yukawaPlots.sh
	$(MAKE) TeXFigure

arbFit : $(PREREQUISITES)
	$(OCT) arbFitWrapper.m
	$(HOMEDIR)/bin/mathify.sh extracted/
	./arbFitPlots.sh

arbFitTest : $(PREREQUISITES)
	$(OCT) $(FITA) arbFitWrapper.m
	$(OCT) $(FITB) arbFitWrapper.m
	$(OCT) $(FITC) arbFitWrapper.m
	$(OCT) $(FITD) arbFitWrapper.m
	$(OCT) $(FITE) arbFitWrapper.m
	$(OCT) $(FITF) arbFitWrapper.m
	$(OCT) $(FITG) arbFitWrapper.m
	$(OCT) $(FITH) arbFitWrapper.m
	$(OCT) $(FITI) arbFitWrapper.m
	./arbFitPlots.sh

TeXFigure : generatePlottingTeX.sh output
	./generatePlottingTeX.sh $(HOMEDIR)

clean : 
	-rm output/*.dat
	-rm output/*.eps
