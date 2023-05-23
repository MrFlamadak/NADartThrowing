% SF1546 Numerical Methods, Basic Course, ProjectA
% marginOfError2.m - Calculates total margin of error for task2
% The radius of an offical dartboard bullseye is 6.37mm = 6.37e-03
% Therefore having a tolerance and steplength under this would be valid
% since it is within the eye.
format long
% Standardized variables
m = 20e-3;  
v = 15;     
y0 = 1.84;
h = 1e-5;
tol = 1e-4;
guess1 = 0;
guess2 = 80;

[rot1, tn1] = secantA(h, guess1, tol);
secanterror1 = abs(tn1)
rot1

d1 = bullsEyeDistanceA(h, rot1 + tn1);
d2 = bullsEyeDistanceA(h/2, rot1 + tn1);
d3 = bullsEyeDistanceA(h/4, rot1 + tn1);
richardson1 = (d1 - d2) / (d2 - d3)
eulererror1 = abs((d3) - (d2))
tot1 = eulererror1 + secanterror1

% Eulererror1 = 1.91e-06
% SecantError1 = 6.62e-05
% Tot1 = 6.82e-05

[rot2, tn2] = secantA(h, guess2, tol)
secanterror2 = abs(tn2)

d1 = bullsEyeDistanceA(h, rot2 + tn2);
d2 = bullsEyeDistanceA(h/2, rot2 + tn2);
d3 = bullsEyeDistanceA(h/4, rot2 + tn2);
richardson2 = (d1 - d2) / (d2 - d3)
eulererror2 = abs(d3 - d2)
tot2 = eulererror2 + secanterror2

% Secanterror2 = 2.63e-05
% Eulererror2 = 2.88e-06
% Tot2 = 2.92e-05

% This is the first time we have worked with accumulative error margins and
% so we assume the separate method errors can be combined additively.
