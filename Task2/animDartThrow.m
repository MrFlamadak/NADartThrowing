% SF1546 Numerical Methods, Basic course, Project A
% animDartThrow: Animates the dart throw with respect to the throwing angle
% h: step length

function animDartThrow(h)
    close(1)
    A = zeros(601, 2);
    index = 1;
    y0 = 1.84; v0 = 15; m = 20e-3;
    figure('Name', 'Dart throw from angles 0-85')

    for x = 0:0.1:85
        A(index, 2) = bullsEyeDistanceA(y0, v0, h, x, m);
        A(index, 1) = x;
        index = index + 1;
    end

    plot(A(:, 1), A(:, 2))
end
% this finds both solutions to task 2! visually.

% start: 5, 4 root = 4.199249961710662
