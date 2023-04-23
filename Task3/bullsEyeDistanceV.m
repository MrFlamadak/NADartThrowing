% SF1546 Numerical Methods, Basic Course, Project A
% bullsEyeDistanceV.m - "Returns distance from bullseye with velocity as parameter"
% modified version of "multiVarEuler.m"

% x0 & y0: initial coordinates; v0: initial velocity; 
% h: step-length; a: angle; m: mass

function distance = bullsEyeDistanceV(h, v0)
    xend = 2.37; yend = 1.83; Kx = 0.002; Ky = 0.02;
    x0 = 0; y0 = 1.84; a0 = 3; g = 9.82; m = 0.020;
    xp = v0 * cosd(a0);
    yp = v0 * sind(a0);
    xy = zeros(1000000, 2);
    xy(1, 1) = x0; xy(1, 2) = y0;
    ybis = @(xp, yp) - g - (Ky*yp*sqrt(yp^2 + xp^2))/m;
    xbis = @(xp, yp) - (Kx*xp*sqrt(yp^2 + xp^2))/m;
    i = 2;
    x = x0; y = y0;

    while x <= xend
        x = x + h * xp;
        y = y + h * yp;
        xpn = xp + h * xbis(xp, yp);
        ypn = yp + h * ybis(xp, yp);
        xp = xpn; yp = ypn;
        xy(i, 1) = x; xy(i, 2) = y;
        i = i + 1;
    end

    x = xy(1:i - 1, 1);
    y = xy(1:i - 1, 2);
    plot(x, y)
    distance = y(end) - yend;
end