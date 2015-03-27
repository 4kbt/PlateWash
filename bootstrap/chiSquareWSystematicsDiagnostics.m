       diag = [(GBV- pMT.fitCol).^2 varG pMT.fitErrCol.^2  varG ./ pMT.fitErrCol.^2];
       [max(diag); mean(diag); median(diag); min(diag); std(diag)]

	sum(isnan( pMT.fitCol))

%	pMT.fitCol

       hist(log10( ( pMT.fitCol - GBV ).^2  %lqr
                ./ ( pMT.fitErrCol.^2 +varG ) ), 100)
       hist( log10( abs(GBV)                  ), 100)
       hold on;
       hist( log10( abs( pMT.fitCol - GBV )   ), 100)
       hist( log10( abs( pMT.fitErrCol    )   ), 100)
       hold off; 

