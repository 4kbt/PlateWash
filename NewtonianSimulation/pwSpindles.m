%function pwScrewGaps

	m = jan13Pendulum
	m2 = jan13Spindles

	[force torque] = rectMatrixIterator(m, m2, defineAttractorTranslation)

	save -text 'pwSpindles.dat' force torque
%end
