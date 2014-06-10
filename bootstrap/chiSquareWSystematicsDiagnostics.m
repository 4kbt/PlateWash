       diag = [(GBV- pM(:,torCol)).^2 varG pM(:,torerrCol).^2  varG ./ pM(:,torerrCol).^2];
       [max(diag); mean(diag); median(diag); min(diag); std(diag)]


       hist(log10((pM(:,torCol) - GBV ).^2  %lqr
                ./(pM(:,torerrCol).^2 +varG)),100)
       hist(log10(abs(GBV)), 100)
       hold on;
       hist(log10(abs(pM(:,torCol) - GBV )), 100)
       hist(log10(abs(pM(:,torerrCol))), 100)
       hold off; 

