%pwrunNumber is a string

function [pwData, pwStartSec, pwEndSec] = minimalPWLoad( pwrunNumber, HOMEDIR )

	run3147FixedParameters

	eval(['pwHeaderFile = fopen("' HOMEDIR 'data/run' pwrunNumber 'pw.hdr","rt")'] ) ;
	pwLoadHdr;
	eval(['pwDatFile = fopen("' HOMEDIR 'data/run' pwrunNumber 'pw.dta", "r", "ieee-le")'] ) ;
	pwLoadBin

	pwData(:,pwTimeCol) = pwData(:,pwTimeCol) + pwStartSec;
	pwEndSec = pwData(rows(pwData), pwTimeCol);

end
