include ../Makefile.inc

PREREQUISITES =  *.m $(HOMEDIR)/calibration/pressure/run2937pressEncOutput.dat $(MLIB) $(HOMEDIR)/runAnalysis/results/run3147pM3FilterMerge.dat $(HOMEDIR)/ifo/

IFOOUT:=output/bootstrapArbFit.bootstrappedFits.dat

FITA:=--eval 'alpha = 100;  lambda = 200e-6; injSlope =  5e-11;'
FITB:=--eval 'alpha = 0;    lambda = 200e-6; injSlope = -4e-12;'
FITC:=--eval 'alpha = -100; lambda = 200e-6; injSlope =  6e-12;'
FITD:=--eval 'alpha = 500;  lambda = 200e-6; injSlope = -1e-11;'
FITE:=--eval 'alpha = 1;    lambda = 100e-6; injSlope = -2e-12;'
FITF:=--eval 'alpha = 1;    lambda = 56e-6;  injSlope = -3e-11;'
FITG:=--eval 'alpha = -1;   lambda = 56e-6;  injSlope = -1e-11;'
FITH:=--eval 'alpha = 200;  lambda = 30e-6;  injSlope =  0e-11;'
FITI:=--eval 'alpha = 500;  lambda = 200e-6; injSlope =  1e-11;'
FITSA:=--eval 'alpha= 100;  lambda=200e-6; injSlope= 5e-11; alpha1=10   ; lambda1=1e-3; alpha2=1000; lambda2=20e-6;'
FITSB:=--eval 'alpha= 0;    lambda=200e-6; injSlope=-4e-12; alpha1=1e4  ; lambda1=4e-6; alpha2=1e2 ; lambda2=2e-4;'
FITSC:=--eval 'alpha=-100;  lambda=200e-6; injSlope= 6e-12; alpha1=-1e-3; lambda1=3e-4; alpha2=10  ; lambda2=30e-6;'
FITSD:=--eval 'alpha= 500;  lambda=200e-6; injSlope=-1e-11; alpha1=1e5  ; lambda1=5e-5; alpha2=-583; lambda2=100e-6;'
FITSE:=--eval 'alpha= 1;    lambda=100e-6; injSlope=-2e-12; alpha1=2    ; lambda1=2e-4; alpha2=1.23; lambda2=400e-6;'
FITSF:=--eval 'alpha= -1;   lambda=56e-6 ; injSlope=-3e-11; alpha1=1e-1 ; lambda1=6e-4; alpha2=6e-1; lambda2=10e-6;'
FITSG:=--eval 'alpha= 200;  lambda=56e-6 ; injSlope=-1e-11; alpha1=4    ; lambda1=5e-5; alpha2=-57 ; lambda2=27e-6;'
FITSH:=--eval 'alpha= 500;  lambda=30e-6 ; injSlope= 0e-11; alpha1=-20  ; lambda1=2e-4; alpha2=-0.1; lambda2=200e-6;'
FITSI:=--eval 'alpha= 100;  lambda=200e-6; injSlope= 1e-11; alpha1=137  ; lambda1=8e-6; alpha2=4e4 ; lambda2=310e-6;'

all : yukawaFit arbFit sysTest newtonianInjection output/makeSymFigureSystematics.tex test
	$(HOMEDIR)/bin/mathify.sh extracted/

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

sysTest : yukSysFitA yukSysFitB yukSysFitC yukSysFitD yukSysFitE  yukSysFitF yukSysFitG yukSysFitH yukSysFitI yukawaSystematicsPlots.sh
	./yukawaSystematicsPlots.sh $(HOMEDIR)
	
output/makeSymFigureSystematics.tex: sysTest generatePlottingTeXSystematics.sh output
	./generatePlottingTeXSystematics.sh $(HOMEDIR)
	


yukSysFitA: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSA) yukawaSystematicsWrapper.m
yukSysFitB: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSB) yukawaSystematicsWrapper.m
yukSysFitC: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSC) yukawaSystematicsWrapper.m
yukSysFitD: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSD) yukawaSystematicsWrapper.m
yukSysFitE: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSE) yukawaSystematicsWrapper.m
yukSysFitF: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSF) yukawaSystematicsWrapper.m
yukSysFitG: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSG) yukawaSystematicsWrapper.m
yukSysFitH: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSH) yukawaSystematicsWrapper.m
yukSysFitI: $(PREREQUISITES) $(IFOOUT)
	$(OCT) $(FITSI) yukawaSystematicsWrapper.m

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


$(IFOOUT) : $(PREREQUISITES)
	$(OCT) ifoArbWrapper.m

TeXFigure : generatePlottingTeX.sh output
	./generatePlottingTeX.sh $(HOMEDIR)

clean : 
	-rm output/*.dat
	-rm output/*.eps
