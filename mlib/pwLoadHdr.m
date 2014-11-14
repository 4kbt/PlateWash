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

fclose(pwHeaderFile);
