cat results/run3147pM3FilterOnly.dat  > results/run3147pM3FilterMerge.dat
cat results/run3148pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3149pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3151pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3152pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3153pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3154pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3157pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3158pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3159pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3160pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3161pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3162pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3163pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3164pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat
cat results/run3166pM3FilterOnly.dat >> results/run3147pM3FilterMerge.dat

../bin/commentStrip.sh   results/run3147pM3FilterMerge.dat
../bin/whiteLineStrip.sh results/run3147pM3FilterMerge.dat
