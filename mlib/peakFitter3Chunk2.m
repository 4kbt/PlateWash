function [b, s, f, time] = peakFitter3Chunk2(t, data, fLow,fHigh, nsamp)

	nchunks=floor(length(t)./ nsamp);

	b=zeros(nchunks-1,3);
	s = zeros(1,nchunks-1);
	f = s;
	time = s;

	for i = 1 : nchunks-1
		a = i*nsamp;
		z = (i+1)*nsamp;

		try
			[c, s(i),  r, f(i), h] = peakFitter3(t(a:z), data(a:z), fLow, fHigh);
			b(i,:)= c';
			time(i) = (t(a) + t(z) )/2;
		catch
			'chunk fit failed in peakFitter3Chunk2, moving on'
			lasterr
			'chunk time'
			t(a)
		end
	end

endfunction
