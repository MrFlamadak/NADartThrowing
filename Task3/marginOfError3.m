% SF1546 Numerical Methods, Basic Course, ProjectA
% merginOfError3.m - Calculates the margins of error in task 3

h = 1e-6;
v0 = 15;
tol = 1e-5;

[root, tn] = secantV(h, v0, tol)
% from this, we know that the answer will be:
% 17.310647549 +- 2.0256e-09 m/s

% case 1
d1 = bullsEyeDistanceV(h, root + tn)
d2 = bullsEyeDistanceV(h/2, root + tn)
d3 = bullsEyeDistanceV(h/4, root + tn)
richard1 = abs(d1 - d2) / abs(d2 - d3)
error1 = d1 - d2
% answer: 2.2204e-16 +- 7.8427e-08

% case 2
d4 = bullsEyeDistanceV(h, root - tn)
d5 = bullsEyeDistanceV(h/2, root - tn)
d6 = bullsEyeDistanceV(h/4, root - tn)
richard2 = abs(d4 - d5) / abs(d5 - d6)
error2 = d4 - d5
% answer: -1.2145e-13 +- 7.8427e-08

totalE = tn + error1
