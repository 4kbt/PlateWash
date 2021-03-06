%This would be an octaverc file somewhere, if not for various path handling bugs
%Debian's octave packaging arrives as a system-wide octaverc file, which 
%pre-empts any octave -p calls at the command line.

HOMEDIR

setenv("HOMEDIR", HOMEDIR);

warning off Octave:possible-matlab-short-circuit-operator

graphics_toolkit("gnuplot");

tpath = [HOMEDIR '/mlib/'];
addpath(genpath(tpath));

tpath = [HOMEDIR '/runConfig/'];
addpath(genpath(tpath));

tpath = [HOMEDIR '/simulatedData/'];
addpath(tpath);

tpath = [HOMEDIR '/globalConfig/'];
addpath(genpath(tpath));
