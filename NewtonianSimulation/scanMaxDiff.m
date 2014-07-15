d = load('SimulationOutput/scans/mergedTorqueOnly.dat');

maxDiff = max(d) - min(d); 

printSI(maxDiff, 2, -6, 'm', 'SimulationOutput/scanMaxDiff.tex'); 
