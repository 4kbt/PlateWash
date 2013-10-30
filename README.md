Eotwash
=======

This repository contains the analysis code needed to generate the PlateWash data analysis and Charlie's thesis.

To use this code: pull the code, get the data from Charlie, symlink the data directory to 'data/' in the project root, and then find and replace every instance of `~/goldStandard/` in fixed paths _anywhere_ in the code with your repository's root. There should be only one, but there may be more.

Once installation is complete, executing 'make dissertation' in the project directory will do exactly that. The thesis will appear in thesis/thesis.pdf . Present execution time on Charlie's computer is about three hours.

This should execute on any linux box running octave (3.6.4) with octave-forge, GNU make 3.81, LyX (2.0.6), and gnuplot (4.6 patch 3). The octave-forge installation may need to be a Debian one (see path curiosities in initializeOctave.). 

The only correct way to execute code is through `make`, not with octave/gnuplot.  Using make .INTERACT will yield a persistent shell (see Makefile.inc) for debugging. 

Presently functional (incomplete list): 

* Calibration

* Run analysis of the science data set

* Bootstrapped fitting of yukawa potentials and of arbitrary forms.

* Newtonian simulation code is present, works. WashCycle branch does computations for Matt, Krishna, and Will.

* Thesis generation. 'make dissertation' is functional.
