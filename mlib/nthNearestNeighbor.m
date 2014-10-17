%Returns nearest-neighbor index and distance from an NxD D-vector of points.

function [ index ] = nthNearestNeighbor(x, n)

	%for speed/clarity
	N = rows(x);

	%temporary variables
	accum = zeros(N,N);
	temp = zeros(N,N);

	%compute quadrature distance matrix between all points
	for d = 1:columns(x)
		t = repmat(x(:,d) , 1, N);

		temp = t - t';
		temp = temp.^2;

		accum = accum + temp;
	end

	%prevent diagonal from being minimal distance
	accum = accum + eye(N) * realmax;

	%determine nth nearest neighbor
	[sr2 sindex] = sort(accum');
	index = sindex(n,:);
	
	index = index';
end

%!test
%! d = [0,0; 0,-1; 0.5,0.5; 2,2];
%! in = nthNearestNeighbor(d,3);
%! assert(in == [4;4;4;2]);

%!test
%! d = [1;2;3;4;5;6;7;8];
%! in = nthNearestNeighbor(d,3);
%! assert(in == [4;4;1;2;3;4;5;5]);

%!test
%! z = [1;2;4;2];
%! in = nthNearestNeighbor(z,1);
%! assert( in == [2;4;2;2] );

%!test
%! z = [1 2; 1 3; 2 4];
%! in = nearestNeighbor(z);
%! assert( in == [2;1;2] );
