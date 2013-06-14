function out = cosineWeight(n)
	out = 1./2.*(1-cos(2*pi./n.*(1:n-1)'));
end
