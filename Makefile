thesis : 
	$(MAKE) -C calibration
	$(MAKE) -C runAnalysis
	$(MAKE) -C systematics 

clean:
	$(MAKE) -C calibration clean
	$(MAKE) -C runAnalysis clean
	$(MAKE) -C systematics clean 
