% SF1546 Numeriska Metoder, Basic Course, Project A
% secantV.m - Finds what velocity is required for hitting bullseye when
% angle is 3 degrees
function root = secantV(h, v, tol)
    vn = v+1; vnn = v;
    f = @(h, x) bullsEyeDistanceV(h, x);
    tn = 1;
    while abs(tn)>tol
        tn = f(h, vnn)*(vnn-vn)/(f(h, vnn) - f(h, vn));
        vn = vnn;
        vnn = abs(vnn - tn);
    end
    root = vn;
    

end