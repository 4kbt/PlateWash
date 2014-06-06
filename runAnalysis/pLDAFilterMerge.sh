MERGEFILE=results/run3147pM3FilterMerge.dat
UMERGEFILE=alwaysUnblindedResults/run3147pM3FilterMerge.dat

cat results/run*pM3FilterOnly.dat > $MERGEFILE

../bin/commentStrip.sh   $MERGEFILE
../bin/whiteLineStrip.sh $MERGEFILE


cat alwaysUnblindedResults/run*pM3FilterOnly.dat > $UMERGEFILE

../bin/commentStrip.sh   $UMERGEFILE
../bin/whiteLineStrip.sh $UMERGEFILE
