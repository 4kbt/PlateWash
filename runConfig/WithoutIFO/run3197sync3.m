pwrunNumber  = '3197'
psrunNumber  = '3195';
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

%Magnetic systematics (red on Left)
pwData(:,magFieldCol) = 0.8;
pwData(:,magField2Col) = 0.8^2;
