% SF1546 Numerical Methods, Basic Course, ProjectA
% marginOfError2.m - Calculates total margin of error for task2
% The radius of an offical dartboard bullseye is 6.37mm = 6.37e-03
% Therefore having a tolerance and steplength under this would be valid
% since it is within the eye.




% nästa steg: clean up interpolation




format long
clear vars
addpath('..\Task3\')

% Standardized variables
m = 20e-3;  
v = 15;     
y0 = 1.84;
h = 1e-5;
tol = 1e-4;
guess1 = 0;
guess2 = 80;

% root 1
% SecantError
[rot1, tn1] = secantAll(y0, v, h, guess1, m, tol);
secanterror1 = abs(tn1)
[d, xd, yd] = bullsEyeDistanceAll(y0, v, h, rot1, m);
x1 = xd(end - 3:end);
y1 = yd(end - 3:end);
k = newtonInterpol(x1(1:end-1), y1(1:end-1));
yfunc = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
y237_1 = yfunc(2.37);

% (Root1)Interpol margin of error
k = newtonInterpol(x1, y1);
yfunc2 = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2)) + k(4) * (x-x1(1)) * (x-x1(2)) * (x-x1(3));
y237n2 = yfunc2(2.37);
diff1 = y237_1-y237n2;

% interpolerror = -6.88e-15 (negligible)


% EulerError/valdity control
d1 = bullsEyeDistanceA(h, rot1 + tn1);
d2 = bullsEyeDistanceA(h/2, rot1 + tn1);
d3 = bullsEyeDistanceA(h/4, rot1 + tn1);
richardson1 = (d1 - d2) / (d2 - d3)
eulererror1 = abs(d3 - d2)
tot1 = eulererror1 + secanterror1

% InterpolError(root1)

% Eulererror1 = 1.91e-06
% SecantError1 = 6.62e-05
% Tot1 = 6.82e-05


[rot2, tn2] = secantAll(y0, v, h, guess2, m, tol);
secanterror2 = abs(tn2)

d1 = bullsEyeDistanceA(h, rot2 + tn2);
d2 = bullsEyeDistanceA(h/2, rot2 + tn2);
d3 = bullsEyeDistanceA(h/4, rot2 + tn2);
richardson2 = (d1 - d2) / (d2 - d3)
eulererror2 = abs(d3 - d2)
tot2 = eulererror2 + secanterror2

% InterpolError(Root2

% second root
% not needed [root2, tn2] = secantAll(y0, v, h, guess2, m, tol);
[d, xd, yd] = bullsEyeDistanceAll(y0, v, h, rot2, m);
x2 = xd(end - 3:end);
y2 = yd(end - 3:end);
k = newtonInterpol(x2(1:end-1), y2(1:end-1));
yfunc = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2));
y237_21 = yfunc(2.37);

% (Root2)Interpol margin of error

k = newtonInterpol(x2, y2);
yfunc2 = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2)) + k(4) * (x-x2(1)) * (x-x2(2)) * (x-x2(3));
y237_22 = yfunc2(2.37);
diff2 = y237_21-y237_22;

% Secanterror2 = 2.63e-05
% Eulererror2 = 2.88e-06
% Tot2 = 2.92e-05

% Shows worst-case scenario for both roots
maxBullsyedistance1 = bullsEyeDistanceAll(y0, v, h, rot1 + 6.82e-05, m);
maxBullsyedistance2 = bullsEyeDistanceAll(y0, v, h, rot2 + 2.92e-05, m);



% This is the first time we have worked with accumulative error margins and
% so we assume the separate method errors can be combined additively.
