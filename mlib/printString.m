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
%! t = fileread(fn);
%! assert(s == t);
