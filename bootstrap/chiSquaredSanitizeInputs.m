function chiSquaredSanitizeInputs( x )
	if(length(x) < 3)
		size(x)
		error('insufficient number of arguments in x');
	end
	if(mod(length(x),2) == 0)
		error('wrong number of arguments to x')
	end
	if( rows(x) ~=1 & columns(x) ~=1)
		error('x is a matrix, should be a vector');
	end
end
