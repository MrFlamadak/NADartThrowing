% SF1546 Numerical Methods, Basic Course, ProjectA
% marginOfError1.m - Calculates margin of error for solution in task1
format long
h = 1e-5;
[x, y] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);
xArr = x(end-3:end);

disp('test')
constants = newtonInterpol(x(end-2:end), y(end-2:end))
graph = @(x) constants(1) + constants(2) * (x - xArr(1)) + constants(3) * (x - xArr(1)) .* (x - xArr(2));
%x = linspace(0, 2.37);
plot(x, graph(x))
newt1 = graph(2.37) - 1.83

felgrans = newtonInterpol(x(end-3:end), y(end-3:end))
graph = @(x) felgrans(1) + felgrans(2) * (x - xArr(1)) + felgrans(3) * ((x - xArr(1)) .* (x - xArr(2))) + felgrans(4) * ((x - xArr(1)) .* (x - xArr(2)) .* (x - xArr(3)));
plot(x, graph(x))
newt2 = graph(2.37) - 1.83
answer = graph(2.37)
trunk = abs(newt1 - newt2)

% Answer with Newton's Polynomial
% 1.8266241
% Truncation error
% 6.0242e-07

% Final answer
% 1.8266241 +- 6e-07 m

% Check if truncation error is trustable
answer1 = answer;
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
truncation = abs(eulerAnswer3 - eulerAnswer2)