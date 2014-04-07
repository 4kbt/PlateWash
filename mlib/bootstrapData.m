function out = bootstrapData(data)
	%'bootstrapping'
	r = floor(rand(rows(data),1)*rows(data)) + 1;
	out = data(r,:);
endfunction
