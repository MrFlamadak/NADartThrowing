% SF1546 Numerical Methods, Basic Course, Project A
% Task3 (Randvärdesproblem)

format long
h = 1e-5;
v = 15;
[root, tn] = secantV(h, v, 1e-7)
[distance, xd, yd] = bullsEyeDistanceV(h, root);
distance
x1 = xd(end-2:end);
y1 = yd(end-2:end);
k = newtonInterpol(x1, y1);
f = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
distance = f(2.37)
errormargin = distance - 1.83
root

% ANSWERS:
% root = 17.310648 m/s
% error margin = 3.98e-06
% this gives us the final answer
% "in order to hit the bull's-eye, the dart must be thrown with
% 17.310648 +- 3.98e-06 m/s."
