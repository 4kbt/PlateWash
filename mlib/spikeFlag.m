function spikes = spikeFlag( data, threshold)

	spikes = zeros(rows(data),1);

	dd = diff(data);

	s = logical( abs(dd) > threshold);

	spikes(2:end) = s;

end
