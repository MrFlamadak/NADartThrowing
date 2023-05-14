% SF1546 Numerical Methods, Basic Course, ProjectA
% uncertainInput3 - Calculates total error with 1% disrupted parameter input

m = 20e-3;  mError = m * 0.01;
a = 3;      aError = a * 0.01;
y0 = 1.84;  y0Error = y0 * 0.01;

h = 1e-5;
tol = 1e-7;
format long
% Undisrupted
% First root
vGuess1 = 0;

undisrupted1 = secantVAll(y0, a, h, vGuess1, m, tol)