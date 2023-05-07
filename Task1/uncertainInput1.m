% SF1546 Numerical Methods, Basic Course, ProjectA
% uncertainInput1.m - "Calculates the margin of error with uncertain inputs

% for task 1, we are given the dart's mass, velocity, angle and initial height.
% we will begin with disrupt each parameter with 1% one at a time 
% and finally calculate the total margin of error.

m = 20e-3;  mError = m * 0.01;
v = 15;     vError = v * 0.01;  
a = 4;      aError = a * 0.01;  
y0 = 1.84;  yError = y0 * 0.01;

h = 0.000001;

% undisrupted:
[x, y] = multiVarEuler(0, y0, v, h, a, m);
undisrupted = y(end)

% disrupt m
[x, y] = multiVarEuler(0, y0, v, h, a, m + mError);
mDisrupted = y(end)
Em = mDisrupted - undisrupted

% disrupt v
[x, y] = multiVarEuler(0, y0, v + vError, h, a, m);
vDisrupted = y(end)
Ev = vDisrupted - undisrupted

% disrupt a
[x, y] = multiVarEuler(0, y0, v, h, a + aError, m);
aDisrupted = y(end)
Ea = aDisrupted - undisrupted

% disrupt y0
[x, y] = multiVarEuler(0, y0 + yError, v, h, a, m);
y0Disrupted = y(end)
Ey0 = y0Disrupted - undisrupted

% total error
totalE = abs(Em) + abs(Ev) + abs(Ea) + abs(Ey0)

% answer: total error with uncertain input of 1% is +- 21 mm