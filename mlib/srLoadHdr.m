%srHeaderFile = fopen('run1256sr.hdr',"rt");

%"run number"
fscanf(srHeaderFile,'%c',12);

srRunNum = fscanf(srHeaderFile,'%d');

%"interval"
fscanf(srHeaderFile,'%c', 8 );

srSampleTime = fscanf(srHeaderFile, '%g');

fscanf(srHeaderFile,'%c', 19 );

srStartDate = fscanf(srHeaderFile, '%g/%g/%g\n');

fscanf(srHeaderFile,'%c',14);
srStartTime= fscanf(srHeaderFile, '%g:%g:%g\n');

if(srStartDate(3)!=9 & srStartDate(3)!=10 & srStartDate(3) != 11& srStartDate(3) != 13 & srStartDate(3) != 13)
        error("Not 2009 or 2010 or 2011!");
end


switch srStartDate(1)
        case {1}
                srStartSec=0;
        case {2}
                srStartSec=86400*(31);
        case {3}
                srStartSec=86400*(31+28);
        case {4}
                srStartSec=86400*(31+28+31);
        case {5}
                srStartSec=86400*(31+28+31+30);
        case {6}
                srStartSec=86400*(31+28+31+30+31);
        case {7}
                srStartSec=86400*(31+28+31+30+31+30);
        case {8}
                srStartSec=86400*(31+28+31+30+31+30+31);
        case {9}
                srStartSec=86400*(31+28+31+30+31+30+31+31);
        case {10}
                srStartSec=86400*(31+28+31+30+31+30+31+31+30);
        case {11}
                srStartSec=86400*(31+28+31+30+31+30+31+31+30+31);
        case {12}
                srStartSec=86400*(31+28+31+30+31+30+31+31+30+31+30);
        otherwise
                error("Not a month!");
endswitch

if(srStartDate(3) == 10)
        srStartSec = srStartSec + 86400*365;
end

if(srStartDate(3) == 11)
        srStartSec = srStartSec + 86400*365*2;
end
if(srStartDate(3) == 12)
        srStartSec = srStartSec + 86400*365*3;
end
if(srStartDate(3) == 13)
        srStartSec = srStartSec + 86400*365*4+1;
end


timeConversion=[3600 60 1];
srStartSec += (86400*srStartDate(2) + timeConversion * srStartTime);

% # columns of data 
fscanf(srHeaderFile,'%c',18);

srNumColumns=fscanf(srHeaderFile,'%d');

fscanf(srHeaderFile, ['%c' 'file']);

fscanf(srHeaderFile,'%c');

fclose(srHeaderFile);
