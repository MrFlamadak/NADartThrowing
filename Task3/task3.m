% SF1546 Numerical Methods, Basic Course, Project A
% Task3 (Randvärdesproblem)

format long
clear vars;
a = 3;
m = 20e-3;  
v = 16;     
y0 = 1.84;
h = 1e-5;
tol = 1e-4;

[root, tn] = secantVAll(y0, a, h, v, m, tol);

root
% ANSWERS:
% root = 17.3108182 m/s
% this gives us the final answer
% "in order to hit the bull's-eye, the dart must be thrown with
% 17.3108182 +- 5.93e-05 m/s." (error from marginOfError3)
% maxDistancefrombullseye = 5.568718044468568e-07
% It is within the bullseye because radius of bullseye is 6.35*e-03

