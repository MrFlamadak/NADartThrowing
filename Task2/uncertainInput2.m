% SF1546 Numerical Methods, Basic Course, ProjectA
% unceratinInput2.m - Calculates total error with 1% disrupted parameter inputs

clear vars
addpath('..\Task3\')
m = 20e-3;  mDisrupted = m + m * 0.01;
v = 15;     vDisrupted = v + v * 0.01;
y0 = 1.84;  y0Disrupted = y0 + y0 * 0.01;

h = 1e-5;
tol = 1e-4;
format long

% First root
guess1 = 4;

[undisrupted1, t, d1] = secantAll(y0, v, h, guess1, m, tol);

[disruptedM1, t, d2] = secantAll(y0, v, h, guess1, mDisrupted, tol);
[disruptedV1, t, d3] = secantAll(y0, vDisrupted, h, guess1, m, tol);
[disruptedY01, t, d4] = secantAll(y0Disrupted, v, h, guess1, m, tol);

% Total disruption for guess1 = 4
mError1 = abs(disruptedM1 - undisrupted1);
vError1 = abs(disruptedV1 - undisrupted1);
y0Error1 = abs(disruptedY01 - undisrupted1);

totError1 = mError1 + vError1 + y0Error1

% Second root
guess2 = 80;

undisrupted2 = secantAll(y0, v, h, guess2, m, tol);

disruptedM2 = secantAll(y0, v, h, guess2, mDisrupted, tol);
disruptedV2 = secantAll(y0, vDisrupted, h, guess2, m, tol);
disruptedY02 = secantAll(y0Disrupted, v, h, guess2, m, tol);

% Total disruption for guess2 = 80
mError2 = abs(disruptedM2 - undisrupted2);
vError2 = abs(disruptedV2 - undisrupted2);
y0Error2 = abs(disruptedY02 - undisrupted2);

totError2 = mError2 + vError2 + y0Error2

% Total margin of error for root 1: 1.19654 degrees
% Total margin of error for root 2: 0.22460 degrees

% Verification to see if the error is within bull's-eye radius

% Root 1
% Positive error
[distance1, xp, yp] = bullsEyeDistanceAll(y0, v, h, undisrupted1 + totError1, m);

xp = xp(end-3:end);
yp = yp(end-3:end);
k = newtonInterpol(xp(1:end-1), yp(1:end-1));
yFuncP = @(x) k(1) + k(2) * (x-xp(1)) + k(3) * (x-xp(1)) * (x-xp(2));
pDistance1 = yFuncP(2.37) -1.83

% Negative error
[distance1, xn, yn] = bullsEyeDistanceAll(y0, v, h, undisrupted1 - totError1, m);

xn = xn(end-3:end);
yn = yn(end-3:end);
k = newtonInterpol(xn(1:end-1), yn(1:end-1));
yFuncN = @(x) k(1) + k(2) * (x-xn(1)) + k(3) * (x-xn(1)) * (x-xn(2));
nDistance1 = yFuncN(2.37) - 1.83

% Root 2
% Positive error
[distance1, xp, yp] = bullsEyeDistanceAll(y0, v, h, undisrupted2 + totError2, m);

xp = xp(end-3:end);
yp = yp(end-3:end);
k = newtonInterpol(xp(1:end-1), yp(1:end-1));
yFuncP = @(x) k(1) + k(2) * (x-xp(1)) + k(3) * (x-xp(1)) * (x-xp(2));
pDistance2 = yFuncP(2.37) -1.83

% Negative error
[distance1, xn, yn] = bullsEyeDistanceAll(y0, v, h, undisrupted2 - totError2, m);

xn = xn(end-3:end);
yn = yn(end-3:end);
k = newtonInterpol(xn(1:end-1), yn(1:end-1));
yFuncN = @(x) k(1) + k(2) * (x-xn(1)) + k(3) * (x-xn(1)) * (x-xn(2));
nDistance2 = yFuncN(2.37) - 1.83

% pdistance1 = 0.02025
% ndistance1 = -0.02029

% pdistance2 = -0.08033
% ndistance2 = 0.07514

% Result: None of the roots + its errors will have a 100% of hitting
% bull's-eye