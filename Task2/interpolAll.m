% Numerical Methods, Basic Course, ProjectA
% interpolAll - takes set of points and interpolates depending on number of
% points
function [x, y] = interpolAll(x1, y1)
% c is y1 transponated
% A is x1 transponated 
% Ax=c
L = length(x1);
C = ones(L, 1);

for n = 1:L-1
A = [x1.^n];
C = [C A];
end
k= C \ y1;
x = linspace(x1(1), x1(end));
y = zeros(size(x));
for i = 1:L
y = y + k(i)*x.^(i-1);
end
end