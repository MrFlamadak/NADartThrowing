% SF1546 Numerical Methods, Basic Course, ProjectA
% unceratinInput.m - Calculates total error with 1% disrupted parameter inputs
m = 20e-3;  mDisrupted = m + m * 0.01;
v = 15;     vDisrupted = v + v * 0.01;
y0 = 1.84;  y0Disrupted = y0 + y0 * 0.01;

h = 1e-5;
tol = 1e-4;
format long
% Undisrupted
% First root
aGuess1 = 0;

undisrupted1 = secantAll(y0, v, h, aGuess1, m, tol);

% Mdisrupted
disruptedM1 = secantAll(y0, v, h, aGuess1, mDisrupted, tol);

% Vdisrupted
disruptedV1 = secantAll(y0, vDisrupted, h, aGuess1, m, tol);

% Y0disrupted
disruptedY01 = secantAll(y0Disrupted, v, h, aGuess1, m, tol);

% Total disruption for aGuess = 0
mError1 = abs(disruptedM1 - undisrupted1);
vError1 = abs(disruptedV1 - undisrupted1);
y0Error1 = abs(disruptedY01 - undisrupted1);

totError1 = mError1 + vError1 + y0Error1

% Second root
aGuess2 = 80;

undisrupted2 = secantAll(y0, v, h, aGuess2, m, tol);

disruptedM2 = secantAll(y0, v, h, aGuess2, mDisrupted, tol);
disruptedV2 = secantAll(y0, vDisrupted, h, aGuess2, m, tol);
disruptedY02 = secantAll(y0Disrupted, v, h, aGuess2, m, tol);

% Total disruption for aGuess = 80
mError2 = abs(disruptedM2 - undisrupted2);
vError2 = abs(disruptedV2 - undisrupted2);
y0Error2 = abs(disruptedY02 - undisrupted2);

totError2 = mError2 + vError2 + y0Error2

% Total margin of error for root 1: 1.196605897255665 degrees
% Total margin of error for root 2: 0.224604771340850 degrees