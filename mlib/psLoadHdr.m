
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

psStartSec = dateTimeToSecs(psStartDate, psStartTime); 

% # columns of data 
fscanf(psHeaderFile,'%c',18);

psNumColumns=fscanf(psHeaderFile,'%d');

fscanf(psHeaderFile, ['%c' 'file']);

fscanf(psHeaderFile,'%c');

%Go back and read it all into a cell array
frewind(psHeaderFile);
headerCell = textscan( psHeaderFile, '%s','delimiter','\n');

%If file has an ending timestamp, parse it
if( headerCell{1,1}{end-3,1} == 'finishing date')
        endDate = sscanf( headerCell{1,1}{end-2,1} , '%g/%g/%g\n');
        endTime = sscanf( headerCell{1,1}{end  ,1} , '%g:%g:%g\n');

        psHdrEndSec = dateTimeToSecs(endDate, endTime);
end

fclose(psHeaderFile);
