function o = FitFunction(x,p)

	%Yukawa
	o = yukawaVectorizedTorque(x(:,1), p(1), p(2)); 

	%Temperature
	o = o + x(:,1).*p(3)*exp(-x(:,1)./p(4));

	%Linear B parallel
	o = o + x(:,1).*p(5)*exp(-x(:,1)./p(6));
	

end
