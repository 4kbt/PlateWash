        %Check inputs
        checkNames(data,      dataNames, expectedData);
        checkNames(fitParams, fitNames,  expectedFits);

        subfitNames = {"alpha" "lambda"};

        [values partials subOutDNames subOutFNames] = generalYukawaFitFunction(data(:,1), dataNames(1), fitParams, subfitNames);

        checkNames(expectedData(1), subOutDNames);
        checkNames(subOutFNames   , subfitNames );

        partials = [partials .* data(:,2) values];

        values = values .* data(:,2);

