include ../Makefile.inc


#depends on calibration, everything in mlib
analysis : run3147processAll2.m
	$(OCT) run3147processAll2.m
	./run3147pLDAFilterMerge.sh

path : 
	$(OCT) --verbose pathTest.m
