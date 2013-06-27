%function pwScrewGaps

	m = jan13Pendulum
	m2 = jan13ScrewGaps

	[force torque] = rectMatrixIterator(m, m2, defineAttractorTranslation)


	save -text 'pwScrewGaps.dat' force torque
%end
