% SF1546 Numerical Methods, Basic course, Project A
% Task2 (Randvärdesproblem)
clear
format long
guess = 80;
%argument: h och a
h = 0.5e-4;
a = 0;
% y = multivareuler2(0.000001, 4);
% y2 = multivareuler2(0.0000005, 4);
% tn = abs(y2-y)
% y
% y2

% f = @(h, a) multivareuler2(h, a) - 1.83;
% yoyo = f(h, a)

%tn = 8.1001e-08 => y2 har 7 decimalers noggranhet
% secant time
rot1 = secantA(h, a, 1e-4)
noll1 = bullsEyeDistanceA(h, rot1)

rot2 = secantA(h, 80, 1e-4)
noll2 = bullsEyeDistanceA(h, rot2)

% animDartThrow(h) animates the dart's travel from 0 to 85 degrees
% un-comment the function below to see
%animDartThrow(h)
