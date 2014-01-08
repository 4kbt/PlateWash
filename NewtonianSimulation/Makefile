include ../Makefile.inc

OCT := $(OCT) -p $(HOMEDIR)/mlib/gravity/ -p parts/

MASSES=jan13Attractor.m jan13Pendulum.m

all: simulation plots/brickDemo.eps

plots/brickDemo.eps : $(MLIB) brickDemo.m brickDemo.gpl
	$(OCT) brickDemo.m
	$(GNU) brickDemo.gpl

washCycleBrick: $(MLIB)
	$(OCT) washCycleDemo.m

tiltmeterQTester: $(MLIB)
	$(OCT) tiltmeterDemo.m

spinCalibration: $(MLIB)
	$(OCT) spinPendulumDemo.m

# Non-infinite torque
simulation : $(MLIB) processRun.m
	$(OCT) processRun.m

clean :
	-rm SimulationOutput/*.dat
