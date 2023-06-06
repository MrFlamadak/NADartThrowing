% SF1546 Numerical Methods, Basic Course, ProjectA
% marginOfError2.m - Calculates total margin of error for task2
% The radius of an offical dartboard bullseye is 6.37mm = 6.37e-03
% Therefore having a tolerance and steplength under this would be valid
% since it is within the eye.

clear variables
format long

% Standardized variables
m = 20e-3;  
v = 15;     
y0 = 1.84;
h = 1e-5;
tol = 1e-5;
aGuess1 = 0;
aGuess2 = 80;

% root 1

% SecantError (root 1)
[rot1, tn1] = secantA(y0, v, h, aGuess1, m, tol);
secanterror1 = abs(tn1)

% InterpolError (root 1)
[d, xd, yd] = bullsEyeDistanceA(y0, v, h, rot1, m);
x1 = xd(end - 3:end);
y1 = yd(end - 3:end);
k = newtonInterpol(x1(1:end-1), y1(1:end-1));
yfunc = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
y237_1 = yfunc(2.37);

k = newtonInterpol(x1, y1);
yfunc2 = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2)) + k(4) * (x-x1(1)) * (x-x1(2)) * (x-x1(3));
y237n2 = yfunc2(2.37);
intpolerror1 = y237_1-y237n2

% EulerError/validity control (root1)
d1 = bullsEyeDistanceA(y0, v, h, rot1 + tn1, m);
d2 = bullsEyeDistanceA(y0, v, h/2, rot1 + tn1, m);
d3 = bullsEyeDistanceA(y0, v, h/4, rot1 + tn1, m);
richardson1 = (d1 - d2) / (d2 - d3)
eulererror1 = abs(d1 - d2)
tot1 = eulererror1 + secanterror1

% EulerError1 = 3.81e-06
% SecantError1 = 6.62e-05
% InterpolError1 = -3.81e-14 (negligible)
% Tot1 = 6.82e-05


% root 2

% SecantError (root2)
[rot2, tn2] = secantA(y0, v, h, aGuess2, m, tol);
secanterror2 = abs(tn2)

% InterpolError (root2)
[d, xd, yd] = bullsEyeDistanceA(y0, v, h, rot2, m);
x2 = xd(end - 3:end);
y2 = yd(end - 3:end);
k = newtonInterpol(x2(1:end-1), y2(1:end-1));
yfunc = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2));
y237_21 = yfunc(2.37);

k = newtonInterpol(x2, y2);
yfunc2 = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2)) + k(4) * (x-x2(1)) * (x-x2(2)) * (x-x2(3));
y237_22 = yfunc2(2.37);
interpolerror2 = y237_21-y237_22

% EulerError/validity control (root 2)
d1 = bullsEyeDistanceA(y0, v, h, rot2 + tn2, m);
d2 = bullsEyeDistanceA(y0, v, h/2, rot2 + tn2, m);
d3 = bullsEyeDistanceA(y0, v, h/4, rot2 + tn2, m);
richardson2 = (d1 - d2) / (d2 - d3)
eulererror2 = abs(d1 - d2)
tot2 = eulererror2 + secanterror2

% SecantError2 = 2.63e-05
% EulerError2 = 5.76e-06
% InterpolError2 = -3.55e-15 (negligible)
% Tot2 = 2.92e-05

% Disrupting both step length and tolerance (root1)
answ1r1 = secantA(y0, v, h, aGuess1, m, 7*tol);
answ2r1 = secantA(y0, v, 2*h, aGuess1, m, tol);
E1r1 = abs(rot1 - answ1r1)
E2r1 = abs(rot1 - answ2r1)
Er1 = E1r1 + E2r1
% Total error (nested Euler in Secant, root1) = 1.63e-04

% Disrupting both step length and tolerance (root2)
answ1r2 = secantA(y0, v, h, aGuess2, m, 2*tol);
answ2r2 = secantA(y0, v, 2*h, aGuess2, m, tol);
E1r2 = abs(rot2 - answ1r2)
E2r2 = abs(rot2 - answ2r2)
Er2 = E1r2 + E2r2
% Total error (nested Euler in Secant, root2) = 4.97e-05

% Shows worst-case scenario for both roots
maxBullsyedistance1 = bullsEyeDistanceA(y0, v, h, rot1 + 6.82e-05, m)
maxBullsyedistance2 = bullsEyeDistanceA(y0, v, h, rot2 + 2.92e-05, m)

% Both roots with their respective errors will still be able to hit within
% the inner bull's-eye radius

% This is the first time we have worked with accumulative error margins and
% so we assume the separate method errors can be combined additively.
