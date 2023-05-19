% Numerical Methods, Basic Course, ProjectA
% interpolAll - takes set of points and interpolates depending on number of
% points
function [k] = interpolAll(x1, y1)
% c is y1 transponated
% A is x1 transponated 
% Ax=c
L = length(x1);
C = ones(L, 1);

for n = 1:L-1
A = [x1.^n];
C = [C A];
end
k = C \ y1;
end