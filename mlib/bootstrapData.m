%Algorithm verified 9/25/2012 to produce 8/27ths duplicate content on 3-long data. Duplicate fraction goes to 1/e for long data sets.
function out = bootstrapData(data)
	%'bootstrapping'
	r = floor(rand(rows(data),1)*rows(data)) + 1;
	out = data(r,:);
endfunction
