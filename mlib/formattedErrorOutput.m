%values is a 1x4 rowvector of central value, statistical error, systematic error, overall error
%precision is the number of places after the decimal point
%prefix is the string prepended to each filename
function formattedErrorOutput( values , precision, prefix )

	printDecimal( values(1) , [ prefix 'Central.tex'       ] , precision );
	printDecimal( values(2) , [ prefix 'Statistical.tex'   ] , precision );
	printDecimal( values(3) , [ prefix 'Systematic.tex'    ] , precision );
	printDecimal( values(4) , [ prefix 'AggregateError.tex'] , precision );

endfunction
