% SF1546 Numerical Methods, Basic Course, Project A

format long
h = 1e-05;
[x, y] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);
plot(x, y)
ogAnswer = y(end);
x(end);
plot(x(end-2:end), y(end-2:end))


c = interpol1(x(end-2:end), y(end-2:end));
graph = @(x) c(1) + c(2) * x + c(3) * x.^2;
%x = linspace(0, 2.37);
plot(x, graph(x))
graph(2.37);
noIntpol = y(end) - 1.83;
withIntpol = graph(2.37) - 1.83;
difference = abs(noIntpol - withIntpol);

% disp('test')
% constants = interpolNewton(x(end-2:end), y(end-2:end))
xArr = x(end-3:end);
% graph = @(x) constants(1) + constants(2) * (x - xArr(1)) + constants(3) * (x - xArr(1)) .* (x - xArr(2));
% x = linspace(0, 2.37);
% plot(x, graph(x))
% newt = graph(2.37) - 1.83
% diff = abs(withIntpol - newt)

constants = newtonInterpol(x(end-2:end), y(end-2:end));
graph = @(x) constants(1) + constants(2) * (x - xArr(1)) + constants(3) * (x - xArr(1)) .* (x - xArr(2));
%x = linspace(0, 2.37);
plot(x, graph(x))
% newt1 = graph(2.37) - 1.83
% diff = abs(withIntpol - newt1)

c = newtonInterpol(x(end-3:end), y(end-3:end));
graph = @(x) c(1) + c(2) * (x - xArr(1)) + c(3) * ((x - xArr(1)) .* (x - xArr(2))) + c(4) * ((x - xArr(1)) .* (x - xArr(2)) .* (x - xArr(3)));
plot(x, graph(x))
% newt2 = graph(2.37) - 1.83
answer = graph(2.37)
% trunk = abs(newt1 - newt2)
% pai = abs(answer - ogAnswer)

% step length = 1e-05
% Answer with Newton's Polynomial
% 1.826624106511459
% Truncation error for Newton's Polynomial
% 6.024614285671248e-06
% Truncation error for Euler's Method (from marginOfError1.m)
% 1.101082329535430e-06
% Total error (addition)
% 7.12e-06

% Final answer
% 1.826626 +- 7e-06 m

