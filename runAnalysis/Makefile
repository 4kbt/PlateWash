include ../Makefile.inc

RESULTS := $(shell ls -d -1 results/* )

#depends on calibration, everything in mlib
#analysis : run3147processAll2.m ../calibration/
analysis -$(RESULTS)  : run3147processAll2.m ../calibration/
	$(OCT) run3147processAll2.m
	./run3147pLDAFilterMerge.sh

path : 
	$(OCT) --verbose pathTest.m
