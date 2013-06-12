
srNumSensors=srNumColumns/4;

srData = ( fread(srDatFile, [srNumSensors,Inf], "double") );

fclose(srDatFile);
