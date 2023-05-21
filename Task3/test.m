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
[d, x1, y1] = bullsEyeDistanceVAll(y0, a, h, root, m);
x2 = x1(end-3: end);
y2 = y1(end-3: end);
k = newtonInterpol(x2, y2);


func = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2)) + k(4) * (x-x2(1)) * (x-x2(2)) * (x-x2(3));

y237 = func(2.37)
errormargin = func(2.37) - 1.83