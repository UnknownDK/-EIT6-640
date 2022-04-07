%% Floating versus Fixed
% https://ww2.mathworks.cn/help/dsp/ug/floating-point-to-fixed-point-conversion-of-iir-filters.html
% https://se.mathworks.com/help/dsp/ref/fdesign.bandpass.html
clear;

antalBits = 8;
antalBits2 = 16;
bandpassSpecs = fdesign.lowpass('Fp,Fst,Ap,Ast',0.1253623,0.1352342,0.1,60)
lpKaiser = design(bandpassSpecs,'kaiserwin','SystemObject',true);
firTest = dsp.FIRFilter(double(fi(lpKaiser.Numerator, 1,antalBits)));
firTest2 = dsp.FIRFilter(double(fi(lpKaiser.Numerator, 1,antalBits2)));

fvt_comp = fvtool(lpKaiser, firTest, firTest2);

legend(fvt_comp,'Floating-point (double)',sprintf('Fixed-point (%d-bit)',antalBits),sprintf('Fixed-point (%d-bit)',antalBits2));
