## usage: sprintInteger(data)
## prints data using save --ascii into the specified file. Filename is a string.

function s = sprintInteger(data)
	formatString = '$%d$%%';

	s = sprintf( formatString, data);
end

%!test assert( sprintInteger(1) == '1')
%!test assert( sprintInteger(0.1) == '0');
%!test assert( sprintInteger(-31415) == '-31415');
