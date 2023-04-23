% SF1546 Numerical Methods, Basic course, Project A
% bullsEyeDistanceA.m - "Returns distance from bullseye with angle as parameter"
% modified version of "multiVarEuler.m"

% x0 & y0: initial coordinates; v0: initial velocity; 
% h: step-length; a: angle; m: mass

function distance = bullsEyeDistanceA(h, a)
    x0 = 0;
    y0 = 1.84;
    v0 = 15;
    m = 0.02;
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
