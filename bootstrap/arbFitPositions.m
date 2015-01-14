arbFitx1Spacing = 10e-6;        printSI(arbFitx1Spacing, 2, -6, 'm', 'extracted/arbFitx1Spacing.tex', 2);
arbFitx2Spacing = 50e-6;        printSI(arbFitx2Spacing, 2, -6, 'm', 'extracted/arbFitx2Spacing.tex', 2);
arbFitx1Start   = shortCut; printSI(arbFitx1Start  , 2, -6, 'm', 'extracted/arbFitx1Start.tex'  , 2);
arbFitx1Stop    = 300e-6;       printSI(arbFitx1Stop   , 3, -6, 'm', 'extracted/arbFitx1Stop.tex'   , 2);
arbFitx2Start   = arbFitx1Stop; printSI(arbFitx2Start  , 3, -6, 'm', 'extracted/arbFitx2Start.tex'  , 2);
arbFitx2Stop    = 900e-6;       printSI(arbFitx2Stop   , 3, -6, 'm', 'extracted/arbFitx2Stop.tex'   , 2);

xpos1 = arbFitx1Start:arbFitx1Spacing:arbFitx1Stop;
xpos2 = arbFitx2Start:arbFitx2Spacing:arbFitx2Stop;

xpositions = [xpos1 xpos2(2:end)];

