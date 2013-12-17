all : therm mag resist elec press

mag: 
	$(MAKE) -C -j 3 magnetic

therm: 
	$(MAKE) -C -j 3 thermal

resist: 
	$(MAKE) -C -j 3 resistor

elec :
	$(MAKE) -C -j 3 electrical

press:
	$(MAKE) -C -j 3 pressure


clean:
	$(MAKE) -C magnetic clean
	$(MAKE) -C thermal clean
	$(MAKE) -C resistor clean
	$(MAKE) -C electrical clean
	$(MAKE) -C pressure clean
	
