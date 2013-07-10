%x  = [lambda alpha slope]
function o = yukFit(d, x)
	o = (yukawaVectorizedTorque(d(:,1)', x(1) , x(2)) - yukawaVectorizedTorque(d(:,2)', x(1), x(2)) + x(3).*(d(:,1) - d(:,2)) );
end
