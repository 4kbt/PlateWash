load 'attr1.dat'
load 'attr2.dat'
load 'baseP.dat'
load 'shorR.dat'
load 'rotWa.dat'

run3218sync3

trimAndFFT( overlapStartSec , overlapEndSec, 'run3218LongRedHigh.dat', ...
	 attr1, attr2, baseP, shorR, rotWa);

run3222sync3

trimAndFFT( overlapStartSec , overlapEndSec, 'run3222LongBlueHigh.dat', ...
	 attr1, attr2, baseP, shorR, rotWa);

run3217sync3 

trimAndFFT( overlapStartSec , overlapEndSec, 'run3217ShortRedHigh.dat', ...
	 attr1, attr2, baseP, shorR, rotWa);

run3221sync3 

trimAndFFT( overlapStartSec , overlapEndSec, 'run3221ShortBlueHigh.dat', ...
	 attr1, attr2, baseP, shorR, rotWa);
