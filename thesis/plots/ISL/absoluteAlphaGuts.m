confData = [ cI(:,5) + 2* cI(:,6) , -( cI(:,5) - 2 * cI(:,6)) ];

maxVals = max(confData(:,1), confData(:,2));

confData( confData  <= 1e-2 ) = 1e99;

minVals = min(confData(:,1), confData(:,2) ); 

cIO = [cI(:,3)*1e-4, cI(:,4)*1e-4, maxVals, minVals];

 
