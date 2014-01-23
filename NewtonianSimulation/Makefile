include ../Makefile.inc

OCT := $(OCT) -p $(HOMEDIR)/mlib/gravity/ -p parts/

PARTS := parts/

MASSES=jan13Attractor.m jan13Pendulum.m

all: simulation plots/brickDemo.eps bellowsTorque

plots/brickDemo.eps : $(MLIB) brickDemo.m brickDemo.gpl $(PARTS)
	$(OCT) brickDemo.m
	$(GNU) brickDemo.gpl

bellowsTorque: $(MLIB) $(PARTS)
	$(OCT) bellowsTorque.m

washCycleBrick: $(MLIB)
	$(OCT) washCycleDemo.m

tiltmeterQTester: $(MLIB)
	$(OCT) tiltmeterDemo.m

spinCalibration: $(MLIB)
	$(OCT) spinPendulumDemo.m

# Non-infinite torque
simulation : $(MLIB) processRun.m $(PARTS)
	$(OCT) processRun.m

clean :
	-rm SimulationOutput/*.dat
