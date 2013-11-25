Eotwash
=======

This repository contains the analysis code needed to generate the PlateWash data analysis and Charlie's thesis.

To use this code: clone the repository. Then, get the data from Charlie, and store it in ~/PWData/ (or alter the root Makefile to point at it).

Once installation is complete, executing 'make' in the project directory will do exactly that. The thesis will appear in thesis/thesis.pdf . Present execution time on Charlie's computer (using 3 out of 4 cores at 3 GHz) is 98 minutes.

This should execute on any linux box running GNU octave (3.6.4) with octave-forge, GNU make (3.81), LyX (2.0.6), GNU awk (4.0.1), GNU sed (4.2.2), and gnuplot (4.6 patch 4). The octave-forge installation may need to be a Debian one (see path curiosities in initializeOctave.). 

The only correct way to execute code is through `make`, not with octave/gnuplot.  Using make `.INTERACT` will yield a persistent shell (see Makefile.inc) for debugging. 

Presently functional (incomplete list): 

* Calibration

* Run analysis of the science data set

* Bootstrapped fitting of yukawa potentials and of arbitrary forms.

* Newtonian simulation code is present, works. WashCycle branch does computations for Matt, Krishna, and Will.

* Thesis generation. 'make dissertation' is functional.

* Systematics are partially handled. Magnetic, Thermal, Electrical, etc. are working.
