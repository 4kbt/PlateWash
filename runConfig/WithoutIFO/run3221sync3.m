pwrunNumber  = '3221'
psrunNumber  = '3219';
iforunNumber = '3138';

preSync3

%psStartSec  = pwStartSec+271;
%psEndSec    = psEndSec-100;
%psEndSec    = psEndSec - 86000*.8
%psStartSec  = psStartSec + 2431 
%pwEndSec    = pwStartSec + 219000; 
%pwStartSec  = pwStartSec + 6300;
%ifoEndSec   = ifoStartSec + 16000; 
%ifoStartSec = ifoStartSec + 4100;

sync3

pwData(:,temperatureCol) = 0.2;
pwData(:,tempGradientCol) = -0.05;
