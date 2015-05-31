%Inject random data to preserve the blind. 
if( max(abs(pM(:,torqueCol)) == 0) )
        if( exist('unBlind') & unBlind == 0)
                pM(:,torqueCol) = randn(rows(pM),1).*pM(:,torerrCol);
        else
                error('blind persists, but blind should not persist');
        end
else
%Interlock to prevent unblinding
        if( exist('unBlind') & unBlind == 0)
                if(fakeTheData == 0)
                        error('Blind VIOLATED! WTF, MATE? This error should never happen');
                end
        else
                'Torque column is unblinded. Are you ready for this?'
                 %       pause
        end
end

