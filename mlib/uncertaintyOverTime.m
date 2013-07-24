function out = uncertaintyOverTime(data, uncertainty)

	for i = 1:rows(data)

		u = 1.0/sum(1.0./uncertainty(1:i).^2);
		m = sum( data(1:i) ./ uncertainty(1:i).^2) * u;

		u = sqrt(u);
		out(i,:) = [m,u]; 
	end
	
end
