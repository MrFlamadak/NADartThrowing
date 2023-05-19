% SF1546 Numerical Methods, Basic Course
% interpol1.m - interpolation for Euler's method in task 1
% this function takes an array of x and y values and makes a polynomial
% based on the amount of points

function constants = interpol1(xArray, yArray)
    l = length(xArray);
    A = zeros([l, l]);
    c = zeros([l, 1]);
    
    % fill the matrix A
    for i1 = 1:l
        for i2 = 1:l
            A(i1, i2) = xArray(i1).^(i2-1);
        end
    end
    
    % fill the matrix c
    for i = 1:l
        c(i) = yArray(i);
    end

    b = A\c;
    constants = b;