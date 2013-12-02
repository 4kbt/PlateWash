all : therm mag resist elec

mag: 
	$(MAKE) -C magnetic

therm: 
	$(MAKE) -C thermal

resist: 
	$(MAKE) -C resistor

elec :
	$(MAKE) -C electrical


clean:
	$(MAKE) -C magnetic clean
	$(MAKE) -C thermal clean
	$(MAKE) -C resistor clean
	$(MAKE) -C electrical clean
	
