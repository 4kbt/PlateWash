include ../Makefile.inc

AGGREGATE := testOutput/aggregate.test
testEverything $(AGGREGATE): $(shell ls *.m | sed 's/\.m/\.test/')
	-rm testOutput/aggregate.test
	#The below is a dangerous, but apparently functional, usage of the minus-sign operator.
	-grep failed testOutput/* > $(AGGREGATE)
	$(if $(shell cat $(AGGREGATE)),	$(HOMEDIR)/bin/assert.sh  "`wc $(AGGREGATE) | awk '{print $$1}'` -lt 1" "assert error")
	echo testing

%.test : %.m 
	$(OCT) --eval "test $*" > testOutput/$@

#This works when you want to match the %.m file exactly
#%.test : %.m 
#       cat $<

clean :
	-rm testOutput/*
