all : therm mag resist elec press

mag: 
	$(MAKE)  -j 3 -C magnetic

therm: 
	$(MAKE)  -j 3 -C thermal

resist: 
	$(MAKE)  -j 3 -C resistor

elec :
	$(MAKE)  -j 3 -C electrical

press:
	$(MAKE)  -j 3 -C pressure


clean:
	$(MAKE) -C magnetic clean
	$(MAKE) -C thermal clean
	$(MAKE) -C resistor clean
	$(MAKE) -C electrical clean
	$(MAKE) -C pressure clean
	
