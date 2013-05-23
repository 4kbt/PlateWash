pwrunNumber  = '3183'
psrunNumber  = '3176';
iforunNumber = '3138';

eval(['pwHeaderFile = fopen("run' pwrunNumber 'pw.hdr","rt")'] ) ;
pwLoadHdr;
eval(['pwDatFile = fopen("run' pwrunNumber 'pw.dta", "r", "ieee-le")'] ) ;
pwLoadBin;
eval(['psHeaderFile = fopen("run' psrunNumber 'ps.hdr","rt")'] ) ;
psLoadHdr;
eval(['psDatFile = fopen("run' psrunNumber 'ps.dta", "r", "ieee-le")'] ) ;
psLoadBin;
eval(['ifoHeaderFile = fopen("run' iforunNumber 'ifo.dat", "rt")'] ) ;
ifoLoadData;


pwTimeCol  = 10;
psTimeCol  = 5 ;
ifoTimeCol = 1 ;



pwData(:,pwTimeCol) = pwData(:,pwTimeCol) + pwStartSec;
psData(:,psTimeCol) = psData(:,psTimeCol) + psStartSec;

FAKING_THE_PLATEWASH_CLOCK = 0  

if(FAKING_THE_PLATEWASH_CLOCK == 1)
	pwData = pwData(318190:end,:);
	pwData(:,pwTimeCol) = pwData(:,pwTimeCol) + 2**32/1000.0;
%	pwData( pwData(:, pwTimeCol) > 8e6, pwTimeCol) = 0 ; 
end


pwEndSec  = pwData(rows( pwData) - 1,  pwTimeCol);
psEndSec  = psData(rows( psData),  psTimeCol);
ifoEndSec = ifoData(rows(ifoData), ifoTimeCol);

if( pwEndSec < pwStartSec)
	PLATEWASH_CLOCK_ROLLED_____MIGHT_BE_A_TIMING_ERROR = 1
	pause
	pwClockFlipIndex = find(  pwData(:,pwTimeCol) < pwStartSec) (1);

	pwData( pwClockFlipIndex:end, pwTimeCol) = pwData(pwClockFlipIndex:end,pwTimeCol) + 2^32/1000.0;
	pwEndSec  = pwData(rows( pwData),  pwTimeCol);
end

if( psEndSec < psStartSec)
	PLATESLAVE_CLOCK_ROLLED = 1
	psClockFlipIndex = find(  psData(:,psTimeCol) < psStartSec) (1);

	psData( psClockFlipIndex:end, psTimeCol) = psData(psClockFlipIndex:end,psTimeCol) + 2^32/1000.0;
	psEndSec  = psData(rows( psData),  psTimeCol);
end
	


FAKING_THE_INTERFEROMETER_ENTIRELY = 1

if( FAKING_THE_INTERFEROMETER_ENTIRELY == 1)
	ifoData = zeros(rows(pwData), columns(ifoData));
	ifoData(:, ifoTimeCol) = pwData(:,pwTimeCol);

	ifoStartSec = pwStartSec;
	ifoEndSec   = pwEndSec;
end



%psStartSec  = pwStartSec+271;
%psEndSec    = psEndSec-100;
%psEndSec    = psEndSec - 86000*.8
%psStartSec  = psStartSec + 2431 
%pwEndSec    = pwStartSec + 219000; 
%pwStartSec  = pwStartSec + 6300;
%ifoEndSec   = ifoStartSec + 16000; 
%ifoStartSec = ifoStartSec + 4100;

starts = [pwStartSec psStartSec ifoStartSec]
stops  = [pwEndSec   psEndSec   ifoEndSec  ]

overlapStartSec = max(starts);
overlapEndSec   = min(stops);


plot(starts, '1-+;starts;', stops, '3-+;stops;');
xlabel('platewash, plateslave, ifo');
ylabel('time (seconds)');

pwSampleTime = median(diff(pwData(:,pwTimeCol)));
psSampleTime = median(diff(psData(:,psTimeCol)));
ifoSampleTime = median(diff(ifoData(:,ifoTimeCol)));

if(abs(pwSampleTime-psSampleTime)>1e-1 | abs(ifoSampleTime - psSampleTime)>1e-1)
	error("Sample Times do not match");
end

%plot(pwData(:,18),pwData(:,18),psData(:,18),psData(:,18),'3')

%if(pwStartSec >= psStartSec)
%
%	pwOverlapStartIndex = find( (pwData(:,pwTimeCol) >= pwStartSec)  ) (1);
%	psOverlapStartIndex = find( (psData(:,psTimeCol) >= pwStartSec) ) (1);
%		
%else
%	
%	psOverlapStartIndex = find( (psData(:,psTimeCol) > psStartSec) ) (1);
%	pwOverlapStartIndex = find( (pwData(:,pwTimeCol) > psStartSec) ) (1);
%end

	psOverlapStartIndex  = find( (psData (:,psTimeCol ) >= overlapStartSec) ) (1);
	pwOverlapStartIndex  = find( (pwData (:,pwTimeCol ) >= overlapStartSec) ) (1);
	ifoOverlapStartIndex = find( (ifoData(:,ifoTimeCol) >= overlapStartSec) ) (1);

	psOverlapEndIndex  = find( (psData (:,psTimeCol ) >= overlapEndSec) ) (1);
	pwOverlapEndIndex  = find( (pwData (:,pwTimeCol ) >= overlapEndSec) ) (1);
	ifoOverlapEndIndex = find( (ifoData(:,ifoTimeCol) >= overlapEndSec) ) (1);

%overlapLength= min([length(psData)-psOverlapStartIndex, length(pwData)-pwOverlapStartIndex]);


%if(pwEndSec <= psEndSec)
%
%	pwOverlapEndIndex = find( (pwData(:,pwTimeCol) >= pwEndSec) ) (1) ;
%	psOverlapEndIndex = find( (psData(:,psTimeCol) >= pwEndSec) ) (1);
%		
%else
%	
%	psOverlapEndIndex = find( (psData(:,psTimeCol) >= psEndSec) ) (1);
%	pwOverlapEndIndex = find( (pwData(:,pwTimeCol) >= psEndSec) ) (1);
%end


pwData  =  pwData(  pwOverlapStartIndex  : pwOverlapEndIndex  , : );
psData  =  psData(  psOverlapStartIndex  : psOverlapEndIndex  , : );
ifoData =  ifoData( ifoOverlapStartIndex : ifoOverlapEndIndex , : );


