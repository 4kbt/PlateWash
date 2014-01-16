include ../Makefile.inc

all : therm mag resist elec press

mag: 
	$(MAKE)  $(PARALLEL) -C magnetic

therm: 
	$(MAKE)  $(PARALLEL) -C thermal

resist: 
	$(MAKE)  $(PARALLEL) -C resistor

elec :
	$(MAKE)  $(PARALLEL) -C electrical

press:
	$(MAKE)  $(PARALLEL) -C pressure


clean:
	$(MAKE) -C magnetic clean
	$(MAKE) -C thermal clean
	$(MAKE) -C resistor clean
	$(MAKE) -C electrical clean
	$(MAKE) -C pressure clean
	
