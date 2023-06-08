% SF1546 Numerical Methods, Basic Course, ProjectA
% uncertainInput3 - Calculates total error with 1% disrupted parameter input
clear variables
format long

m = 20e-3;  mError = m * 0.01;
a = 3;      aError = a * 0.01;
y0 = 1.84;  y0Error = y0 * 0.01;

h = 1e-5;
% Tolerance was lowered because secantVAll was stuck in an infinite loop
tol = 1e-4;
% Undisrupted
vGuess1 = 16;

undisrupted1 = secantV(y0, a, h, vGuess1, m, tol);  
mDisrupted1 = secantV(y0, a, h, vGuess1, m + mError, tol);
aDisrupted1 = secantV(y0, a + aError, h, vGuess1, m, tol);
y0Disrupted1 = secantV(y0 + y0Error, a, h, vGuess1, m, tol);

Em = abs(mDisrupted1 - undisrupted1);
Ea = abs(aDisrupted1 - undisrupted1);
Ey0 = abs(y0Disrupted1 - undisrupted1);

Etot = Em + Ea + Ey0

% Verification to see if the error is within bull's-eye radius

% Positive error (the added number term is from marginOfError3)
[distance1, xp, yp] = bullsEyeDistanceV(y0, a, h, undisrupted1 + (Etot + 5.08e-4), m);

xp = xp(end-3:end);
yp = yp(end-3:end);
k = newtonInterpol(xp(1:end-1), yp(1:end-1));
yFuncP = @(x) k(1) + k(2) * (x-xp(1)) + k(3) * (x-xp(1)) * (x-xp(2));
pDistance = yFuncP(2.37) -1.83

% Negative error (the added number term is from marginOfError3)
[distance2, xn, yn] = bullsEyeDistanceV(y0, a, h, undisrupted1 - (Etot + 5.08e-4), m);

xn = xn(end-3:end);
yn = yn(end-3:end);
k = newtonInterpol(xn(1:end-1), yn(1:end-1));
yFuncN = @(x) k(1) + k(2) * (x-xn(1)) + k(3) * (x-xn(1)) * (x-xn(2));
nDistance = yFuncN(2.37) - 1.83

% Etot with only Secant method = 2.227987939621419 