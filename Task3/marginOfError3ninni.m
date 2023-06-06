
clear variables
format long

a = 3;
m = 20e-3;  
vGuess = 16;     
y0 = 1.84;
h = 1e-5;
tol = 1e-4;
%% original
[rootO, secantError1] = secantV(y0, a, h, vGuess, m, tol)
%% secant disrupted
tol2 = 1e-5;
[rootS, secantError1] = secantV(y0, a, h, vGuess, m, tol2)
%% euler disrupted
h2 = h/2;
[rootE2, secantError1] = secantV(y0, a, h2, vGuess, m, tol)
h4 = h/4

[rootE4, secantError1] = secantV(y0, a, h4, vGuess, m, tol)
skattning = (rootO-rootE2)/(rootE2-rootE4)

abs(rootO - rootE2)
E = abs(rootO - rootE2) + abs(rootO - rootS)
abs(rootO - rootS)

