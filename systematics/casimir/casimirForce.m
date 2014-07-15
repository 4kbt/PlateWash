fundamentalConstants

run3147PendulumParameters

closestApproach = 80e-6; printSI(closestApproach, 2, -6, 'm', [HOMEDIR 'extracted/casimirClosestApproach.tex']);

CasimirPressure = hbarJ*c*pi^2/240/(closestApproach)^4; printSI(CasimirPressure , 2, -12, 'Pa', [HOMEDIR 'extracted/casimirPressure.tex']); 

YukawaPressure = 2*pi * G * 16000^2 * 50e-6^2; printSI(YukawaPressure, 2, -12, 'pPa', [HOMEDIR  'extracted/yukawaPressureCasimirComparison.tex']);

