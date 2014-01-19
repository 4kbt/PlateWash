include Makefile.inc

CURRENTDIR := $(shell pwd)
PATHINJECT := tmp/pathinject

dissertation: gitlog.log
	#Make a gnuplot column index
	$(shell grep Col     globalConfig/run3147FixedParameters.m | sed '/\%/d' >   glib/gnuplotColumns.gpl)
	$(shell grep Sensors globalConfig/run3147FixedParameters.m | sed '/\%/d' >>  glib/gnuplotColumns.gpl)
	$(shell grep Col mlib/preSync3.m  | head -n 3               | sed '/\%/d' >> glib/gnuplotColumns.gpl)
	#There's a better way than the head command in the preceding line... 
	$(if $(shell ls data), ,$(shell ln -s /mnt/ssd/PWData/ data))
	$(shell bin/countXXXs.sh thesis/thesis.lyx >> data/xxxCount.dat)
	$(shell sed -i  "s|HOMEDIR := .*|HOMEDIR := $(CURRENTDIR)/|" Makefile.inc)
	$(MAKE) $(PARALLEL) -C mlib
	$(MAKE) $(PARALLEL) -C NewtonianSimulation
	$(MAKE) $(PARALLEL) -C calibration
	$(MAKE) $(PARALLEL) -C runAnalysis
	$(MAKE) $(PARALLEL) -C systematics 
	$(MAKE) $(PARALLEL) -C bootstrap
	$(MAKE) $(PARALLEL) -C ifo
	$(MAKE) -C thesis 

gitlog.log: 
	git log > gitlog.log

clean:
	$(MAKE) -C mlib clean
	$(MAKE) -C calibration clean
	$(MAKE) -C runAnalysis clean
	$(MAKE) -C systematics clean 
	$(MAKE) -C bootstrap clean 
	$(MAKE) -C NewtonianSimulation clean
	$(MAKE) -C thesis clean 
