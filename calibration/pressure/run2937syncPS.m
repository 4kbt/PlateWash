pwrunNumber = '1'
psrunNumber = '2937'

pwTimeCol= 18;
psTimeCol= 5;

eval(['psHeaderFile = fopen("../../data/run' psrunNumber 'ps.hdr","rt")'] ) ;
psLoadHdr;
eval(['psDatFile = fopen("../../data/run' psrunNumber 'ps.dta", "r", "ieee-le")'] ) ;
psLoadBin;

psData(:,psTimeCol) = psData(:,psTimeCol) + psStartSec;

psEndSec = psData(rows(psData), psTimeCol);

%pwEndSec = pwStartSec + 117000; 
%pwStartSec=pwStartSec + 20000;




	psOverlapStartIndex = find( (psData(:,psTimeCol) >= psStartSec)  ) (1);
	


	psOverlapEndIndex = find( (psData(:,psTimeCol) >= psEndSec) ) (1) ;
		

psData = psData( psOverlapStartIndex : psOverlapEndIndex , : );
