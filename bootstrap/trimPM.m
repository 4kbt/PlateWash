%Doing this here, before the fit, should speed up the fitter.

function T = trimPM(pM,  signalColumns, fitColumn)

	global HOMEDIR   %why is this needed?
        columnNames;
        fitErrColumn = diffErrOffset + fitColumn;

	T.x1Vec  = pM(:,aCol);
        T.x2Vec  = pM(:,bCol);
        T.sx1Vec = pM(:,aErrCol);
        T.sx2Vec = pM(:,bErrCol);

        %Dynamic allocation of signal and error columns.
        [T.BMat T.sBMat] = allocateSignalColumns(signalColumns, ABErrOffset, pM);

	T.fitCol    = pM(:,fitColumn);
	T.fitErrCol = pM(:,fitErrColumn);

end
