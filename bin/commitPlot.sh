git log --date=raw | grep Date | sed 's/Date\://' | tac |awk 'BEGIN{ctr=0}{print $1, NR; ctr = ctr + 1}'
