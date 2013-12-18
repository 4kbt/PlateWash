fundamentalConstants
run3147FixedParameters
run3147PendulumParameters

Pressure = OnePascalInTorr*load('finalPressure.dat');

Temp = 298;

accommodation = 16;

Q_unc = 32*pi*pendulumI*pendulumF0*sqrt(8*k_B*Temp/pi/18/m_p)/\
	(pendulumBodyWidth^3*pendulumBodyHeight * Pressure * accommodation)

printSigNumber(Q_unc, 'extracted/unconstrainedQ.tex', 1);
