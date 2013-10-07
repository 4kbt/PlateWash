function [values partials dataNames fitNames] = generalYukawaFitFunction(data, dataNames, fitParams, fitNames)

	%Define expectations
	expectedData = {"position (m)"};
	expectedFits = {"alpha" "lambda"};

	%Check inputs
	checkNames(data,      dataNames, expectedData);
	checkNames(fitParams, fitNames,  expectedFits); 

	%values
	values = fitParams(1).*exp(-data./fitParams(2));
		
	%partials
	partials(1,:) = -fitParams(1) .* exp(-data./fitParams(2))./fitParams(2);
end 
