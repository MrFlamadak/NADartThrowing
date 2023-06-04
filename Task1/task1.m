% SF1546 Numerical Methods, Basic Course, Project A

clear variables
format long
h = 1e-05;
[x, y] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);
plot(x, y)

% Newton Interpolation
xArr = x(end-3:end);
constants = newtonInterpol(x(end-2:end), y(end-2:end));
graph = @(x) constants(1) + constants(2) * (x - xArr(1)) + constants(3) * (x - xArr(1)) .* (x - xArr(2));
plot(x, graph(x))
newt1 = graph(2.37);
ylim([0 1.90])

answer = newt1

% step length = 1e-05
% Answer with Newton's Polynomial
% 1.826619499364257
% Truncation error for Newton's Polynomial
% 6.024614285671248e-06
% Truncation error for Euler's Method (from marginOfError1.m)
% 1.101082329535430e-06
% Total error (addition)
% 7.12e-06

% Final answer
% 1.826619 +- 7e-06 m

