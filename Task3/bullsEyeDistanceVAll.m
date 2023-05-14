% SF1546 Numerical Methods, Basic Course, Project A
% bullsEyeDistanceVAll.m - "Returns distance from bullseye"
% modified version of "bullsEyeDistanceV.m", so that it can take more
% parameters

% x0 & y0: initial coordinates; v0: initial velocity; 
% h: step-length; a: angle; m: mass

function distance = bullsEyeDistanceVAll(y0, a, h, v0, m)
    xend = 2.37; yend = 1.83; Kx = 0.002; Ky = 0.02;
    x0 = 0; a0 = a; g = 9.82;
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
  
        xp = xp + h * xbis(xp, yp);
        yp = yp + h * ybis(xp, yp);
 
        xy(i, 1) = x; xy(i, 2) = y;
        i = i + 1;
    end

    x = xy(1:i - 1, 1);
    y = xy(1:i - 1, 2);
    plot(x, y)
    distance = y(end) - yend;
end
