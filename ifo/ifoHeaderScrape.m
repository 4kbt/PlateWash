ifoData = minimalIFOLoad(nameCtr, HOMEDIR);

out = ifoData(:,1:2);

fn = ['trim/run' num2str(nameCtr) 'ifoTimeData.dat'];

save( fn , "out");
