% SF1546 Numerical Methods, Basic course, Project A
% secantA.m - "Modified Secant method for finding root for angle"
% 
% xn: x(n); xnn: x(n+1)
function [root, tn] = secantA(y0, v0, h, a, m, tol)
    
    xn = a + 1; xnn = a;
    tn = 1;
    % The variable names are unique to avoid conflicts with the parameter
    % variables.
    f = @(xy, xv, xh, xa, xm) bullsEyeDistanceA(xy, xv, xh, xa, xm);

    while abs(tn) > tol
        tn = f(y0, v0, h, xnn, m)*(xnn-xn)/(f(y0, v0, h, xnn, m)-f(y0, v0, h, xn, m));
        xn = xnn;
        xnn = abs(xnn-tn);
    end

    root = xn;
end