function o = resampleAndHold(data, interval)

	start= data(1,1); 
	stop = data(end,1);
	steps = (stop - start) /interval

	o = zeros(steps, 2);

	position = 1;
	value = data(1,2);
	for ctr = 1:steps
		t = start + (ctr - 1) * interval;
%		[data(position,1) t]
		if( data(position, 1) < t)
			value = data(position,2);
			position++;
		end

		o(ctr,:) = [t value];
	end

end
