%pwHeaderFile = fopen('run1256pw.hdr',"rt");

%"run number"
fscanf(pwHeaderFile,'%c',12);

pwRunNum = fscanf(pwHeaderFile,'%d');

%"interval"
fscanf(pwHeaderFile,'%c', 8 );

pwSampleTime = fscanf(pwHeaderFile, '%g');

fscanf(pwHeaderFile,'%c', 19 );

pwStartDate = fscanf(pwHeaderFile, '%g/%g/%g\n');

fscanf(pwHeaderFile,'%c',14);
pwStartTime= fscanf(pwHeaderFile, '%g:%g:%g\n');
if(pwStartDate(3)!=9 & pwStartDate(3)!=10 & pwStartDate(3)!= 11 & pwStartDate(3) != 12)
	error("Not 2009 or 2010 or 2011 or 2012!");
end

switch pwStartDate(1)
	case {1}
		pwStartSec=0;
	case {2}
		pwStartSec=86400*(31);
	case {3}
		pwStartSec=86400*(31+28);
	case {4}
		pwStartSec=86400*(31+28+31);
	case {5}
		pwStartSec=86400*(31+28+31+30);
	case {6}
		pwStartSec=86400*(31+28+31+30+31);
	case {7}
		pwStartSec=86400*(31+28+31+30+31+30);
	case {8}
		pwStartSec=86400*(31+28+31+30+31+30+31);
	case {9}
		pwStartSec=86400*(31+28+31+30+31+30+31+31);
	case {10}
		pwStartSec=86400*(31+28+31+30+31+30+31+31+30);
	case {11}
		pwStartSec=86400*(31+28+31+30+31+30+31+31+30+31);
	case {12}
		pwStartSec=86400*(31+28+31+30+31+30+31+31+30+31+30);
	otherwise
		error("Not a month!");
endswitch

if(pwStartDate(3) == 10)
	pwStartSec = pwStartSec + 86400*365;
end

if(pwStartDate(3) == 11)
	pwStartSec = pwStartSec + 86400*365*2;
end

%Added 1-3-2012 CAH
if(pwStartDate(3) == 12)
	pwStartSec = pwStartSec + 86400*365*3;
	%Leap Year
        if ( pwStartDate(1) > 2 )
                 pwStartSec = pwStartSec + 86400;
        end
end


timeConversion=[3600 60 1];
pwStartSec += (86400*pwStartDate(2) + timeConversion * pwStartTime);

% # columns of data 
fscanf(pwHeaderFile,'%c',18);

pwNumColumns=fscanf(pwHeaderFile,'%d');

fscanf(pwHeaderFile, ['%c' 'file']);

fscanf(pwHeaderFile,'%c');

fclose(pwHeaderFile);
