% SF1546 Numerical Methods, Basic Course, Project A
% Task3 (Randvärdesproblem)

h = 1e-5;
v = 15;
distance = bullsEyeDistanceV(h, v)
% X becomes negative and does not reach wall
answer = secantV(h, distance, 1e-1);