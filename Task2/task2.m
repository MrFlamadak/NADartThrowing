% SF1546 Numerical Methods, Basic course, Project A
% Task2 (Randvärdesproblem)
clear
format long
guess = 80;
%argument: h och a
h = 0.1e-4;
a = 0;

[rot1, tn1] = secantA(h, a, 1e-4)
noll1 = bullsEyeDistanceA(h, rot1)

[rot2, tn2] = secantA(h, 80, 1e-4)
noll2 = bullsEyeDistanceA(h, rot2)

% animDartThrow(h) animates the dart's travel from 0 to 85 degrees
% un-comment the function below to see
%animDartThrow(h)
