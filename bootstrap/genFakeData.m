function fd = genFakeData( ForceLaw , ABTorErr)

	fd = interp1(ForceLaw(:,1), ForceLaw(:,2), ABTorErr(:,1)) - interp1(ForceLaw(:,1), ForceLaw(:,2), ABTorErr(:,2))...
                          + randn(rows(ABTorErr), 1).*ABTorErr(:,4);
end
