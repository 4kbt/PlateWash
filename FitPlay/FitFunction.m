%Generic function against which we might fit. see text/FitFunction.lyx 9/19/13

function o = FitFunction(x,p)

	%Yukawa
	o = yukawaVectorizedTorque(x(:,1), p(1), p(2)); 

	%Temperature
	o = o + x(:,2).*p(3)*exp(-x(:,1)./p(4));

	%Linear B parallel
	o = o + x(:,3).*p(5)*exp(-x(:,1)./p(6));
	
	%Linear B perpendicular
	o = o + x(:,4).*p(7)*exp(-x(:,1)./p(8));
	
	%Quadratic B parallel
	o = o + x(:,5).*p(9)*exp(-x(:,1)./p(10));
	
	%Quadratic B perpendicular
	o = o + x(:,6).*p(11)*exp(-x(:,1)./p(12));

	%DC Foil (Note that foil to torque is passed as an indep variable)
	o = o + x(:,7)*Foil(x(:,1));

	%AC Foil (foil to torque is passed as an indep variable)
	%o = o + x(:,7)*XXXAC Stuff here

	%Quadratic torque term?
	%o = o + p(13)*x(:,1).^2;
end
