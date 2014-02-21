include ../../Makefile.inc

PREREQUISITES := $(HOMEDIR)/runAnalysis/results Makefile

all: shortStroke longStroke
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

aveTemp : $(HOMEDIR)/data/thermistorData/ avePlots.sh
	./avePlots.sh $(HOMEDIR)/glib/averageThermData.awk $(HOMEDIR)/data/thermistorData/
	
	


clean : 
	-rm plots/*.dat
	-rm extracted/*.tex
	-rm aveTempData/*.dat
	$(MAKE) -C plots clean

toy : 
	echo $(SHORTTEX)
	echo $(LONGTEX) 
