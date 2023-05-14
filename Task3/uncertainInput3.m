% SF1546 Numerical Methods, Basic Course, ProjectA
% uncertainInput3 - Calculates total error with 1% disrupted parameter input

m = 20e-3;  mError = m * 0.01;
a = 3;      aError = a * 0.01;
y0 = 1.84;  y0Error = y0 * 0.01;

h = 1e-5;
% Tolerance was lowered because secantVAll was stuck in an infinite loop
tol = 5e-4;
format long
% Undisrupted
vGuess1 = 15;

undisrupted1 = secantVAll(y0, a, h, vGuess1, m, tol)

mDisrupted1 = secantVAll(y0, a, h, vGuess1, m + mError, tol)
aDisrupted1 = secantVAll(y0, a + aError, h, vGuess1, m, tol)
y0Disrupted1 = secantVAll(y0 + y0Error, a, h, vGuess1, m, tol)

% Total margin of error
Em = abs(mDisrupted1 - undisrupted1);
Ea = abs(aDisrupted1 - undisrupted1);
Ey0 = abs(y0Disrupted1 - undisrupted1);
Etot = Em + Ea + Ey0
% Etot = 2.227987939621419 
