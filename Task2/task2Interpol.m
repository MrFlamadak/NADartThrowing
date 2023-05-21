% Numerical Methods, Basic Course, ProjectA
% task2Interpol.m - Interpolates on points close to 2.37 and returns
% interpolated y(2.37) value with margin of error.
format long
m = 20e-3;
v = 15;
y0 = 1.84; 

h = 1e-5;
tol = 1e-4;
aGuess1 = 0;

root = secantAll(y0, v, h, aGuess1, m, tol);
[d, xd, yd] = bullsEyeDistanceAll(y0, v, h, root, m);
x1 = xd(end - 2:end);
y1 = yd(end - 2:end);
k = interpolAll(x1, y1);
yfunc = @(x) k(1) + k(2) * x + k(3) * x.^2;
y237 = yfunc(2.37)
errormargin = yfunc(2.37)- 1.83

