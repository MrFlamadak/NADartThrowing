% SF1546 Numerical Methods
% task3Interpol.m - calculates interpolated function value for x = 2.37
m = 20e-3;
a = 3;      
y0 = 1.84;  

h = 1e-5;
% Tolerance was lowered because secantVAll was stuck in an infinite loop
tol = 5e-4;
format long
% Undisrupted
vGuess1 = 15;
root = secantVAll(y0, a, h, vGuess1, m, tol);
[d, x, y] = bullsEyeDistanceVAll(y0, a, h, root, m);
k = interpolAll(x(end-2: end), (y(end-2: end)));
func = @(x) k(1) + k(2) * x + k(3) * x.^2;

y237 = func(2.37)
errormargin = func(2.37) - 1.83