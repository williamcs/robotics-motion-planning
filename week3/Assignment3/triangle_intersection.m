function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

flag = true;

ds_P1 = get_normal_vectors(P1);
ds_P2 = get_normal_vectors(P2);
ds = [ds_P1; ds_P2];

for i = 1: size(ds, 1)
    proj_P1 = [];
    proj_P2 = [];
    
    for j = 1: size(P1, 1)
       proj_P1 = [proj_P1, dot(ds(i, :), P1(j, :))]; 
    end
    
    for j = 1: size(P1, 1)
       proj_P2 = [proj_P2, dot(ds(i, :), P2(j, :))];
    end
    
    if min(proj_P1) > max(proj_P2) || max(proj_P1) < min(proj_P2)
        flag = false;
        return;
    end
end

    function n = get_normal(p)
        n = [p(2), -p(1)];
    end
    
    function ds = get_normal_vectors(P)
        ds = [];
        for ii = 1: size(P, 1)
            kk = ii+1;
            if kk == size(P, 1)+1
                kk = 1;
            end
            %p = P(kk, :)-P(ii, :);
            ds = [ds; get_normal(P(kk, :)-P(ii, :))];
        end
    end
% *******************************************************************
end