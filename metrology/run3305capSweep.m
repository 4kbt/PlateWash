shortSpot = 708.85;

[ psData psStartSec psEndSec ] = minimalPSLoad( '3305' , HOMEDIR);
ifoData = minimalIFOLoad('3305', HOMEDIR);

columnNames

%synchronize
s = synchronizerSort( 
	[ psData( : , psTimeCol ) psData( : , 13 ) ],
	[ psData( : , psTimeCol ) psData( : , 15 ) ],
	[ psData( : , psTimeCol ) psData( : , 6  ) ],
	ifoData( : ,  1 : 2 ) );

%trim data
%removes initialization movement.
%s = s( s(:,1) > 192211709.776000 , :);
%s = s( s(:,1) < 192275842.930000 | s(:,1)> 192276058.775000 , :);
s = s( s(:,1) > 192276058.775000 , :);

save 'run3305capSweep.dat' s

%trimmedData = trimSpikes( psData , psCapCol , 1e-11 , 5 ,5 );

%horizontal cut
%trimmedData = trimmedData( trimmedData( : , psEncCol) < shortSpot , :);
%shady vertical cut
%trimmedData = trimmedData( trimmedData( : , psCapCol) < 2.8e-9 , :);


%plot( trimmedData( : , psEncCol ) , trimmedData( : , psCapCol ) );


%Fit preparation
%guess = [34e-9 , 729.253 , .58e-9 ]; 
%fitFunc = inline ( "-p(1) ./ ( x - p(2) ) + p(3) " , "x", "p" );

%Fit execution
%[fitOut fitVals cvg iter corp covp covr stdresid ] = ...
%	 leasqr( trimmedData(:, psEncCol), trimmedData(:, psCapCol), ...
%		 guess , fitFunc, 1e-10, 200, ones(rows(trimmedData),1)*1e-12);

%save 'trimmedData.dat' trimmedData


