% SF1546 Numerical Methods, Basic Course, ProjectA
% marginOfError2.m - Calculates total margin of error for task2
% The radius of an offical dartboard bullsete is 6.37mm= 6.35e-03
% Therefore having a tolerance and steplength under this would be valid
% since it is within the eye.
format long
h = 1e-04;
tol = 1e-04;
guess1 = 0;
guess2 = 80;

[rot1, tn1] = secantA(h, guess1, tol);
secanterror1 = tn1
rot1
%secanterror1 = 1.03963e-05
%eulererror1 = 3.81303e-05
% tot = 4.85267e-05

d1 = bullsEyeDistanceA(h, rot1 + tn1);
d2 = bullsEyeDistanceA(h/2, rot1 + tn1);
d3 = bullsEyeDistanceA(h/4, rot1 + tn1);
richardson1 = (d1 - d2) / (d2 - d3)
eulererror1 = (d1 ) - (d2)
svar1 = d1
tot = eulererror1 + secanterror1
d1 = bullsEyeDistanceA(h, rot1 - tn1);
d2 = bullsEyeDistanceA(h/2, rot1 - tn1);
d3 = bullsEyeDistanceA(h/4, rot1 - tn1);
richardson2 = (d1 - d2) / (d2 - d3)
eulererror2 = d1 - d2
svar2 = d1

[rot2, tn2] = secantA(h, guess2, tol);
secanterror2 = tn2;

d1 = bullsEyeDistanceA(h, rot2 - tn2);
d2 = bullsEyeDistanceA(h/2, rot2 - tn2);
d3 = bullsEyeDistanceA(h/4, rot2 - tn2);
richardson2 = (d1 - d2) / (d2 - d3)
eulererror2 = d1 - d2
svar2 = d1
tot2 = eulererror2+secanterror2

% sekanterror2 = 3.07021e-05
% eulererror2 = 8.25860e-05
% tot2 = 1.13288e-04

% This is the first time we have worked with accumulative error margins and
% so we assume the separate method errors are combined additively.
