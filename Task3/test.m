C = ones(3, 3);
A = [1
     2
     3
     ];
C(:, 2) = A; 
g = A - A(1)