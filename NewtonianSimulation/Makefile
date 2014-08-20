include ../Makefile.inc

OCT := $(OCT) -p $(HOMEDIR)/mlib/gravity/ -p parts/

PARTS := parts/

MASSES=jan13Attractor.m jan13Pendulum.m

SDIR := SimulationOutput

all: plots/brickDemo.eps bellowsTorque plots/fullSimulation.eps plots/pmScanPlot.eps plots/offsetAttractorAssembly.eps $(SDIR)/scanMaxDiff.tex plots/fullDistribution.eps

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


#This command must precede the $(SDIR)/%dat make, lest confusion result. May change with Make 3.82.
$(SDIR)/scans/%.dat :  $(MLIB) $(PARTS) defineAttractorTranslation.m processAttractorComponent.m
	$(OCT) --eval 'outPath = "$(@D)"; attractors = {"$(*F)"}; scatterMasses = 1; randomAttractorRotate = 1; P = pendulumPMScan;' processAttractorComponent.m
	$(HOMEDIR)/bin/mathify.sh SimulationOutput/*.tex

$(SDIR)/%.dat : $(MLIB) $(PARTS) defineAttractorTranslation.m processAttractorComponent.m
	$(OCT) --eval 'outPath = "$(@D)"; attractors = {"$(*F)"}; P = jan13Pendulum;' processAttractorComponent.m
	$(HOMEDIR)/bin/mathify.sh SimulationOutput/*.tex


plots/fullSimulation.eps: $(BIN) fullSimulation.gpl $(HOMEDIR)/extracted/pendulumBodyThickness.tex\
				$(SDIR)/jan13ScrewGaps.dat\
				$(SDIR)/jan13Spindles.dat\
				$(SDIR)/jan13Attractor.dat\
				$(SDIR)/jan14MacorSpindles.dat\
				$(SDIR)/jan14SpindlePlate.dat\
				$(SDIR)/jan14Flexure.dat\
				$(SDIR)/fullAttractor.dat\
				$(SDIR)/nonAttractor.dat
	$(GNU) fullSimulation.gpl

plots/fullDistribution.eps plots/fullDistributionZoomOutTrim.eps: plots/fullSimulation.eps plotFullDistribution.gpl
	$(GNU) plotFullDistribution.gpl
	epstool --copy --bbox plots/fullDistributionZoomOut.eps plots/fullDistributionZoomOutTrim.eps

plots/offsetAttractorAssembly.eps: $(BIN) offsetAttractorAssembly.gpl $(HOMEDIR)/extracted/pendulumBodyThickness.tex\
				$(SDIR)/jan13OffsetAttractor.dat
	$(GNU) offsetAttractorAssembly.gpl

MERGEFILE:=$(SDIR)/scans/scanMerge.dat

$(MERGEFILE) : mergeScanComputations.sh\
				$(SDIR)/scans/attractorPMScan1.dat\
				$(SDIR)/scans/attractorPMScan2.dat\
				$(SDIR)/scans/attractorPMScan3.dat\
				$(SDIR)/scans/attractorPMScan4.dat\
				$(SDIR)/scans/attractorPMScan5.dat\
				$(SDIR)/scans/attractorPMScan6.dat\
				$(SDIR)/scans/attractorPMScan7.dat\
				$(SDIR)/scans/attractorPMScan8.dat\
				$(SDIR)/scans/attractorPMScan9.dat
	./mergeScanComputations.sh

$(SDIR)/scanMaxDiff.tex : scanMaxDiff.m $(MERGEFILE)
# $(SDIR)/scans/scanMerge.dat
	sed '/^\#/d' $(MERGEFILE) | awk '{print $$13}' > $(SDIR)/scans/mergedTorqueOnly.dat
	$(HOMEDIR)/bin/whiteLineStrip.sh $(SDIR)/scans/mergedTorqueOnly.dat
	$(OCT) scanMaxDiff.m
	$(HOMEDIR)/bin/mathify.sh SimulationOutput/*.tex

plots/pmScanPlot.eps : pmScanPlot.gpl $(SDIR)/scans/scanMerge.dat
	$(GNU) pmScanPlot.gpl

$(HOMEDIR)/extracted/%.tex : $(MLIB)
	$(OCT) $(HOMEDIR)/globalConfig/run3147FixedParameters.m
	$(OCT) $(HOMEDIR)/globalConfig/run3147PendulumParameters.m

clean :
	-rm SimulationOutput/*.dat
	-rm SimulationOutput/scans/*.dat
	-rm SimulationOutput/*.tex
	-rm plots/*.eps
