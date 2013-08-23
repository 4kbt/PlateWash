include ../Makefile.inc

OCT := $(OCT) -p $(HOMEDIR)/mlib/gravity/ -p parts/

MASSES=jan13Attractor.m jan13Pendulum.m

brick : 
	$(OCT) brickDemo.m

washCycleBrick:
	$(OCT) washCycleDemo.m

tiltmeterQTester:
	$(OCT) tiltmeterDemo.m

# Non-infinite torque
simulation : 
	$(OCT) processRun.m
