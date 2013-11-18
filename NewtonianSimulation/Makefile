include ../Makefile.inc

OCT := $(OCT) -p $(HOMEDIR)/mlib/gravity/ -p parts/

MASSES=jan13Attractor.m jan13Pendulum.m

brick : 
	$(OCT) brickDemo.m

truck :
	$(OCT) --persist tiltmeterTruck.m 

washCycleBrick:
	$(OCT) washCycleDemo.m

tiltmeterQTester:
	$(OCT) tiltmeterDemo.m

spinCalibration:
	$(OCT) spinPendulumDemo.m

face:
	$(OCT) faceDemo.m

# Non-infinite torque
simulation : 
	$(OCT) processRun.m
