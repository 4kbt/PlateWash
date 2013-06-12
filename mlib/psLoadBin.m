%psDatFile = fopen('run1256ps.dta', "r", "ieee-le");

psNumSensors=psNumColumns/4;

psData = (fread(psDatFile, [psNumSensors,Inf], "double") )';

psData = psData(1:end-1,:);

fclose(psDatFile);
