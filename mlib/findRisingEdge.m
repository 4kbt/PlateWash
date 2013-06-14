%frequency is in 1/#samples !
function index = findRisingEdge(data, stepFrequency)

        sqCounter = rows(data); 

	if(sqCounter == 1)
		error('Only one data point passed to findRisingEdge!');
	end

        sqAve = mean(data(1:sqCounter,2));

        sqFlag = 0;
        sqCtr  = 2;
        while sqFlag < 1
                if( ( data(sqCtr,2) > sqAve ) && ( data(sqCtr-1 ,2 ) <= sqAve ) )
                        sqFlag = 1;
                        index  = sqCtr;
                end
                sqCtr++;
        end
end
