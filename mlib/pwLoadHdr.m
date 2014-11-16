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

pwStartSec = dateTimeToSecs( pwStartDate, pwStartTime);

% # columns of data 
fscanf(pwHeaderFile,'%c',18);

pwNumColumns=fscanf(pwHeaderFile,'%d');

fscanf(pwHeaderFile, ['%c' 'file']);

fscanf(pwHeaderFile,'%c');

%Go back and read it all into a cell array
frewind(pwHeaderFile);
headerCell = textscan( pwHeaderFile, '%s','delimiter','\n');

%If file has an ending timestamp, parse it
if( headerCell{1,1}{end-3,1} == 'finishing date') 
	endDate = sscanf( headerCell{1,1}{end-2,1} , '%g/%g/%g\n');
	endTime = sscanf( headerCell{1,1}{end  ,1} , '%g:%g:%g\n');

	pwHdrEndSec = dateTimeToSecs(endDate, endTime);
end


fclose(pwHeaderFile);
