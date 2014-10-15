xrange = -10:0.1:10;
yrange = xrange;

epts = zeros( columns(xrange)*columns(yrange), 2);

ectr = 1;

for ctrx = 1:columns(xrange)
	for ctry = 1:columns(yrange)
		epts(ectr,:) = [xrange(ctrx), yrange(ctry)];
		ectr++;
	end
end

fixedPts = [-1 0; pi e];
w = [1 5; 4 0.3];

v = kernelDensity(epts, fixedPts, w); 

plot3(epts(:,1), epts(:,2), v)
