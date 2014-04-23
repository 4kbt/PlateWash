MERGEFILE=results/run3147pM3iFilterMerge.dat
UMERGEFILE=alwaysUnblindedResults/run3147pM3iFilterMerge.dat

cat results/run*ipM3FilterOnly.dat > $MERGEFILE

../bin/commentStrip.sh   $MERGEFILE
../bin/whiteLineStrip.sh $MERGEFILE


cat alwaysUnblindedResults/run*ipM3FilterOnly.dat > $UMERGEFILE

../bin/commentStrip.sh   $UMERGEFILE
../bin/whiteLineStrip.sh $UMERGEFILE
