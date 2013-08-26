%Computes the mean and the uncertainty of the mean as a running average
%Appears to handle only single columns of data and uncertainty.

function out = uncertaintyOverTime(data, uncertainty)

	for i = 1:rows(data)

		u = 1.0/sum(1.0./uncertainty(1:i).^2);
		m = sum( data(1:i) ./ uncertainty(1:i).^2) * u;

		u = sqrt(u);
		out(i,:) = [m,u]; 
	end
	
end

%!test
%! d = [1; 2; 3; 4; 5];
%! u = [1; 1; 1; 1; 1];
%!
%! o = uncertaintyOverTime(d, u);
%!
%! for ctr = 1:rows(d)
%!         assert(o(ctr,1) == mean(d(1:ctr)));
%!         assert( abs(o(ctr,2) - 1/sqrt(ctr)) < eps);
%! end

