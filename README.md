Eotwash
=======

This repository contains the analysis code needed to generate the PlateWash data analysis and Charlie's thesis.

To use this code: grab it, get the data from Charlie, then find and replace every instance of `~/goldStandard/` in fixed paths _anywhere_ in the code with your repository's root. There should be only one, but there may be more.

This should then execute on any linux box running octave (3.6.4) with octave-forge, GNU make 3.81, and gnuplot (4.6 patch 3). The octave-forge installation may need to be a Debian one (see path curiosities in initializeOctave.m) To compile the thesis, once it's integrated, you'll need LyX. 

The only guaranteed-correct way to execute code is through `make` , not with octave/gnuplot. 

Presently functional: 

* Calibration

* Run analysis of the science data set

* Bootstrapped fitting of yukawa potentials and of arbitrary forms.

* Newtonian simulation code is present, works. WashCycle branch does computations for Matt and Krishna.


