%Data must take the usual two column form. 
function [out squareWave outTime stepTime acceptValues] = squareLockM(timeCol, data, stepPeriod, risingEdgeTime, startDelay, endPad, weighting)

	outTime       = [];
	pTime         = endPad; 
	dTime         = startDelay; 

	weightLength  = stepPeriod - pTime - dTime;

	assert( mod(weightLength, 2) == 0 ); 
	squareWave    = zeros(length(data),1);

	outputCounter = 1;
	avecounter    = 0;
	aveVecProto   = zeros(1,columns(data));
	aveVec        = aveVecProto;
	sampleTime    = data(2,timeCol) - data(1,timeCol);

	stepTime    = mod( (data(:,timeCol) - risingEdgeTime) , stepPeriod  );
	triStepTime = mod( (data(:,timeCol) - risingEdgeTime) , stepPeriod*3);
	acceptValues = ( stepTime > dTime & stepTime < (stepPeriod - pTime) & data(:,timeCol) > risingEdgeTime );


	if    ( weighting == 1 )
		weight2 = 1. / 2 * (1 - cos( 2*pi / (weightLength) * (stepTime-dTime) ) );
	elseif( weighting == 2 )
		weight2 =  1. - ( (stepTime-dTime - weightLength/2) / (weightLength/2) ).^2;
	elseif( weighting == 3 )
		weight2 = sin(pi/(weightLength) * stepTime);
	elseif( weighting == 4)
		f = fir1(floor(weightLength/sampleTime), 0.1);

		weightSeg = [zeros( floor(dTime/sampleTime) ,1); f;  zeros(stepPeriod / sampleTime - length(f) - floor(dTime/sampleTime),1)];
		
		startIndex = find( stepTime < sampleTime);
		startIndex = startIndex(1);

		weight2 = [ zeros(startIndex , 1); repmat( weightSeg, ceil(length(stepTime) / length(weightSeg)) , 1)];
		weight2 = weight2(1:length(stepTime) , :);

        elseif(weighting == 5)

		load '~/mlib/adaptiveFilter12a.dat'
		adaptiveWeight = ad(:,2);
		adapLength = length(ad(:,2));

		weight2 = stepTime.*0;
		wLength = length(weight2);

		for i = 1:length(stepTime)
			if( triStepTime(i) < sampleTime)
				if ( (i+ adapLength ) < wLength )
					weight2(i:i+adapLength-1) = adaptiveWeight;
				end
			end
		end
        elseif(weighting == 6)

		load '~/mlib/adaptiveFilter7spline.128.dat'
		adaptiveWeight = ad(:,2);
		adapLength = length(ad(:,2));

		weight2 = stepTime.*0;
		wLength = length(weight2);

		for i = 1:length(stepTime)
			if( triStepTime(i) < sampleTime)
				if ( (i+ adapLength ) < wLength )
					weight2(i:i+adapLength-1) = adaptiveWeight;
				end
			end
		end
	else
		weight2 = ones(size(stepTime));
	end

	for i = 1:length(data)
		if(acceptValues(i)) %second clause added 5/19/2013
			flag = 1;

			aveVec     = aveVec + data(i,:)*weight2(i);

			avecounter += weight2(i);

			if(weighting !=0 )
				squareWave(i) = weight2(i);
			else
				squareWave(i) = 1;
			end
		endif

		%Average and reset
		if( !acceptValues(i) && flag==1 )
			flag = 0;

			out(outputCounter, :) = aveVec ./ avecounter;

			outTime = [outTime; data(i,timeCol)]; 

			aveVec  = aveVecProto;

			avecounter = 0;
			outputCounter++;
		end
	end
end %function
