
%"run number"
fscanf(psHeaderFile,'%c',12);

psRunNum = fscanf(psHeaderFile,'%d');

%"interval"
fscanf(psHeaderFile,'%c', 8 );

psSampleTime = fscanf(psHeaderFile, '%g');

fscanf(psHeaderFile,'%c', 19 );

psStartDate = fscanf(psHeaderFile, '%g/%g/%g\n');

fscanf(psHeaderFile,'%c',14);
psStartTime= fscanf(psHeaderFile, '%g:%g:%g\n');

if(psStartDate(3)!=9 & psStartDate(3)!=10 & psStartDate(3) != 11 & psStartDate(3) != 12)
        error("Not 2009 or 2010 or 2011 or 2012!");
end


switch psStartDate(1)
	case {1}
		psStartSec=0;
	case {2}
		psStartSec=86400*(31);
	case {3}
		psStartSec=86400*(31+28);
	case {4}
		psStartSec=86400*(31+28+31);
	case {5}
		psStartSec=86400*(31+28+31+30);
	case {6}
		psStartSec=86400*(31+28+31+30+31);
	case {7}
		psStartSec=86400*(31+28+31+30+31+30);
	case {8}
		psStartSec=86400*(31+28+31+30+31+30+31);
	case {9}
		psStartSec=86400*(31+28+31+30+31+30+31+31);
	case {10}
		psStartSec=86400*(31+28+31+30+31+30+31+31+30);
	case {11}
		psStartSec=86400*(31+28+31+30+31+30+31+31+30+31);
	case {12}
		psStartSec=86400*(31+28+31+30+31+30+31+31+30+31+30);
	otherwise
		error("Not a month!");
endswitch

if(psStartDate(3) == 10)
        psStartSec = psStartSec + 86400*365;
end

if(psStartDate(3) == 11)
        psStartSec = psStartSec + 86400*365*2;
end

%Added 1-3-2012 CAH
if(psStartDate(3) == 12)
        psStartSec = psStartSec + 86400*365*3;
        %Leap Year
        if ( psStartDate(1) > 2 )
                 psStartSec = psStartSec + 86400;
        end
end


timeConversion=[3600 60 1];
psStartSec += (86400*psStartDate(2) + timeConversion * psStartTime);

% # columns of data 
fscanf(psHeaderFile,'%c',18);

psNumColumns=fscanf(psHeaderFile,'%d');

fscanf(psHeaderFile, ['%c' 'file']);

fscanf(psHeaderFile,'%c');

fclose(psHeaderFile);
