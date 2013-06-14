%let w(i,n) be a function that goes to zero at i = 0 and i = n;
%out = window(data)
%	for cnt = 1 : rows(data)
%		out(i) = w(cnt+1, rows(data)+2)*data(cnt);
%	end
%end

%vectorized
function out = window(data)
	c = cosineWeight(rows(data)+1);
	a = sum(c)/rows(data);
	c = repmat(c,1,columns(data))./a;
	out = c.* data;
end
