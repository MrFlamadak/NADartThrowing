% SF1546 Numerical Methods, Basic Course, ProjectA
% uncertainInput3 - Calculates total error with 1% disrupted parameter input

m = 20e-3;  mError = m * 0.01;
a = 3;      aError = a * 0.01;
y0 = 1.84;  y0Error = y0 * 0.01;

h = 1e-5;
% Tolerance was lowered because secantVAll was stuck in an infinite loop
tol = 5e-4;
format long
% Undisrupted
vGuess1 = 15;

undisrupted1 = secantVAll(y0, a, h, vGuess1, m, tol)  
mDisrupted1 = secantVAll(y0, a, h, vGuess1, m + mError, tol)
aDisrupted1 = secantVAll(y0, a + aError, h, vGuess1, m, tol)
y0Disrupted1 = secantVAll(y0 + y0Error, a, h, vGuess1, m, tol)

% Modified newton method(requires good starting guess)
tol = 5e-7;
uD1 = modNewton(y0, a, h, undisrupted1, m, tol)
mD1 = modNewton(y0, a, h, mDisrupted1, m + mError, tol)
aD1 = modNewton(y0, a + aError, h, aDisrupted1, m, tol)
yD1 = modNewton(y0 + y0Error, a, h, y0Disrupted1, m, tol)
bullsEyeDistanceVAll(y0, a, h, yD1, m)
  


% % Total margin of error
Em = abs(mD1 - uD1);
Ea = abs(aD1 - uD1);
Ey0 = abs(yD1 - uD1);
Etot = Em + Ea + Ey0
% % Etot = 2.227987939621419 
