% SF1546 Numerical Methods, Basic Course, ProjectA
% merginOfError3.m - Calculates the margins of error in task 3
clear vars;
format long
a = 3;
m = 20e-3;  
vGuess = 16;     
y0 = 1.84;
h = 1e-5;
tol = 1e-4;

% SecantError
[root, secantError] = secantVAll(y0, a, h, vGuess, m, tol)

% InterpolError
[distance, xd, yd] = bullsEyeDistanceVAll(y0, a, h, root, m);
x1 = xd(end-3:end);
y1 = yd(end-3:end);
k = newtonInterpol(x1(1:end-1), y1(1:end-1));
yFunc1 = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
y237_1 = yFunc1(2.37);

k = newtonInterpol(x1, y1);
yFunc2 = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2)) + k(4) * (x-x1(1)) * (x-x1(2)) * (x-x1(3));
y237_2 = yFunc2(2.37);
interpolError = abs(y237_1-y237_2)

% EulerError/Validity control
d1 = bullsEyeDistanceVAll(y0, a, h, root, m);
d2 = bullsEyeDistanceVAll(y0, a, h/2, root, m);
d3 = bullsEyeDistanceVAll(y0, a, h/4, root, m);
richard1 = abs(d1 - d2) / abs(d2 - d3)
eulerError = abs(d3 - d2)

totalE = secantError + eulerError
% SecantError = 5.84e-05
% InterpolError = 4.44e-16 (negligible)
% EulerError = 9.12e-07
% totalError = 5.93-05


% Shows worst-case scenario
pMaxDistanceFromBullseye = bullsEyeDistanceVAll(y0, a, h, root + 5.93e-05, m)
nMaxDistanceFromBullseye = bullsEyeDistanceVAll(y0, a, h, root - 5.93e-05, m)
% pmaxDistancefrombullseye = 5.56872e-07
% nmaxDistancefrombullseye = 2.69653e-07
