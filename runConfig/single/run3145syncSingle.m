pwrunNumber = '3145'
psrunNumber = '1';

try
	preSync3
catch
end

pwData = pwData(1:end-2,:);

pwData(:,pwTimeCol) = pwData(:,pwTimeCol) + pwStartSec;

pwEndSec = pwData(rows(pwData), pwTimeCol);
