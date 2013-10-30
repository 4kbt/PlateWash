include ../Makefile.inc

RESULTS := $(shell ls -d -1 results/* )

#Spelled out this way in hopes of parallelizing someday. Apologies for the complexity
#Science runs:
SCIA=--eval 'nameCtr = 3147;'
SCIB=--eval 'nameCtr = 3148;'
SCIC=--eval 'nameCtr = 3149;'
SCID=--eval 'nameCtr = 3150;'
SCIE=--eval 'nameCtr = 3151;'
SCIF=--eval 'nameCtr = 3152;'
SCIG=--eval 'nameCtr = 3153;'
SCIH=--eval 'nameCtr = 3154;'
SCII=--eval 'nameCtr = 3155;'
#SCIJ=--eval 'nameCtr = 3156;'
SCIK=--eval 'nameCtr = 3157;'
SCIL=--eval 'nameCtr = 3158;'
SCIM=--eval 'nameCtr = 3159;'
SCIN=--eval 'nameCtr = 3160;'
SCIO=--eval 'nameCtr = 3161;'
SCIP=--eval 'nameCtr = 3162;'
SCIQ=--eval 'nameCtr = 3163;'
SCIR=--eval 'nameCtr = 3164;'
#SCIS=--eval 'nameCtr = 3165;'
SCIT=--eval 'nameCtr = 3166;'

#Magnetic runs, coil on can, short stroke
MAGA=--eval 'nameCtr = 3203;'
MAGB=--eval 'nameCtr = 3204;'
MAGC=--eval 'nameCtr = 3205;'

#Magnetic runs, coil on can, long stroke
MAGD=--eval 'nameCtr = 3197;'

#Thermal runs 
THRA=--eval 'nameCtr = 3215;'
THRB=--eval 'nameCtr = 3217;'
THRC=--eval 'nameCtr = 3218;'

#depends on calibration, everything in mlib
#analysis -$(RESULTS) : run3147processAll2.m ../calibration/
#	$(OCT) run3147processAll2.m
#	./run3147pLDAFiltermerge.sh

ANALYSISDEPS := analyzeRun.m ../calibration/ ../mlib/ ../globalConfig

all: results/run3147pM3FilterMerge.dat
	$(MAKE) -C supportingPlots

#Spelled out this way in hopes of parallelizing someday. Apologies for the complexity
runs -$(RESULTS) : $(ANALYSISDEPS)
	$(OCT) $(SCIA) analyzeRun.m
	$(OCT) $(SCIB) analyzeRun.m
	$(OCT) $(SCIC) analyzeRun.m
	$(OCT) $(SCID) analyzeRun.m
	$(OCT) $(SCIE) analyzeRun.m
	$(OCT) $(SCIF) analyzeRun.m
	$(OCT) $(SCIG) analyzeRun.m
	$(OCT) $(SCIH) analyzeRun.m
	$(OCT) $(SCII) analyzeRun.m
#	$(OCT) $(SCIJ) analyzeRun.m
	$(OCT) $(SCIK) analyzeRun.m
	$(OCT) $(SCIL) analyzeRun.m
	$(OCT) $(SCIM) analyzeRun.m
	$(OCT) $(SCIN) analyzeRun.m
	$(OCT) $(SCIO) analyzeRun.m
	$(OCT) $(SCIP) analyzeRun.m
	$(OCT) $(SCIQ) analyzeRun.m
	$(OCT) $(SCIR) analyzeRun.m
##	$(OCT) $(SCIS) analyzeRun.m
	$(OCT) $(SCIT) analyzeRun.m
	$(OCT) $(MAGA) analyzeRun.m
	$(OCT) $(MAGB) analyzeRun.m
	$(OCT) $(MAGC) analyzeRun.m
	$(OCT) $(MAGD) analyzeRun.m
	$(OCT) $(THRA) analyzeRun.m
	$(OCT) $(THRB) analyzeRun.m
	$(OCT) $(THRC) analyzeRun.m

results/run3147pM3FilterMerge.dat : runs run3147pLDAFiltermerge.sh
	./run3147pLDAFiltermerge.sh

path : 
	$(OCT) --verbose pathTest.m

clean :
	-rm results/*.dat
	$(MAKE) -C supportingPlots clean
