
liNumSensors=liNumColumns/4;

liData = ( fread(liDatFile, [liNumSensors,Inf], "double") )';

fclose(liDatFile);
