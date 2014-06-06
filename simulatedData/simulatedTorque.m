%torData, posData both [time data] 
%torqueLaw is [position torque]
function simTor = simulatedTorque(torData, posData, torqueLaw, noiseLevel)

	run3147FixedParameters

	%pressEncP = load([HOMEDIR 'calibration/pressure/run2937pressEncOutput.dat']); %bake dependencies into makefile

	interPos = interp1(posData(:,1), posData(:,2), torData(:,1));

	%calibrate
	%calPos = (touch2937 - polyval(pressEncP, interPos) ) * 1e-6;
	calPos = interPos;

	plot(calPos)

	
	rawTorque = interp1(torqueLaw(:,1), torqueLaw(:,2), calPos) + noiseLevel*randn(rows(calPos),1);

	%filter it for transfer function 
	filterTorque = rawTorque;
	
	simTor = [torData(:,1) filterTorque];

end
