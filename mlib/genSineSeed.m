function sineGen=genSineSeed(t,f)

	sineGen=[sin(2*pi*f*t) cos(2*pi*f*t) ones(length(t),1)];

endfunction
