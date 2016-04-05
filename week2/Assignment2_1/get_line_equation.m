function [out, y] = get_line_equation(p1, p2, p3)
if (p2(1)-p1(1)) == 0
    x = p1(1);
    if p3(1) - x > 0
        out = 1;
    elseif p3(1) - x < 0
        out = -1;
    else
        out = 0;
    end
else
    y = (p2(2)-p1(2))/(p2(1)-p1(1))*(p3(1)-p1(1)) + p1(2);
    %out = p3(2)-y;
    if p3(2) - y > 0
        out = 1;
    elseif p3(2) - y < 0
        out = -1;
    else
        out = 0;
    end
end

end