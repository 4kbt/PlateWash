%liHeaderFile = fopen('run1256li.hdr',"rt");

%"run number"
fscanf(liHeaderFile,'%c',12);

liRunNum = fscanf(liHeaderFile,'%d');

%"interval"
fscanf(liHeaderFile,'%c', 8 );

liSampleTime = fscanf(liHeaderFile, '%g');

fscanf(liHeaderFile,'%c', 19 );

liStartDate = fscanf(liHeaderFile, '%g/%g/%g\n');

fscanf(liHeaderFile,'%c',14);
liStartTime= fscanf(liHeaderFile, '%g:%g:%g\n');

if(liStartDate(3)!=9 & liStartDate(3)!=10 & liStartDate(3) != 11& liStartDate(3) != 13 & liStartDate(3) != 13)
        error("Not 2009 or 2010 or 2011!");
end


switch liStartDate(1)
        case {1}
                liStartSec=0;
        case {2}
                liStartSec=86400*(31);
        case {3}
                liStartSec=86400*(31+28);
        case {4}
                liStartSec=86400*(31+28+31);
        case {5}
                liStartSec=86400*(31+28+31+30);
        case {6}
                liStartSec=86400*(31+28+31+30+31);
        case {7}
                liStartSec=86400*(31+28+31+30+31+30);
        case {8}
                liStartSec=86400*(31+28+31+30+31+30+31);
        case {9}
                liStartSec=86400*(31+28+31+30+31+30+31+31);
        case {10}
                liStartSec=86400*(31+28+31+30+31+30+31+31+30);
        case {11}
                liStartSec=86400*(31+28+31+30+31+30+31+31+30+31);
        case {12}
                liStartSec=86400*(31+28+31+30+31+30+31+31+30+31+30);
        otherwise
                error("Not a month!");
endswitch

if(liStartDate(3) == 10)
        liStartSec = liStartSec + 86400*365;
end

if(liStartDate(3) == 11)
        liStartSec = liStartSec + 86400*365*2;
end
if(liStartDate(3) == 12)
        liStartSec = liStartSec + 86400*365*3;
end
if(liStartDate(3) == 13)
        liStartSec = liStartSec + 86400*365*4+1;
end


timeConversion=[3600 60 1];
liStartSec += (86400*liStartDate(2) + timeConversion * liStartTime);

% # columns of data 
fscanf(liHeaderFile,'%c',18);

liNumColumns=fscanf(liHeaderFile,'%d');

fscanf(liHeaderFile, ['%c' 'file']);

fscanf(liHeaderFile,'%c');

fclose(liHeaderFile);
