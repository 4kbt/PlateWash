function out = trimSpikes(data, column, threshold, delay)

	data = flipud(data);

	out = [];

	s = spikeFlag(data(:,column), threshold);

	ctr = 1; 
	flag = 0;

	for ctr = 1:rows(data)

		if( s(ctr) > 0 )
			flag = delay;
		else
			if(flag > 0)
				flag--;
			else
				out = [out; data(ctr,:)];
			end
		end

	end
	
	out = flipud(out);
end
