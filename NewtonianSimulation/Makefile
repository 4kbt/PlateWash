include ../Makefile.inc

OCT := $(OCT) -p $(HOMEDIR)/mlib/gravity/ -p parts/

PARTS := parts/

MASSES=jan13Attractor.m jan13Pendulum.m

all: plots/brickDemo.eps bellowsTorque plots/fullSimulation.eps

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
	$(GNU) 

SimulationOutput/%.dat : $(MLIB) $(PARTS) defineAttractorTranslation.m processAttractorComponent.m
	$(OCT) --eval 'attractors = {"$(*F)"}' processAttractorComponent.m
	$(HOMEDIR)/bin/mathify.sh SimulationOutput/*.tex

SDIR = SimulationOutput/

plots/fullSimulation.eps: fullSimulation.gpl\
				$(SDIR)jan13ScrewGaps.dat\
				$(SDIR)jan13Spindles.dat\
				$(SDIR)jan13Attractor.dat\
				$(SDIR)jan13OffsetAttractor.dat
	$(GNU) fullSimulation.gpl


clean :
	-rm SimulationOutput/*.dat
	-rm SimulationOutput/*.tex
