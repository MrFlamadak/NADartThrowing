% SF1546 Numerical Methods, Basic course, Project A
% Task2 (Randvärdesproblem)
clear variables
format long

% Standardized variables (SI-units)
m = 20e-3;  
v = 15;     
y0 = 1.84;
h = 1e-5;
tol = 1e-4;

aGuess1 = 4;
% first root
[root1, tn1] = secantA(y0, v, h, aGuess1, m, tol);
[d, xd, yd] = bullsEyeDistanceA(y0, v, h, root1, m);
x1 = xd(end - 2:end);
y1 = yd(end - 2:end);
k = newtonInterpol(x1, y1);
yfunc = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
y237_1 = yfunc(2.37);

% (Root1)Interpol margin of error
x2 = xd(end - 3:end);
y2 = yd(end - 3:end);
k = newtonInterpol(x2, y2);
yfunc2 = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2)) + k(4) * (x-x2(1)) * (x-x2(2)) * (x-x2(3));
y237n2 = yfunc2(2.37);
diff = y237_1-y237n2;
% interpolerror = -6.88e-15 (negligible)

aGuess2 = 80;

% second root
[root2, tn2] = secantA(y0, v, h, aGuess2, m, tol);
[d, xd, yd] = bullsEyeDistanceA(y0, v, h, root2, m);
x1 = xd(end - 2:end);
y1 = yd(end - 2:end);
k = newtonInterpol(x1, y1);
yfunc = @(x) k(1) + k(2) * (x-x1(1)) + k(3) * (x-x1(1)) * (x-x1(2));
y237_2 = yfunc(2.37)


% (Root2)Interpol margin of error
x2 = xd(end - 3:end);
y2 = yd(end - 3:end);
k = newtonInterpol(x2, y2);
yfunc2 = @(x) k(1) + k(2) * (x-x2(1)) + k(3) * (x-x2(1)) * (x-x2(2)) + k(4) * (x-x2(1)) * (x-x2(2)) * (x-x2(3));
y237n2 = yfunc2(2.37);
diff = y237_2-y237n2;
root1
root2

% Shows worst-case scenario for both roots
maxBullsyedistance1 = bullsEyeDistanceA(y0, v, h, root1 + 6.82e-05, m);
maxBullsyedistance2 = bullsEyeDistanceA(y0, v, h, root2 + 2.92e-05, m);
% ANSWERS: 
% (1) InitialAngle = 4.198963 +- 6.82e-05
% maximumDistancefrombullseye1 = 2.30e-06

% (2) InitialAngle = 80.037703 +- 2.92e-05
% maximumDistanceFromBullseye2 = 1.88e-05

% Both are within 6.37e-03 m, which means we hit the bullseye even in
% worstcase.
% animDartThrow(h) animates the dart's travel from 0 to 85 degrees
% This function takes about 30 seconds to run
% Un-comment the function below to see

%animDartThrow(h)
