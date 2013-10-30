function results=coherentAverage(data, numsamples)

	results=zeros(numsamples,3);

	for i = 1:length(data)
			
		index=mod(i,numsamples)+1;
		results(index,1)+= data(i,2);
		results(index,3)++;

	end
	
	results(:,1)=results(:,1)./results(:,3);

	for i = 1:length(data)
			
		index=mod(i,numsamples)+1;
		results(index,2) += ( data(i,2)-results(index,1) ).^2;

	end

	results(:,2)=sqrt(results(:,2)./(results(:,3)-1)./results(:,3));

end
