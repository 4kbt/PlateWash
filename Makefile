include Makefile.inc

thesis : 
	$(MAKE) -C calibration
	$(MAKE) -C runAnalysis
	$(MAKE) -C systematics 
	$(MAKE) -C bootstrap 

clean:
	$(MAKE) -C calibration clean
	$(MAKE) -C runAnalysis clean
	$(MAKE) -C systematics clean 
	$(MAKE) -C bootstrap clean 
