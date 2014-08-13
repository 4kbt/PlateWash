
PRESD := pressureDiagram.png
ANAD  := analysisDiagram.png
DIA   := plateWash.dia
OVR   := overview.dia
TOPVIEW := fullAssemblyHorizontal2014

all: $(PRESD) $(ANAD) $(TOPVIEW)Small.pdf

$(PRESD) : $(DIA)
	dia -L 1 -s 1200x $(DIA)  -t png -e $@

$(ANAD) : $(OVR)
	dia -s 1200x $(OVR) -t png -e $@

$(TOPVIEW)Small.pdf : $(TOPVIEW).pdf
	pdfcrop --margins '0 0 0 -200' $< $@
