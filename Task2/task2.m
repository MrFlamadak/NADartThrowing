% SF1546 Numerical Methods, Basic course, Project A
% Task2 (Randvärdesproblem)
clear
format long
guess = 8;
%argument: h och a
h = 0.5e-6;
a = 0;
% y = multivareuler2(0.000001, 4);
% y2 = multivareuler2(0.0000005, 4);
% tn = abs(y2-y)
% y
% y2

% f = @(h, a) multivareuler2(h, a) - 1.83;
% yoyo = f(h, a)

%tn = 8.1001e-08 => y2 har 7 decimalers noggranhet
% sekant time
svar = sekantA(h, a, 1e-6)
noll = multivareuler2(h, svar)
% start: 5, 4 root = 4.199249961710662

%[diff, yend, x, y] = multivareuler2(4);
%guess = fzero(@multivareuler2, guess, options);

