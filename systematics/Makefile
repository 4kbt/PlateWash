include ../Makefile.inc

all : therm mag resist elec press foilTarg scans casimirComp

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

foilTarg: 
	$(MAKE)  $(PARALLEL) -C foil

scans:
	$(MAKE)  $(PARALLEL) -C microscopeScans

casimirComp:
	$(MAKE)  $(PARALLEL) -C casimir


clean:
	$(MAKE) -C magnetic clean
	$(MAKE) -C thermal clean
	$(MAKE) -C resistor clean
	$(MAKE) -C electrical clean
	$(MAKE) -C pressure clean
	$(MAKE) -C casimir clean
	
