all: tenFewerMerge.dat unblindedMerge.dat

tenFewerMerge.dat: TenFewerData stripHeaderFooterAndMerge.sh
	./stripHeaderFooterAndMerge.sh TenFewerData tenFewerMerge.dat

unblindedMerge.dat: Unblinded stripHeaderFooterAndMerge.sh
	./stripHeaderFooterAndMerge.sh Unblinded unblindedMerge.dat
