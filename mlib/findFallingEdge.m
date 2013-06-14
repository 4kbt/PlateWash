%frequency is in 1/#samples !
function index = findFallingEdge(data, stepFrequency)

	index = findRisingEdge( [data(:,1), -data(:,2)]);

end
