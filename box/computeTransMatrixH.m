function H = computeTransMatrixH(pt, realPos)
A = zeros (8, 9);
for i = 1:4
   x  = pt(i, 1);
   y  = pt(i, 2);
   rx = realPos(2*i-1);
   ry = realPos(2*i);
   A(2*i-1, :)   = [x, y, 1, 0, 0, 0, -rx*x, -rx*y, -rx];
   A(2*i, :) = [0, 0, 0, x, y, 1, -ry*x, -ry*y, -ry];
end
A = A' * A;
[~, ~, d]=svd(A);
H = reshape(d(:,9), 3, 3)';
end