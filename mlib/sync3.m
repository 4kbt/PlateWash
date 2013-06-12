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


psOverlapStartIndex  = find( (psData (:,psTimeCol ) >= overlapStartSec) ) (1);
pwOverlapStartIndex  = find( (pwData (:,pwTimeCol ) >= overlapStartSec) ) (1);
ifoOverlapStartIndex = find( (ifoData(:,ifoTimeCol) >= overlapStartSec) ) (1);

psOverlapEndIndex  = find( (psData (:,psTimeCol ) >= overlapEndSec) ) (1);
pwOverlapEndIndex  = find( (pwData (:,pwTimeCol ) >= overlapEndSec) ) (1);
ifoOverlapEndIndex = find( (ifoData(:,ifoTimeCol) >= overlapEndSec) ) (1);


pwData  =  pwData(  pwOverlapStartIndex  : pwOverlapEndIndex  , : );
psData  =  psData(  psOverlapStartIndex  : psOverlapEndIndex  , : );
ifoData =  ifoData( ifoOverlapStartIndex : ifoOverlapEndIndex , : );


