% SF1546 Numerical Methods, Basic course, Project A
% Task2 (Randvärdesproblem)
clear
format long
guess =80;
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
svar = secantA(h, a, 1e-6)
noll = bullsEyeDistance(h, svar)

% animate the dart throw with respect to the throwing angle
close(1)
A = zeros(601, 2)
index = 1;
for x = 0:0.1:85
    A(index, 2) = bullsEyeDistance(h, x);
    A(index, 1) = x;
    index = index + 1;
end
plot(A(:, 1), A(:, 2))
% this finds both solutions to task 2! visually.

% start: 5, 4 root = 4.199249961710662

%[diff, yend, x, y] = multivareuler2(4);
%guess = fzero(@multivareuler2, guess, options);

