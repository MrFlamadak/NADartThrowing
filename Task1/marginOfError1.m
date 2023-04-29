% SF1546 Numerical Methods, Basic Course, ProjectA
% marginOfError1.m - Calculates margin of error for solution in task1
format long
h = 0.000001;
[x, y1] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);

[x, y2] = multiVarEuler(0, 1.84, 15, h/2, 4, 0.02);
[x, y3] = multiVarEuler(0, 1.84, 15, h/4, 4, 0.02);
error1 = y1(end)-y2(end);
error2 = y2(end)-y3(end);
richardson = error1/error2

% Svar: 1.82662358 +- 8.1*e-08     

