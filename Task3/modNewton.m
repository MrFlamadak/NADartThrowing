% Numerical Methods, Basic Course, ProjectA
% modNewton - Modified version of secaVALL.m using modified newton instead
% of secant.
function [xn, tn] = modNewton(y0, a, h, v, m, tol)
   xn = v;
   f = @(xv) bullsEyeDistanceVAll(y0, a, h, xv, m);
   fp = @(xv)  (f(xv + h) - f(xv))/h;
   tn = 1;
   while tn > tol
       tn = f(xn)/fp(xn);
       xn = xn - tn;
   end
   
end
