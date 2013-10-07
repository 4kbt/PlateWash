function [value partials dataNames fitNames] = linearMagnetic( data, dataNames, fitParams, fitNames)

	%Define expectations
	expectedData = {"position (m)" "magnetic field (T)"};
	expectedFits = {"linear magnetic" "magneticLambda"};

	%Check inputs
        checkNames(data,      dataNames, expectedData);
        checkNames(fitParams, fitNames,  expectedFits);

	subfitNames = {"alpha" "lambda"};

	[values partials subOutDNames subOutFNames] = generalYukawaFitFunction(data(:,1), dataNames(1), fitParams, subfitNames);

	checkNames(expectedData(1), subOutDNames);
	checkNames(subOutFNames   , subfitNames );

	partials = [partials .* data(:,2) values];

	values = values .* data(:,2); 

end
