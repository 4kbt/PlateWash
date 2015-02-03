%converts dates/times as column vectors to the number of seconds elapsed since Jan 1, 2009, 0:00:00.
function secs = dateTimeToSecs( mdyy, hms)

	if(mdyy(3) < 9 | mdyy(3) > 15 ) 
		error("Not a year 2009-2015!");
	end

	switch mdyy(1)
		case {1}
			secs=0;
		case {2}
			secs=86400*(31);
		case {3}
			secs=86400*(31+28);
		case {4}
			secs=86400*(31+28+31);
		case {5}
			secs=86400*(31+28+31+30);
		case {6}
			secs=86400*(31+28+31+30+31);
		case {7}
			secs=86400*(31+28+31+30+31+30);
		case {8}
			secs=86400*(31+28+31+30+31+30+31);
		case {9}
			secs=86400*(31+28+31+30+31+30+31+31);
		case {10}
			secs=86400*(31+28+31+30+31+30+31+31+30);
		case {11}
			secs=86400*(31+28+31+30+31+30+31+31+30+31);
		case {12}
			secs=86400*(31+28+31+30+31+30+31+31+30+31+30);
		otherwise
			error("Not a month!");
	endswitch

	%Years
	secs = secs + ( mdyy(3) - 9 ) * 86400 * 365; 

	%2013 and beyond leap-year correction
	if ( mdyy(3) > 12 )
		secs = secs + 86400;	
	end

	%2012 leap year correction
	if ( mdyy(3) == 12 & mdyy(1) > 2)
		secs = secs + 86400;
	end

	timeConversion=[3600 60 1];
	secs += (86400*mdyy(2) + timeConversion * hms);
end

%!test
%! mdyy = [ 2 14 12 ]';
%! hms = [ 1 43 31 ]';
%! outSecs = dateTimeToSecs(mdyy, hms)
%! testSecs = sum([ 365*3*86400 + 86400*(31 + 14) + 3600*1 + 60*43 + 31] )
%! assert( outSecs == testSecs); 
