%ifoHeaderFile = fopen('run1256ifo.hdr',"rt");

% version
fscanf(ifoHeaderFile,'%c',14);

ifoVersion = fscanf(ifoHeaderFile,'%g\n');

if(ifoVersion(1) !=1.1)
	error('wrong file version! use different variant of ifoLoadData');
end

ifoTitle = fgets(ifoHeaderFile);

%Skip "info for ps-file"
for i = 1:6
	skip  = fgets(ifoHeaderFile);
end

%timing

fscanf(ifoHeaderFile,'%c',6);

ifoStartDateTime = fscanf(ifoHeaderFile, '%g/%g/%g%g:%g:%g\n');


if(ifoStartDateTime(3)!=2009 & ifoStartDateTime(3)!=2010 & ifoStartDateTime(3) != 2011 & ifoStartDateTime(3) != 2012)
	error("Not 2009, 2010, 2011, or 2012!");
end

switch ifoStartDateTime(1)
	case {1}
		ifoStartSec = 0;
	case {2}
		ifoStartSec = 86400 * (31);
	case {3}
		ifoStartSec = 86400 * (31+28);
	case {4}
		ifoStartSec = 86400 * (31+28+31);
	case {5}
		ifoStartSec = 86400 * (31+28+31+30);
	case {6}
		ifoStartSec = 86400 * (31+28+31+30+31);
	case {7}
		ifoStartSec = 86400 * (31+28+31+30+31+30);
	case {8}
		ifoStartSec = 86400 * (31+28+31+30+31+30+31);
	case {9}
		ifoStartSec = 86400 * (31+28+31+30+31+30+31+31);
	case {10}
		ifoStartSec = 86400 * (31+28+31+30+31+30+31+31+30);
	case {11}
		ifoStartSec = 86400 * (31+28+31+30+31+30+31+31+30+31);
	case {12}
		ifoStartSec = 86400 * (31+28+31+30+31+30+31+31+30+31+30);
	otherwise
		error("Not a month!");
endswitch

if(ifoStartDateTime(3) == 2010)
	ifoStartSec = ifoStartSec + 86400*365;
end
if(ifoStartDateTime(3) == 2011)
	ifoStartSec = ifoStartSec + 86400*365*2;
end
%Added 1-3-2012 CAH
if(ifoStartDateTime(3) == 2012)
        ifoStartSec = ifoStartSec + 86400*365*3;
        %Leap Year
        if ( ifoStartDateTime(1) > 2 )
                 ifoStartSec = ifoStartSec + 86400;
        end
end




timeConversion =  [3600 60 1];
ifoStartSec    += (86400*ifoStartDateTime(2) + timeConversion * ifoStartDateTime(4:6));

for i = 1:25
	skip  = fgets(ifoHeaderFile);
end

ifoData = fscanf(ifoHeaderFile, '%g', [24, Inf]);

fscanf(ifoHeaderFile,'%c');

fclose(ifoHeaderFile);

ifoData = ifoData';

ifoData(:,1) = ifoData(:,1)+ ifoStartSec;

ifoStartSec = ifoData(1,1);


ifoSampleTime = ifoData(3,1) - ifoData(2,1);


if(ifoSampleTime == 1.6) 
	warning ('ifoData has 1.6s sample time. Doubling data.');
	ifoData = ifoData(ceil((1:2*length(ifoData))/2),:);

	%This is corner-case free? I think so. 
	if( mod(rows(ifoData),2) == 0)
		ifoData(2:2:rows(ifoData),1) = ifoData(1:2:rows(ifoData),1)+0.8;
	else
		ifoData(2:2:rows(ifoData),1) = ifoData(1:2:(rows(ifoData)-1),1)+0.8;
	end

	ifoSampleTime = 0.8;

end

ifoData(:,25) = ifoData(:,2)./ifoData(:,23);
ifoData = ifoData(1:end-1,:);
