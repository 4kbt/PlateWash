run3147FixedParameters

rootDir = HOMEDIR;
subDir = '/data/';
runPrefix = [ ' = fopen("' rootDir subDir 'run']

iforunNumber = num2str(nameCtr);
eval(['ifoHeaderFile' runPrefix iforunNumber 'ifo.dat", "rt");'] ) ;
ifoLoadData;

out = ifoData(:,1:2);

%out(:,1) = out(:,1) + ifoStartSec;

fn = ['trim/run' iforunNumber 'ifoTimeData.dat'];

save( fn , "out");
