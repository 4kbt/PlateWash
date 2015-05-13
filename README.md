Eotwash
=======

This repository contains the analysis code needed to generate the PlateWash data analysis and Charlie Hagedorn's thesis.

To use this code: clone the repository. Get the data (<= 46 GB) and store it in ~/PWData/ (or alter the root Makefile to point at it). Our group has not yet authorized the release of our data into the wild; if we make it publicly accessible, this file will be updated. Interested parties should contact Charlie Hagedorn ( cah49@uw.edu ) or Jens Gundlach ( gundlach@npl.washington.edu ).

Once installation is complete, executing 'make' in the project directory will do exactly that. The thesis will appear in thesis/thesis.pdf . Execution time for the unblinded code (on an Intel(R) Core(TM) i5-3330 CPU, 8GB RAM) is less than nine days. Bootstrapped simulated annealing is slow. The rest of the code executes in a few hours.

This should execute on any linux box running GNU octave (3.8.2) with octave-forge, GNU make (4.0), LyX (2.1.2), GNU awk (4.1.1), GNU sed (4.2.2), gnuplot (4.6 patch 6), dia (0.97), ImageMagick (6.8.9-9), git (2.1.4), and dpkg (1.17.25).  The octave-forge installation may need to be a Debian one (see path curiosities in initializeOctave.). The reference system is the newly-released Debian Jessie, which went stable the day after unblinding began. The forthcoming thesis will contain a complete accounting of every package on the unblinding computer.

Because paths are delicately configured, the only correct way to execute code is through `make`, not with octave/gnuplot.  Using make `.INTERACT` will yield a persistent Octave shell (see Makefile.inc) for debugging.  Make is called recursively throughout, so it cannot compute the full dependency graph. The only reliable way to be certain that the result is built as specified is to build it from a clean repository. We welcome your suggestions for a more-usable and bulletproof build arrangment.

This code is not beautiful, but it works. Constructive criticism is especially welcome, especially if you have a patch/pull request or implementation suggestion.

Please consult the LICENSE file for details regarding code reuse.
