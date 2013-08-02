%Takes the difference of two measured values with uncertainty. Inputs are [mean uncertainty]

function o = diffOfTwoMeasurements(m1, m2)
        o = m1(1) - m2(1);
        o(2) = sqrt(m1(2)^2 +m2(2)^2);
end


