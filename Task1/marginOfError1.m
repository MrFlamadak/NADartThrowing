% SF1546 Numerical Methods, Basic Course, ProjectA
% marginOfError1.m - Calculates margin of error for solution in task1
format long
h = 1e-5;
[x, y] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);
xArr = x(end-3:end);

% Interpol margin of error
disp('test')
constants1 = newtonInterpol(x(end-2:end), y(end-2:end));
graph = @(x) constants1(1) + constants1(2) * (x - xArr(1)) + constants1(3) * (x - xArr(1)) .* (x - xArr(2));
newt1 = graph(2.37);

constants2 = newtonInterpol(x(end-3:end), y(end-3:end));
graph = @(x) constants2(1) + constants2(2) * (x - xArr(1)) + constants2(3) * ((x - xArr(1)) .* (x - xArr(2))) + constants2(4) * ((x - xArr(1)) .* (x - xArr(2)) .* (x - xArr(3)));
newt2 = graph(2.37);
interpoltn = abs(newt1 - newt2)

% Interpol Truncation error
% 6.02461e-06

% Euler margin of error + error validity control
eulerAnswer1 = y(end);

[x, y] = multiVarEuler(0, 1.84, 15, h/2, 4, 0.02);
xArr = x(end-3:end);
constants = newtonInterpol(x(end-2:end), y(end-2:end));
graph = @(x) constants(1) + constants(2) * (x - xArr(1)) + constants(3) * (x - xArr(1)) .* (x - xArr(2));
answer2 = graph(2.37);
eulerAnswer2 = y(end);

[x, y] = multiVarEuler(0, 1.84, 15, h/4, 4, 0.02);
xArr = x(end-3:end);
constants = newtonInterpol(x(end-2:end), y(end-2:end));
graph = @(x) constants(1) + constants(2) * (x - xArr(1)) + constants(3) * (x - xArr(1)) .* (x - xArr(2));
answer3 = graph(2.37);
eulerAnswer3 = y(end);

richardson = (eulerAnswer1 - eulerAnswer2) / (eulerAnswer2 - eulerAnswer3)
eulertn = abs(eulerAnswer3 - eulerAnswer2)

% Euler Truncation error
% 1.1011e-06

% (total error)Final answer
% 1.826619 +- 7e-06 m
