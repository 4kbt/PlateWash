Eotwash
=======

This repository contains the analysis code needed to generate the PlateWash data analysis and Charlie's thesis.

To use this code: grab it, get the data from Charlie, then find and replace every instance of `~/goldStandard/` in fixed paths _anywhere_ in the code with your repository's root. This should then execute on any linux box running octave (3.6.4) with octave-forge, make, and gnuplot (4.6 patch 3). To compile the thesis, once it's integrated, you'll need LyX. 

The only guaranteed-correct way to execute code is through `make` , not with octave/gnuplot. 

Presently functional: 
6/11/13: Calibration routine works. To execute, enter the calibration directory and `make all`. 
