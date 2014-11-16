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

ifoStartDateTime = fscanf(ifoHeaderFile, '%g/%g/%g%g:%g:%g\n')

ifoStartDateTime(3) -= 2000;

ifoStartSec = dateTimeToSecs(ifoStartDateTime(1:3), ifoStartDateTime(4:6));

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
