function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

flag = true;
%lines1 = [[P1(1, :), P1(2, :), P1(3, :)]; [P1(1, :), P1(3, :), P1(2, :)]; P1(2, :), P1(3, :), P1(1, :)];

out1_line12 = get_line_equation(P1(1, :), P1(2, :), P1(3, :));

for i = size(P2, 1)
    if out1_line12 == 1
        if get_line_equation(P1(1, :), P1(2, :), P2(i, :)) == -1
            flag = false;
            return;
        end
    end
    
    if out1_line12 == -1
        if get_line_equation(P1(1, :), P1(2, :), P2(i, :)) == 1
            flag = false;
            return;
        end
    end
end

out1_line13 = get_line_equation(P1(1, :), P1(3, :), P1(2, :));
for i = size(P2, 1)
    if out1_line13 == 1
        if get_line_equation(P1(1, :), P1(3, :), P2(i, :)) == -1
            flag = false;
            return;
        end
    end
    
    if out1_line13 == -1
        if get_line_equation(P1(1, :), P1(3, :), P2(i, :)) == 1
            flag = false;
            return;
        end
    end
end

out1_line23 = get_line_equation(P1(2, :), P1(3, :), P1(1, :));
for i = size(P2, 1)
    if out1_line23 == 1
        if get_line_equation(P1(2, :), P1(3, :), P2(i, :)) == -1
            flag = false;
            return;
        end
    end
    
    if out1_line23 == -1
        if get_line_equation(P1(2, :), P1(3, :), P2(i, :)) == 1
            flag = false;
            return;
        end
    end
end

out2_line12 = get_line_equation(P2(1, :), P2(2, :), P2(3, :));
for i = size(P1, 1)
    if out2_line12 == 1
        if get_line_equation(P2(1, :), P2(2, :), P1(i, :)) == -1
            flag = false;
            return;
        end
    end
    
    if out2_line12 == -1
        if get_line_equation(P2(1, :), P2(2, :), P1(i, :)) == 1
            flag = false;
            return;
        end
    end
end

out2_line13 = get_line_equation(P2(1, :), P2(3, :), P2(2, :));
for i = size(P1, 1)
    if out2_line13 == 1
        if get_line_equation(P2(1, :), P2(3, :), P1(i, :)) == -1
            flag = false;
            return;
        end
    end
    
    if out2_line13 == -1
        if get_line_equation(P2(1, :), P2(3, :), P1(i, :)) == 1
            flag = false;
            return;
        end
    end
end

out2_line23 = get_line_equation(P2(2, :), P2(3, :), P2(1, :));
for i = size(P1, 1)
    if out2_line23 == 1
        if get_line_equation(P2(2, :), P2(3, :), P1(i, :)) == -1
            flag = false;
            return;
        end
    end
    
    if out2_line23 == -1
        if get_line_equation(P2(2, :), P2(3, :), P1(i, :)) == 1
            flag = false;
            return;
        end
    end
end


% *******************************************************************
end