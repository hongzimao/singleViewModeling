function vanishPt = calculateVanish(pt)
    l1 = cross(pt(1,:), pt(7, :));
    l2 = cross(pt(4,:), pt(6, :));
    l3 = cross(pt(3,:), pt(5, :));
    l4 = cross(pt(2,:), pt(8, :));
    m1 = l1'*l1;
    m2 = l2'*l2;
    m3 = l3'*l3;
    m4 = l4'*l4;
    m = m1 + m2 + m3 + m4;
    [~, ~, v] = svd(m);
    vanishPt = v(:, 3)'/v(3,3);
    
    l1 = cross(pt(1,:), pt(4, :));
    l2 = cross(pt(2,:), pt(3, :));
    l3 = cross(pt(7,:), pt(6, :));
    l4 = cross(pt(8,:), pt(5, :));
    m1 = l1'*l1;
    m2 = l2'*l2;
    m3 = l3'*l3;
    m4 = l4'*l4;
    m = m1 + m2 + m3 + m4;
    [~, ~, v] = svd(m);
    vanishPt = [vanishPt; v(:, 3)'/v(3,3)];
    
    l1 = cross(pt(1,:), pt(2, :));
    l2 = cross(pt(4,:), pt(3, :));
    l3 = cross(pt(6,:), pt(5, :));
    l4 = cross(pt(7,:), pt(8, :));
    m1 = l1'*l1;
    m2 = l2'*l2;
    m3 = l3'*l3;
    m4 = l4'*l4;
    m = m1 + m2 + m3 + m4;
    [~, ~, v] = svd(m);
    vanishPt = [vanishPt; v(:, 3)'/v(3,3)];
end