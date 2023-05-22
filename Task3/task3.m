% SF1546 Numerical Methods, Basic Course, Project A
% Task3 (Randvärdesproblem)

format long
h = 1e-5
tol = 1e-4
v = 16;
[root, tn] = secantV(h, v, tol)
[distance, xd, yd] = bullsEyeDistanceV(h, root);
distance
x1 = xd(end-2:end);
y1 = yd(end-2:end);
k = newtonInterpol(x1, y1);
f = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
y237 = f(2.37)
errormargin = distance - 1.83
root
maxdistancefrombullseye = bullsEyeDistanceV(h, root + 5.93e-05 )

%Interpolfelgräns
x1 = xd(end - 2:end);
y1 = yd(end - 2:end);
k = newtonInterpol(x1, y1)
yfunc = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
y237 = yfunc(2.37)
errormargin = yfunc(2.37) - 1.83
% Interpol margin of error
x2 = xd(end - 3:end);
y2 = yd(end - 3:end);
k = newtonInterpol(x2, y2);
yfunc2 = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2)) + k(4) * (x-x2(1)) * (x-x2(2)) * (x-x2(3));
y237n2 = yfunc2(2.37);
diff = y237-y237n2

% ANSWERS:
% root = 17.3108182 m/s
% this gives us the final answer
% "in order to hit the bull's-eye, the dart must be thrown with
% 17.3108182 +- 5.93e-05 m/s."
% maxDistancefrombullseye = 5.568718044468568e-07
% It is within the bullseye because radius of bullseye is 6.37*e-03

