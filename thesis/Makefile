include ../Makefile.inc

EXTRACTEDDEPS := $(shell grep filename thesis.lyx | awk '{print $$2}' | sed 's/\"//g')

#Goes hunting for all directories named extracted, points at all tex files within them.
KNOWNEXTRACTED := $(shell find ../ -type d | grep extracted)
KNOWNEXTRACTED := $(addsuffix /*.tex, $(KNOWNEXTRACTED))

#These three variables go together to mine eps filenames out of higher directory makefiles
DEEPMAKES := $(shell find `pwd`/plots/ `pwd`/Pictures `pwd`/diagrams/ -name Makefile)
PWD := $(shell pwd)
EPSTARGETS := $(shell grep eps  $(DEEPMAKES) | awk '{print $$1}' \
		| grep eps | sed 's/Makefile://g'| sed 's/://g' \
		| sed "s|$(PWD)/||g")

PNGTARGETS := $(shell grep png  $(DEEPMAKES) | awk '{print $$1}' \
		| grep png | sed 's/Makefile://g'| sed 's/://g' \
		| sed "s|$(PWD)/||g") 

PLOTTARGETS := $(EPSTARGETS) $(PNGTARGETS)


thesis.pdf : thesis.lyx $(EXTRACTEDDEPS) thesis.bib gitOut.txt
	$(OCT) ../globalConfig/run3147FixedParameters.m
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*
	$(HOMEDIR)/bin/mathify.sh $(KNOWNEXTRACTED) 
	$(LYX) thesis.lyx
	date > buildDate.txt

$(PLOTTARGETS) :
	$(MAKE) -C diagrams
	$(MAKE) -C plots
	$(MAKE) $(PARALLEL) -C Pictures

gitOut.txt:
	git show --summary > $@

test:
	echo $(DEEPMAKES)
	echo $(PLOTTARGETS)
	echo $(KNOWNEXTRACTED)



clean : 
	-rm *.pdf
	-rm *.lyx~
	-rm *.lyx.emergency
	-rm *.aux
	-rm *.bib.bak
	-rm *.log
	$(MAKE) clean -C plots 
