%Translates a point mass array by transVec (a three vector)

function transArray = translatePMArray(array, transVec)
	
	transVec;

	array(:,2:4)=array(:,2:4)+ ones(rows(array),1)*transVec;

	transArray=array;
end
