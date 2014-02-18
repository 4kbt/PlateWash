d = load('SimulationOutput/scans/mergedTorqueOnly.dat');

maxDiff = max(d) - min(d); 

printSigNumber(maxDiff, 'SimulationOutput/scanMaxDiff.tex', 2); 
