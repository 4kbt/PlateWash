function  [beta, sigma, r, bestFreq, out, ERR, COV]= peakFitter3(t, data, fLow, fHigh)

if(nargin!=4)
	usage("peakFitter3(t,data,fLow,fHigh)");
end

if(fLow <=0  | fHigh <=0 | fHigh <= fLow )
	error('peakFitter3: negative frequencies or high/low transposed');
end

%Define fitting function
%using genSineSeed

%Hunt for peak
minsigma=1e99;
maxIndex=0;
bestFreq=10000;

binWidth=1/(t(2)-t(1))/length(t); % gets the bin width approximately right in order to set ntries

nTries=(fHigh-fLow)/binWidth*2; %factor of two for safety
%nTries=(fHigh-fLow)/binWidth*4; %factor of two for safety 10/28/2010
nTries=(fHigh-fLow)/binWidth*10; %faster computer means another factor of two :) 6/2/2013 


%%% Find the center peak of the sinc window response %%%%
for i=1:nTries

	guessFreq=fLow+(i-1)*(fHigh-fLow)/nTries;

	[beta, sigma, r] = ols2(data, genSineSeed(t,guessFreq));

	out(i,1)=guessFreq;
	out(i,2)=sigma;

	if(sigma<minsigma)
		minsigma=sigma;
		maxIndex=i;
		bestFreq=guessFreq;
	end

end


%plot(out(:,1), out(:,2));

%pause

%%% Bisection - bisect inward to find the true peak %%%
if(maxIndex == 1)
	error('Bisection could not begin, fLow favored');
elseif(maxIndex == floor(nTries))
	error('Bisection could not begin, fHigh favored');
end


bs=1;
if(bs==1)
	bisect=zeros(3,2);
	bisect(1,1)=out(maxIndex-1,1);
	bisect(1,2)=out(maxIndex-1,2);
	bisect(3,1)=out(maxIndex+1,1);
	bisect(3,2)=out(maxIndex+1,2);


	% 5 is a magic number that seems to work all the time. The right magic number is < 10 and should be a mathematical constant. 
	for i=1:5
		%pick the center of the interval
		bisect(2,1)=(bisect(3,1)-bisect(1,1))/2+bisect(1,1);

		%fit at the center
		[beta, sigma, r] = ols2(data, genSineSeed(t,bisect(2,1)));
		bisect(2,2)=sigma;

		%interpolate a parabola to the data
		seedMatrix=[bisect(:,1).^2  bisect(:,1) ones(3,1)];
		%Look, ma! I learned something in all that math 'scoolin. 
		pb = inv(seedMatrix)*bisect(:,2);
		%find the location of the parabola's vertex 
		bestFreq=-pb(2)/2/pb(1);
		%need an error check for 
		if(abs(bestFreq-bisect(2,1))>(bisect(3,1)-bisect(1,1)))
			error("Traversed out of bisection interval.");
		end

		if(bestFreq <= bisect(2,1))
			bisect(3,:)=bisect(2,:);
		else
			bisect(1,:)=bisect(2,:);
		end

	end

end

[beta,sigma, r, ERR, COV] = ols2(data, genSineSeed(t,bestFreq));

endfunction
