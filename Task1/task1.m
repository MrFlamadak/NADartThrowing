% SF1546 Numerical Methods, Basic Course, Project A

format long
h = 0.000001;
[x, y] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);
plot(x, y)
y(end)
x(end)
