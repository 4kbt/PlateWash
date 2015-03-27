function [PSB ASB OPB PSF ASF OPF PSLength ASLength OPLength] = photoDataParse () 

	%import original analysis
	d = dlmread('pendulumPhotoMeasurements.txt' );
	d = d(:,2:end);
	placeCounter = 0; 

	%Parsing:
	placeCounter++; %header

	%pre-science back
	placeCounter++;
	PSB = d( placeCounter + (1:3) , : );
	placeCounter = placeCounter + 3; 

	%After-science back
	placeCounter++;
	ASB = d( placeCounter + (1:3) , : );
	placeCounter = placeCounter + 3; 

	%On-plate back
	placeCounter++;
	OPB = d( placeCounter + (1:3) , : );
	placeCounter = placeCounter + 3; 

	%FrontSide
	placeCounter = placeCounter + 1; %blank line, title

	%pre-science front
	placeCounter++;
	PSF = d( placeCounter + (1:3) , : );
	placeCounter = placeCounter + 3;
	PSLength = d( placeCounter , 1:2 ); placeCounter++; 

	%After-science front
	placeCounter++;
	ASF = d( placeCounter + (1:3) , : );
	placeCounter = placeCounter + 3; 
	ASLength = d( placeCounter , 1:2 ); placeCounter++; 

	%On-plate front 
	placeCounter++;
	OPF = d(placeCounter + (1:3) , : );
	placeCounter = placeCounter + 3; 
	OPLength = d( placeCounter , 1:2 ); placeCounter++;

endfunction
