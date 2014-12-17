run3147FixedParameters

rootDir = HOMEDIR;
subDir = '/data/';
runPrefix = [ ' = fopen("' rootDir subDir 'run']

eval([ 'pwHeaderFile' runPrefix pwrunNumber  'pw.hdr" , "rt");'] ) ;
pwLoadHdr;
eval([    'pwDatFile' runPrefix pwrunNumber  'pw.dta" , "r", "ieee-le");'] ) ;
pwLoadBin;
eval([ 'psHeaderFile' runPrefix psrunNumber  'ps.hdr" , "rt");'] ) ;
psLoadHdr;
eval([    'psDatFile' runPrefix psrunNumber  'ps.dta" , "r", "ieee-le");'] ) ;
psLoadBin;
eval(['ifoHeaderFile' runPrefix iforunNumber 'ifo.dat", "rt");'] ) ;
ifoLoadData;

%Clock corrections
pwData(:,pwTimeCol) = pwData(:,pwTimeCol) + pwStartSec;
psData(:,psTimeCol) = psData(:,psTimeCol) + psStartSec;


FAKING_THE_PLATEWASH_CLOCK = 0  

if(FAKING_THE_PLATEWASH_CLOCK == 1)
	pwData = pwData(318190:end,:);
	pwData(:,pwTimeCol) = pwData(:,pwTimeCol) + 2**32/1000.0;
%	pwData( pwData(:, pwTimeCol) > 8e6, pwTimeCol) = 0 ; 
end

%why the -1? 11/15/2014
pwEndSec  = pwData(rows( pwData) - 1,  pwTimeCol);
psEndSec  = psData(rows( psData),  psTimeCol);
ifoEndSec = ifoData(rows(ifoData), ifoTimeCol);

%PW clock roll correction
if( pwEndSec < pwStartSec)
	PLATEWASH_CLOCK_ROLLED_____MIGHT_BE_A_TIMING_ERROR = 1
	pause
	pwClockFlipIndex = find(  pwData(:,pwTimeCol) < pwStartSec) (1);

	pwData( pwClockFlipIndex:end, pwTimeCol) = pwData(pwClockFlipIndex:end,pwTimeCol) + 2^32/1000.0;
	pwEndSec  = pwData(rows( pwData),  pwTimeCol);
end

%PS clock roll correction
if( psEndSec < psStartSec)
	PLATESLAVE_CLOCK_ROLLED = 1
	psClockFlipIndex = find(  psData(:,psTimeCol) < psStartSec) (1);

	psData( psClockFlipIndex:end, psTimeCol) = psData(psClockFlipIndex:end,psTimeCol) + 2^32/1000.0;
	psEndSec  = psData(rows( psData),  psTimeCol);
end

%Absolute clock rate corrections
if(exist('applyClockCorrections'))
        %Correct clocks
        pwWinClockErr = load('results/pwWindowsClockRateError.dat');
        pwData(:,pwTimeCol) = pwData(:,pwTimeCol) + (pwData(:,pwTimeCol) - pwData(1,pwTimeCol))*pwWinClockErr(1);
        psWinClockErr = load('results/psWindowsClockRateError.dat');
        psData(:,psTimeCol) = psData(:,psTimeCol) + (psData(:,psTimeCol) - psData(1,psTimeCol))*psWinClockErr(1);
end


%Preserve run-timing info
if( exist( "pwHdrEndSec" ))
	pwTimeInfo = [pwStartSec pwEndSec pwHdrEndSec rows(pwData)];
end
if( exist( "psHdrEndSec" ))
	psTimeInfo = [psStartSec psEndSec psHdrEndSec rows(psData)];
end

if(~exist('FAKING_THE_INTERFEROMETER_ENTIRELY'))
	FAKING_THE_INTERFEROMETER_ENTIRELY = 1
end

if( FAKING_THE_INTERFEROMETER_ENTIRELY == 1)
	ifoData = zeros(rows(pwData), columns(ifoData));
	ifoData(:, ifoTimeCol) = pwData(:,pwTimeCol);

	ifoStartSec = pwStartSec;
	ifoEndSec   = pwEndSec;
end

psRawTimeDiff = diff(psData(:,psTimeCol));
pwRawTimeDiff = diff(pwData(:,pwTimeCol));
ifoRawTimeDiff = diff(ifoData(:,ifoTimeCol));

