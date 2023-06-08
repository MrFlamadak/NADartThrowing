% SF1546 Numerical Methods, Basic Course, ProjectA
% merginOfError3.m - Calculates the margins of error in task 3
clear variables
format long

a = 3;
m = 20e-3;  
vGuess = 16;     
y0 = 1.84;
h = 1e-5;
tol = 1e-4;

% SecantError
[root, secantError] = secantV(y0, a, h, vGuess, m, tol)

% InterpolError
[distance, xd, yd] = bullsEyeDistanceV(y0, a, h, root, m);
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
d1 = bullsEyeDistanceV(y0, a, h, root, m);
d2 = bullsEyeDistanceV(y0, a, h/2, root, m);
d3 = bullsEyeDistanceV(y0, a, h/4, root, m);
richard1 = abs(d1 - d2) / abs(d2 - d3)
eulerError = abs(d1 - d2)

totalE = secantError + eulerError
% SecantError = 5.84e-05
% InterpolError = 4.44e-16 (negligible)
% EulerError = 1.82e-06
% totalError = 5.93-05




% The correct way to calculate margin of error for nested methods
% ***********************************************************************
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

eulerError = abs(rootO - rootE2)
totalError = abs(rootO - rootE2) + abs(rootO - rootS)
secantError = abs(rootO - rootS)

% EulerError =   3.371579970270489e-04
% TotalError =   5.078044128588033e-04
% SekantError =   1.706464158317544e-04
% Shows worst-case scenario
% Positive error
[distance1, xp, yp] = bullsEyeDistanceV(y0, a, h, rootO + totalError, m);

xp = xp(end-3:end);
yp = yp(end-3:end);
k = newtonInterpol(xp(1:end-1), yp(1:end-1));
yFuncP = @(x) k(1) + k(2) * (x-xp(1)) + k(3) * (x-xp(1)) * (x-xp(2));
pDistance = yFuncP(2.37) -1.83

% Negative error
[distance2, xn, yn] = bullsEyeDistanceV(y0, a, h, rootO - totalError, m);

xn = xn(end-3:end);
yn = yn(end-3:end);
k = newtonInterpol(xn(1:end-1), yn(1:end-1));
yFuncN = @(x) k(1) + k(2) * (x-xn(1)) + k(3) * (x-xn(1)) * (x-xn(2));
nDistance = yFuncN(2.37) - 1.83


% pmaxDistancefrombullseye = 8.79e-06
% nmaxDistancefrombullseye = 1.60e-06

% ***********************************************************************
