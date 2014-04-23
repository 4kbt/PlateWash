pM(:,torqueCol) = 0;
pM(:,torqueACol) = pM(:,torqueACol) + randn(size(pM(:,torqueACol))).*torqueBlur;
pM(:,torqueBCol) = pM(:,torqueBCol) + randn(size(pM(:,torqueBCol))).*torqueBlur;

