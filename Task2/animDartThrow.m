% SF1546 Numerical Methods, Basic course, Project A
% animDartThrow: Animates the dart throw with respect to the throwing angle
% h: step length

function animDartThrow(h)
    close(1)
    A = zeros(601, 2);
    index = 1;

    for x = 0:0.1:85
        A(index, 2) = bullsEyeDistance(h, x);
        A(index, 1) = x;
        index = index + 1;
    end

    plot(A(:, 1), A(:, 2))
end
% this finds both solutions to task 2! visually.

% start: 5, 4 root = 4.199249961710662

%[diff, yend, x, y] = multivareuler2(4);
%guess = fzero(@multivareuler2, guess, options);
