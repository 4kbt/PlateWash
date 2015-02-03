%psrunNumber is a string

function [psData, psStartSec, psEndSec] = minimalPSLoad( psrunNumber, HOMEDIR )

	run3147FixedParameters

	eval(['psHeaderFile = fopen("' HOMEDIR 'data/run' psrunNumber 'ps.hdr","rt")'] ) ;
psLoadHdr;
	eval(['psDatFile = fopen("' HOMEDIR 'data/run' psrunNumber 'ps.dta", "r", "ieee-le")'] ) ;
	psLoadBin

	psData(:,psTimeCol) = psData(:,psTimeCol) + psStartSec;
	psEndSec = psData(rows(psData), psTimeCol);

end
