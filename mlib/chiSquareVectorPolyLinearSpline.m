function [cS] = chiSquareVectorPolyLinearSpline(inOutTorqueTorqueErr, xpositions,torquePoints)

	%p = polyfit(xpositions, torquePoints, rows(xpositions));
%	p = polyfit(xpositions, torquePoints, 5);

%	torquePoints;
%	plot(xpositions, polyval(p,xpositions))

%	yTD = (inOutTorqueTorqueErr(:,3) - ( polyval(p,inOutTorqueTorqueErr(:,1)) - polyval( p,inOutTorqueTorqueErr(:,2) ) ) ).^2\

%	yTD = (inOutTorqueTorqueErr(:,3) - ( interp1(xpositions, torquePoints, inOutTorqueTorqueErr(:,1),'nearest','extrap') - \
%					     interp1(xpositions, torquePoints, inOutTorqueTorqueErr(:,2),'nearest','extrap') ) ).^2\
%		.*(1./inOutTorqueTorqueErr(:,4));
	
	yTD = (inOutTorqueTorqueErr(:,3) - ( interp1(xpositions, torquePoints, inOutTorqueTorqueErr(:,1),'linear') - \
					     interp1(xpositions, torquePoints, inOutTorqueTorqueErr(:,2),'linear') ) ).^2\
		.*(1./inOutTorqueTorqueErr(:,4));


%	yTD =  interp1(xpositions, torquePoints, inOutTorqueTorqueErr(:,1),'*nearest');


	cS = squeeze(sum(yTD,1));


endfunction
 
