function o = coherentTimeAverage(data , nsecs, binWidth, timeCol)

	t = mod(data(:,timeCol), nsecs);

	o = [];

	for time = (binWidth/2):binWidth:nsecs

		d = data( ( ( t > (time-binWidth) ) & (t < time+binWidth) ) , :);

		o = [o; mean(d), std(d), rows(d) ];
	end

end

