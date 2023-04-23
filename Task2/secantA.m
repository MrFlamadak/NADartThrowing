% SF1546 Numerical Methods, Basic course, Project A
% secantA.m - "Secant method for Project A"

% xn: x(n); xnn: x(n+1)
function root = secantA(h, a, tol)
xn = a+1; xnn = a;
tn = 1;
f = @(xh,xa) bullsEyeDistance(xh, xa);
while abs(tn) > tol
  tn = f(h,xnn)*(xnn-xn)/(f(h,xnn)-f(h,xn));
  xn = xnn;
  xnn = abs(xnn-tn);
end
root = xn;

end