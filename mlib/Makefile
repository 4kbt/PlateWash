include ../Makefile.inc

AGGREGATE := testOutput/aggregate.test
testEverything $(AGGREGATE): $(shell ls *.m | sed 's/\.m/\.test/')
	grep failed testOutput/* > $(AGGREGATE)
	$(HOMEDIR)/bin/assert.sh  "`wc $(AGGREGATE) | awk '{print $$1}'` -lt 1" "assert error"
	echo testing   

%.test : %.m 
	$(OCT) --eval "test $*" > testOutput/$@

#This works when you want to match the %.m file exactly
#%.test : %.m 
#       cat $<

clean :
	-rm testOutput/*
