% SF1546 Numeriska Metoder, Basic Course, Project A
% secantVAll.m - Finds what velocity is required for hitting bullseye when
% angle is 3 degrees
% Modified from "secantV.m", so that it can take more parameters
function [root, tn] = secantVAll(y0, a, h, v, m, tol)
    vn = v + 1; vnn = v;

    % the parameters in f have an "x" prefixed to their original name so
    % that they will not have conflicts with secantVAll.m's parameter names
    f = @(xy0, xa, h, xv, xm) bullsEyeDistanceVAll(xy0, xa, h, xv, xm);
    tn = 1;
    
    while abs(tn) > tol
        tn = f(y0, a, h, vnn, m) * (vnn-vn) / (f(y0, a, h, vnn, m) - f(y0, a, h, vn, m));
        vn = vnn;
        vnn = abs(vnn - tn);
    end
    
    root = vn;
    tn = abs(tn)

end


