% SF1546 Numerical Methods, Basic Course, Project A
% Task3 (Randvärdesproblem)

format long
h = 1e-5;
v = 15;
[root, tn] = secantV(h, v, 1e-7)
distance = bullsEyeDistanceV(h, root)
