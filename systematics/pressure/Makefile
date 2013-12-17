include ../../Makefile.inc

pressureRiseFitParameters.dat : pressureRise.gpl pressureRiseExtractParameters.m pressureRise.dat
	$(GNU) pressureRise.gpl
	$(OCT) pressureRiseExtractParameters.m
	$(HOMEDIR)/bin/mathify.sh extracted/*


clean:
	-rm pressureRiseFitParameters.dat
	-rm extracted/*.tex
	-rm fit.log	 
