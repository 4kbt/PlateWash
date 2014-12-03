% Given an m x n matrix "data", creates (samples with replacement)
% a new n x m matrix "out" from n randomly-selected rows of "data"

function out = bootstrapData(data)

	% generates a column vector of uniform random numbers 
	% spanning 1 to n
	r = floor( rand( rows( data ) , 1 ) * rows( data ) ) + 1;

	% uses r to select rows of "data" and copy them into "out"
	out = data(r,:);

endfunction
