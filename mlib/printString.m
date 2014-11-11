## usage: printString( strng, filename)
## prints String strng into file filename; both are strings.
function printString( strng, filename)

	formatString = '%s';

        fid  = fopen( filename, "w", "native");
        fprintf( fid, formatString, strng);
        fclose(fid);

end

%!test
%! fn = 'testOutput/printStringTest1.txt';
%! s = 'This is only a test';
%! printString(s,fn);
%! t = fileread(fn); %reads in strings as column vectors now? 11/10/2014
%! assert(s == transpose(t));
