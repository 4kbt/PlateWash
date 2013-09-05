include ../../Makefile.inc

PREREQUISITES := $(HOMEDIR)/runAnalysis/results

all: shortStroke longStroke
	$(MAKE) -C plots

TSHORT := thermalShortStroke.m
TLONG  := thermalLongStroke.m

LONGDAT  := $(shell grep dat $(TSHORT) | grep plots | $(SINGLEQUOTECUTTER) )
SHORTDAT := $(shell grep dat $(TLONG)  | grep plots | $(SINGLEQUOTECUTTER) )

SHORTTEXFP := $(shell grep filePath $(TSHORT) | head -n 1 | $(SINGLEQUOTECUTTER) )
LONGTEXFP  := $(shell grep filePath $(TLONG)  | head -n 1 | $(SINGLEQUOTECUTTER) )

SHORTTEX   := $(shell grep tex $(TSHORT) | $(SINGLEQUOTECUTTER) )
LONGTEX    := $(shell grep tex $(TLONG)  | $(SINGLEQUOTECUTTER) )

SHORTTEX := $(addprefix $(SHORTTEXFP),$(SHORTTEX))
LONGTEX  := $(addprefix $(LONGTEXFP),$(LONGTEX))

$(SHORTTEX) $(SHORTDAT) shortStroke :  thermalShortStroke.m $(PREREQUISITES)
	$(OCT) thermalShortStroke.m

$(LONGTEX) $(LONGDAT)  longStroke  :  thermalLongStroke.m $(PREREQUISITES)
	$(OCT) thermalLongStroke.m

clean : 
	-rm plots/*.dat
	-rm extracted/*.tex
	$(MAKE) -C plots clean

toy : 
	echo $(SHORTTEX)
	echo $(LONGTEX) 
