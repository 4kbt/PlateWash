pwrunNumber  = '3204'
psrunNumber  = '3204';
iforunNumber = '3138';

preSync3


%psStartSec  = psStartSec+9*128;
%psEndSec    = psEndSec-100;
%psEndSec    = psEndSec - 86000*.8
%psStartSec  = psStartSec + 141000*.8 
%pwEndSec    = pwStartSec + 219000; 
%pwStartSec  = pwStartSec + 6300;
%ifoEndSec   = ifoStartSec + 16000; 
%ifoStartSec = ifoStartSec + 4100;

sync3

pwData(:,magFieldCol) = 0.8;
pwData(:,magField2Col) = 0.8^2;

