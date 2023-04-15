% SF1546 Numerical Methods, Basic course, Project A
% sekantA
function root = sekantA(h, a, tol)
xn = 5;
xnn = a;
tn = 1;
f = @(xh,xa) multivareuler2(xh, xa)-1.83;
while abs(tn) > tol
  tn = f(h,xnn)*(xnn-xn)/(f(h,xnn)-f(h,xn));
  xn = xnn;
  xnn = abs(xnn-tn);
end
root = xn;

end