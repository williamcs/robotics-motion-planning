function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

flag = true;
%lines1 = [[P1(1, :), P1(2, :), P1(3, :)]; [P1(1, :), P1(3, :), P1(2, :)]; P1(2, :), P1(3, :), P1(1, :)];
xs1 = [P1(:, 1)];
xs2 = [P2(:, 1)];
ys1 = [P1(:, 2)];
ys2 = [P2(:, 2)];

if max(xs1) <= min(xs2) || max(ys1) <= min(ys2)
    flag = false;
end


% *******************************************************************
end