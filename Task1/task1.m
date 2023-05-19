% SF1546 Numerical Methods, Basic Course, Project A

format long
h = 0.000001;
[x, y] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);
plot(x, y)
y(end)
x(end)
plot(x(end-2:end), y(end-2:end))

% linear interpolation was performed to see if there were any improvements
% to be made, however the difference was negligible and so the
% aforementioned results are satisfactory
% xpoints = x(end-4:end)
% ypoints = y(end-4:end)
% %plot(xpoints, ypoints)
% xspan = linspace(xpoints(1), xpoints(end));
% k = (ypoints(3)-ypoints(2))/(xpoints(3)-xpoints(2));
% m = ypoints(1) - k*xpoints(1);
% yval = k.*xspan + m;
% plot(xspan, yval)

% kvadratisk interpolation
A = [1, x(end-2), x(end-2).^2;
     1, x(end-1), x(end-1).^2;
     1, x(end), x(end).^2]
c = [y(end-2); y(end-1); y(end)];
b = A\c
%graph = @(x) b(1) + b(2) * x + b(3) * x.^2;
% x = linspace(0, 2.37);
% plot(x, graph(x))
% graph(2.37)

c = interpol1(x(end-2:end), y(end-2:end))
graph = @(x) c(1) + c(2) * x + c(3) * x.^2;
x = linspace(0, 2.37);
plot(x, graph(x))
graph(2.37)
noIntpol = y(end) - 1.83
withIntpol = graph(2.37) - 1.83
difference = abs(noIntpol - withIntpol)