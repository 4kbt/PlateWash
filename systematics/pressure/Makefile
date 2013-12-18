include ../../Makefile.inc

all: pressureRiseFitParameters.dat

pressureRiseFitParameters.dat : pressureRise.gpl pressureRiseExtractParameters.m pressureRise.dat
	$(GNU) pressureRise.gpl
	$(OCT) pressureRiseExtractParameters.m
	$(HOMEDIR)/bin/mathify.sh extracted/*

extracted/finalPressurePa.tex : finalPressure.m finalPressure.dat
	$(OCT) finalPressure.m




clean:
	-rm pressureRiseFitParameters.dat
	-rm extracted/*.tex
	-rm fit.log	 
