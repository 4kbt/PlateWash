include ../../Makefile.inc

all: pressureRiseFitParameters.dat extracted/finalPressurePa.tex extracted/unconstrainedQ.tex

pressureRiseFitParameters.dat : pressureRise.gpl pressureRiseExtractParameters.m pressureRise.dat
	$(GNU) pressureRise.gpl
	$(OCT) pressureRiseExtractParameters.m
	$(HOMEDIR)/bin/mathify.sh extracted/*

extracted/finalPressurePa.tex : finalPressure.m finalPressure.dat $(GLOBAL)
	$(OCT) finalPressure.m


extracted/unconstrainedQ.tex : unconstrainedQ.m $(GLOBAL)
	$(OCT) unconstrainedQ.m

clean:
	-rm pressureRiseFitParameters.dat
	-rm extracted/*.tex
	-rm fit.log	 
