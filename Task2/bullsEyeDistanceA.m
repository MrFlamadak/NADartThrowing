% SF1546 Numerical Methods, Basic course, Project A
% bullsEyeDistanceA.m - "Returns distance from bullseye with angle, velocity, mass and
% intitial y as parameters"
% modified version of "multiVarEuler.m"

% x0 & y0: initial coordinates; v0: initial velocity; 
% h: step-length; a: angle; m: mass

function [distance, x, y] = bullsEyeDistanceA(y0, v0, h, a, m)
    x0 = 0;
    xend = 2.37;
    yp = v0*sind(a);
    xp = v0*cosd(a);
    Kx = 0.002;
    Ky = 0.02;
    g = 9.82;
    xy = zeros(1000000, 2);
    n = 1;
    ybis = @(xp, yp) - g - (Ky*yp*sqrt(yp^2 + xp^2))/m;
    xbis = @(xp, yp) - (Kx*xp*sqrt(yp^2 + xp^2))/m;
    
    while x0 <= xend
        xy(n, 1) = x0;
        xy(n, 2) = y0;
        n = n + 1;
        % we get next point's coordinates
        y0 = y0 + yp*h;
        x0 = x0 + xp*h;
        % preparation for next
        yp = yp + ybis(xp, yp)*h;
        xp = xp + xbis(xp, yp)*h;
    end

    x = xy(1:n - 1, 1);
    y = xy(1:n - 1, 2);
    figure(1)
    plot(x, y)
    distance = y(end) - 1.83;
    hold on
    plot(0, 1.84, 'o')
    plot(2.37, 1.83, 'o')
    hold off
end
% Idea for how to combine the three methods
% Insert an interpolation function that returns value of y when x = 2.37 in this
% function and then let this function return interpolated distance from
% 1.83.
