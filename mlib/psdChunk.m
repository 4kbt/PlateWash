function psdC = psdChunk(data, nchunks)

	pLength = floor(rows(data)/nchunks)

hold on
	for i = 1:nchunks
		d = data( (i-1)*pLength+1 : i*pLength, :);
		d(:,2) = detrend(d(:,2), 1); 
%		d(:,2) = d(:,2) - mean(d(:,2)); 	
		p = psd(d(:,1), d(:,2));	
		psdC(:,i) = p(:,2);

		loglog(p(:,1), p(:,2));

	end
	
	psdC = [p(:,1), psdC];
end
