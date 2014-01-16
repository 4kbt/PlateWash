include ../Makefile.inc

all : therm mag resist elec press foil scans

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

foil: 
	$(MAKE)  $(PARALLEL) -C foil

scans:
	$(MAKE)  $(PARALLEL) -C microscopeScans

clean:
	$(MAKE) -C magnetic clean
	$(MAKE) -C thermal clean
	$(MAKE) -C resistor clean
	$(MAKE) -C electrical clean
	$(MAKE) -C pressure clean
	
