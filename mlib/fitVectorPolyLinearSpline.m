function [yTD] = fitVectorPolyLinearSpline(inOutTorqueTorqueErr, xpositions,torquePoints)

	yTD =  ( interp1(xpositions, torquePoints, inOutTorqueTorqueErr(:,1),'linear') - \
	         interp1(xpositions, torquePoints, inOutTorqueTorqueErr(:,2),'linear') ) ;

endfunction
 
