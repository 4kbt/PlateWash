include ../Makefile.inc

FILTRESULTS := $(shell ls -d -1 results/*Filter.dat )
ONLYRESULTS := $(shell ls -d -1 results/*FilterOnly.dat )

RAWRESULTS := $(FILTRESULTS) $(ONLYRESULTS)

#Spelled out this way in hopes of parallelizing someday. Apologies for the complexity
#Science runs:
SCIA="--eval 'nameCtr = 3147;'"
SCIB="--eval 'nameCtr = 3148;'"
SCIC="--eval 'nameCtr = 3149;'"
SCID="--eval 'nameCtr = 3150;'"
SCIE="--eval 'nameCtr = 3151;'"
SCIF="--eval 'nameCtr = 3152;'"
SCIG="--eval 'nameCtr = 3153;'"
SCIH="--eval 'nameCtr = 3154;'"
SCII="--eval 'nameCtr = 3155;'"
#SCIJ="--eval 'nameCtr = 3156;'"
SCIK="--eval 'nameCtr = 3157;'"
SCIL="--eval 'nameCtr = 3158;'"
SCIM="--eval 'nameCtr = 3159;'"
SCIN="--eval 'nameCtr = 3160;'"
SCIO="--eval 'nameCtr = 3161;'"
SCIP="--eval 'nameCtr = 3162;'"
SCIQ="--eval 'nameCtr = 3163;'"
SCIR="--eval 'nameCtr = 3164;'"
#SCIS="--eval 'nameCtr = 3165;'"
SCIT="--eval 'nameCtr = 3166;'"

#Magnetic runs, coil on can, short stroke
MAGA="--eval 'nameCtr = 3203;'"
MAGB="--eval 'nameCtr = 3204;'"
MAGC="--eval 'nameCtr = 3205;'"

#Magnetic runs, coil on can, long stroke
MAGD="--eval 'nameCtr = 3197;'"

#Thermal runs 
THRA="--eval 'nameCtr = 3215;'"
THRB="--eval 'nameCtr = 3217;'"
THRC="--eval 'nameCtr = 3218;'"

#depends on calibration, everything in mlib
#analysis -$(RESULTS) : run3147processAll2.m ../calibration/
#	$(OCT) run3147processAll2.m
#	./run3147pLDAFiltermerge.sh

ANALYSISDEPS := analyzeRun.m ../calibration/ ../mlib/ ../globalConfig

all: results/run3147pM3FilterMerge.dat
	echo $(RAWRESULTS)
	$(MAKE) -C supportingPlots

#Spelled out this way in hopes of parallelizing someday. Apologies for the complexity
runs -$(RAWRESULTS) : $(ANALYSISDEPS)
	echo $(DEPS)
	-rm listOfRuns.dat
	echo $(SCIA) >> listOfRuns.dat
	echo $(SCIB) >> listOfRuns.dat
	echo $(SCIC) >> listOfRuns.dat
	echo $(SCID) >> listOfRuns.dat
	echo $(SCIE) >> listOfRuns.dat
	echo $(SCIF) >> listOfRuns.dat
	echo $(SCIG) >> listOfRuns.dat
	echo $(SCIH) >> listOfRuns.dat
	echo $(SCII) >> listOfRuns.dat
#	echo $(SCIJ) >> listOfRuns.dat
	echo $(SCIK) >> listOfRuns.dat
	echo $(SCIL) >> listOfRuns.dat
	echo $(SCIM) >> listOfRuns.dat
	echo $(SCIN) >> listOfRuns.dat
	echo $(SCIO) >> listOfRuns.dat
	echo $(SCIP) >> listOfRuns.dat
	echo $(SCIQ) >> listOfRuns.dat
	echo $(SCIR) >> listOfRuns.dat
#	echo $(SCIS) >> listOfRuns.dat
	echo $(SCIT) >> listOfRuns.dat
	echo $(MAGA) >> listOfRuns.dat
	echo $(MAGB) >> listOfRuns.dat
	echo $(MAGC) >> listOfRuns.dat
	echo $(MAGD) >> listOfRuns.dat
	echo $(THRA) >> listOfRuns.dat
	echo $(THRB) >> listOfRuns.dat
	echo $(THRC) >> listOfRuns.dat
	parallel -v -q -a listOfRuns.dat --load 3 bash -c $(OCT) {} analyzeRun.m

#The following empty assignment is meaningful.
NOFILES := 

ifeq ( $(strip  $(RAWRESULTS)), $(NOFILES) )
 DEPS := runs
else
 DEPS := $(RAWRESULTS)
endif

results/run3147pM3FilterMerge.dat : $(DEPS) run3147pLDAFiltermerge.sh
	echo $(DEPS)
	./run3147pLDAFiltermerge.sh

path : 
	$(OCT) --verbose pathTest.m

clean :
	-rm results/*.dat
	$(MAKE) -C supportingPlots clean
