## usage: printInteger(data, filename)
## printing wrapper to sprintInteger. Filename is a string.

function printInteger(data, filename)

	s = sprintInteger( data );
	printString( s, filename); 	
end
