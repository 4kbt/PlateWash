## usage: sprintSigNumber(data, filename, precision)
## prints significant digits of a number to a string.
## <precision> specifies the number of significant digits.

function s = sprintSigNumber(data, precision)
	
	assert(precision > 0);
        assert(precision - floor(precision) == 0 );
        assert(size(data) == [1 1]);

	precision = precision - 1;

        cl   = floor( log10( abs(data ) ) );

	cnum = data/(10.^cl);

	%Double-percent to work around LaTeX \input whitespace behaviour
	formatString = '%.*f %s %d %s%%';

	s =sprintf( formatString, precision, cnum, "\\times 10^{", cl, "}");
end
