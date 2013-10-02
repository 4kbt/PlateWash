%Note that x is stateful; anything in 
function o = generalDiff(d, p)
		generalTorque(x(:,1), p) - generalTorque(x(:,2), p)

%	o = (yukawaVectorizedTorque(d(:,1)', x(1) , x(2)) - yukawaVectorizedTorque(d(:,2)', x(1), x(2)) + x(3).*(d(:,1) - d(:,2)) );
end
