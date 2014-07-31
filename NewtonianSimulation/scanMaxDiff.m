d = load('SimulationOutput/scans/mergedTorqueOnly.dat');

maxDiff = max(d) - min(d); 

printSI(maxDiff, 1, -15, 'N-m', 'SimulationOutput/scanMaxDiff.tex'); 
