% SF1546 Numerical Methods, Basic course, ProjectA
% newtonInterpol - interpolates n points with newtons approach and returns
% the constants of the polynomial
function k = newtonInterpol(x, y)
    % both x and y are columnvectors
    size = length(x);
    A = ones(size, 1);
    % pre-allocation for improved computation speed
    C = ones(size, size);
    i = 1;
    for i = 1:size - 1
        % algorithm that inputs according to newton 
        A = A .* (x - x(i))
        % replaces ones in column of C with terms in A except first column
        C(:, i+1) = A
    end
    k = C \ y;
end