include ../../Makefile.inc

PREREQUISITES := $(HOMEDIR)/runAnalysis/results Makefile

all: shortStroke longStroke plots/aveTempPlot.eps fftPlots
	$(MAKE) -C plots

TSHORT := thermalShortStroke.m
TLONG  := thermalLongStroke.m

SHORTDAT := $(shell grep dat $(TSHORT) | grep plots | $(SINGLEQUOTECUTTER) )
LONGDAT  := $(shell grep dat $(TLONG)  | grep plots | $(SINGLEQUOTECUTTER) )

SHORTTEXFP := $(shell grep filePath $(TSHORT) | head -n 1 | $(SINGLEQUOTECUTTER) )
LONGTEXFP  := $(shell grep filePath $(TLONG)  | head -n 1 | $(SINGLEQUOTECUTTER) )

SHORTTEX   := $(shell grep tex $(TSHORT) | $(SINGLEQUOTECUTTER) )
LONGTEX    := $(shell grep tex $(TLONG)  | $(SINGLEQUOTECUTTER) )

SHORTTEX := $(addprefix $(SHORTTEXFP),$(SHORTTEX))
LONGTEX  := $(addprefix $(LONGTEXFP),$(LONGTEX))

$(SHORTTEX) $(SHORTDAT) shortStroke :  $(TSHORT) $(PREREQUISITES)
	$(OCT) $(TSHORT)
	$(HOMEDIR)/bin/mathify.sh extracted/*


$(LONGTEX) $(LONGDAT)  longStroke  :  $(TLONG) $(PREREQUISITES)
	$(OCT) $(TLONG)
	$(HOMEDIR)/bin/mathify.sh extracted/*

aveTempData/aveTemp : $(HOMEDIR)/data/thermistorData/ avePlots.sh
	./avePlots.sh $(HOMEDIR)/glib/averageThermData.awk $(HOMEDIR)/data/thermistorData/
	touch aveTempData/aveTemp
	
plots/aveTempPlot.eps : aveTempPlot.gpl aveTempData/aveTemp
	$(GNU) aveTempPlot.gpl

#These five calls are very similar, broken out only for parallelism
attr1.dat : aveTempData/aveTemp attr1.m
	$(OCT) attr1.m

attr2.dat : aveTempData/aveTemp attr2.m
	$(OCT) attr2.m

baseP.dat : aveTempData/aveTemp baseP.m
	$(OCT) baseP.m

shorR.dat : aveTempData/aveTemp shorR.m
	$(OCT) shorR.m

rotWa.dat : aveTempData/aveTemp rotWa.m
	$(OCT) rotWa.m

FFTPLOTDATA := run3218LongRedHigh.dat run3217ShortRedHigh.dat run3222LongBlueHigh.dat run3221ShortBlueHigh.dat

$(FFTPLOTDATA):  attr1.dat attr2.dat baseP.dat shorR.dat rotWa.dat tempFFT.m
	$(OCT) tempFFT.m

fftPlots : $(FFTPLOTDATA) makeFFTPlots.gpl
	$(GNU) makeFFTPlots.gpl


clean : 
	-rm plots/*.dat
	-rm extracted/*.tex
	-rm aveTempData/*.dat
	-rm aveTempData/aveTemp
	$(MAKE) -C plots clean

toy : 
	echo $(SHORTTEX)
	echo $(LONGTEX) 
