% SF1546 Numerical Methods, Basic Course, ProjectA
% unceratinInput.m - Calculates total error with 1% disrupted parameter inputs
m = 20e-3; mDisrupted = m + m * 0.01;
v = 15; vDisrupted = v + v * 0.01;
y0 = 1.84; y0Disrupted = y0 + y0 * 0.01;

h = 1e-5;
tol = 1e-4;
format long
% Undisrupted
aGuess = 0;
undisrupted = secantA(h, aGuess, tol)
bullsEyeDistanceA()

% Mdisrupted
% mDisrupted = secant(h, )
% For next time: Make another bullseyedistance that takes m, v and y0 as
% paramters 


