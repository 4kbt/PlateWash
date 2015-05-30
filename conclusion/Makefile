include ../Makefile.inc

all: absoluteConfidence.eps tenFewerMerge.dat.grav.eps tenFewerMerge.dat.eps unblindedMerge.dat.grav.eps unblindedMerge.dat.eps

tenFewerMerge.dat: TenFewerData stripHeaderFooterAndMerge.sh
	./stripHeaderFooterAndMerge.sh TenFewerData tenFewerMerge.dat

unblindedMerge.dat: Unblinded stripHeaderFooterAndMerge.sh
	./stripHeaderFooterAndMerge.sh Unblinded unblindedMerge.dat

tenFewerMerge.dat.ci tenFewerMerge.dat.cia tenFewerMerge.dat.grav.eps tenFewerMerge.dat.eps unblindedMerge.dat.ci unblindedMerge.dat.cia unblindedMerge.dat.grav.eps unblindedMerge.dat.eps: tenFewerMerge.dat unblindedMerge.dat yukawaSystematicsPlots.sh yukawaSystematicsPlots.gpl
	./yukawaSystematicsPlots.sh $(HOMEDIR)

absoluteConfidence.eps: absoluteConfidence.gpl tenFewerMerge.dat.cia unblindedMerge.dat.cia
	$(GNU) absoluteConfidence.gpl
