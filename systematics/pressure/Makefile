include ../../Makefile.inc

all: pressureRiseFitParameters.dat extracted/finalPressurePa.tex extracted/unconstrainedQ.tex squeezeFilm.eps

pressureRiseFitParameters.dat : pressureRise.gpl pressureRiseExtractParameters.m pressureRise.dat
	$(GNU) pressureRise.gpl
	$(OCT) pressureRiseExtractParameters.m
	$(HOMEDIR)/bin/mathify.sh extracted/*

extracted/finalPressurePa.tex extracted/squeezeFilmNoisePower.tex : finalPressure.m finalPressure.dat $(GLOBAL)
	$(OCT) finalPressure.m
	$(HOMEDIR)/bin/mathify.sh extracted/*


extracted/unconstrainedQ.tex : unconstrainedQ.m $(GLOBAL)
	$(OCT) unconstrainedQ.m

SQF=squeezeFilm
$(SQF).eps : $(SQF).m $(SQF).gpl $(HOMEDIR)/systematics/foil/foilTension.m
	$(OCT) $(SQF).m
	$(GNU) $(SQF).gpl

clean:
	-rm pressureRiseFitParameters.dat
	-rm extracted/*.tex
	-rm fit.log	 
