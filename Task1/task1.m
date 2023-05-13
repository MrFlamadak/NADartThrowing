% SF1546 Numerical Methods, Basic Course, Project A

format long
h = 0.000001;
[x, y] = multiVarEuler(0, 1.84, 15, h, 4, 0.02);
plot(x, y)
y(end)
x(end)
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

 


