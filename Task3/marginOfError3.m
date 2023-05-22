% SF1546 Numerical Methods, Basic Course, ProjectA
% merginOfError3.m - Calculates the margins of error in task 3

h = 1e-5;
v0 = 16;
tol = 1e-4;

[root, tn] = secantV(h, v0, tol)
d1 = bullsEyeDistanceV(h, root);
d2 = bullsEyeDistanceV(h / 2, root);
d3 = bullsEyeDistanceV(h / 4, root);
richard1 = abs(d1 - d2) / abs(d2 - d3)
eulerError = abs(d3 - d2)

totalE = tn + eulerError
% SecantError = 5.84e-05
% EulerError = 9.12e-07
% totalError = 5.93-05
