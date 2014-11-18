## usage: printDecimal(data, filename, precision)
## prints data using save --ascii into the specified file. Filename is a string.
## <precision> specifies the number of places after the decimal point

function s = sprintDecimal(data, precision)
	assert(precision > 0); 
	assert(precision - floor(precision) == 0 );
        assert(size(data) == [1 1]);

	data = sigRound(data, precision);

	%useful transformation (magnitude counts from 0)
	precision = precision - 1;
	
	%Determine number of decimal places; abs necessary for complex/imaginary/negative problems
	mag = floor(log10(abs(data)));
	ndecimals = mag - precision; 

	if(ndecimals >= 0)
		ndecimals = 0;
	else
		ndecimals = abs(ndecimals);
	end

	formatString = '%.';

	%http://www.mathworks.com/help/matlab/ref/fprintf.html#inputarg_formatSpec
	formatString = ['$' formatString num2str(ndecimals) 'f$%%'];
	
	s = sprintf( formatString, data);
end

%Testing is in printDecimal.
% %!test test printDecimal 
