fundamentalConstants

run3147PendulumParameters

closestApproach = 80e-6; printSigNumber(closestApproach, [HOMEDIR 'extracted/casimirClosestApproach.tex'], 2);

CasimirPressure = hbarJ*c*pi^2/240/(closestApproach)^4; printSigNumber(CasimirPressure , [HOMEDIR 'extracted/casimirPressure.tex'], 2); 

YukawaPressure = 2*pi * G * 16000^2 * 50e-6^2; printSigNumber(YukawaPressure, [HOMEDIR  'extracted/yukawaPressureCasimirComparison.tex'],2);

