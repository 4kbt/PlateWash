
PRESD := pressureDiagram.png
ANAD  := analysisDiagram.png
DIA   := plateWash.dia
OVR   := overview.dia

all: $(PRESD) $(ANAD)

$(PRESD) : $(DIA)
	dia -L 1 -s 1200x $(DIA)  -t png -e $@

$(ANAD) : $(OVR)
	dia -s 1200x $(OVR) -t png -e $@

