
pwNumSensors=pwNumColumns/4;

pwData = ( fread(pwDatFile, [pwNumSensors,Inf], "double") )';

fclose(pwDatFile);
