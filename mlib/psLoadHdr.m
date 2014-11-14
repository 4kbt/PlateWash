
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

fclose(psHeaderFile);
