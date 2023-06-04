% SF1546 Numerical Methods
% task3Interpol.m - calculates interpolated function value for x = 2.37
clear variables
format long

m = 20e-3;
a = 3;      
y0 = 1.84;  

h = 1e-5;
% Tolerance was lowered because secantVAll was stuck in an infinite loop
tol = 5e-4;

% Undisrupted
vGuess1 = 15;
root = secantV(y0, a, h, vGuess1, m, tol);
[d, x, y] = bullsEyeDistanceV(y0, a, h, root, m);
k = newtonInterpol(x(end-2: end), (y(end-2: end)));
func = @(x) k(1) + k(2) * x + k(3) * x.^2;

y237 = func(2.37)
errormargin = func(2.37) - 1.83