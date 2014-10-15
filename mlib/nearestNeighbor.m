%Returns nearest-neighbor index and distance from an NxD D-vector of points.

function [ index r2 ] = nearestNeighbor(x)

	N = rows(x);

	accum = zeros(N,N);
	temp = zeros(N,N);

	for d = 1:columns(x)
		t = repmat(x(:,d) , 1, N);

		temp = t - t';
		temp = temp.^2;

		accum = accum + temp;
	end

	accum = accum + eye(N) * realmax;

	[r2 index] = min(accum');

	r2 = r2';
	index = index';
end

%!test
%! z = [1;2;4;2];
%! [in r2] = nearestNeighbor(z);
%! assert( in == [2;4;2;2] );
%! assert( r2 == [1;0;4;0] );

%!test
%! z = [1 2; 1 3; 2 4];
%! [in r2] = nearestNeighbor(z);
%! assert( in == [2;1;2] );
%! assert( r2 == [1;1;2] );
