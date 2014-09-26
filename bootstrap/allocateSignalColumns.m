function [BMat sBMat] = allocateSignalColumns(signalColumns, ABErrOffset, pM)
	%Dynamic allocation of signal and error columns.
	BMat  = [];
	sBMat = [];
	for( sigCtr = 1:rows(signalColumns))
		if( signalColumns(sigCtr) == 0 )

			BMat  = [ BMat  ones( rows(pM) , 1 ) ];
			sBMat = [ sBMat zeros(rows(pM) , 1 ) ];
		else
			BMat  = [ BMat  pM(:, signalColumns(sigCtr)) ];
			sBMat = [ sBMat pM(:, signalColumns(sigCtr) + ABErrOffset) ]; 
		end
	end
end
