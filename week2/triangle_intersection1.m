function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

flag = true;

R = [0, -1; 1, 0];

for i = 1:size(P1, 1)
   for k = 1:size(P1, 1)
      for l = 1:size(P1, 1)
          if k ~= i && l ~= i && k ~= l
              n =  R*(P1(k, :) - P1(l, :))';
              x = P1(k, :)';
              ai = P1(i, :)';
              
              for j = size(P2, 1)
                  bj = P2(j, :)';
                  if dot(n, bj-x)*dot(n, ai-x) <= 0
                      flag = false;
                      return;
                  end
              end
          end
         
      end
   end
end

for i = 1:size(P2, 1)
   for k = 1:size(P2, 1)
      for l = 1:size(P2, 1)
          if k ~= i && l ~= i && k ~= l
              n =  R*(P2(k, :) - P2(l, :))';
              x = P2(k, :)';
              ai = P2(i, :)';
              
              for j = size(P1, 1)
                  bj = P1(j, :)';
                  if dot(n, bj-x)*dot(n, ai-x) <= 0
                      flag = false;
                      return;
                  end
              end
          end
         
      end
   end
end
% *******************************************************************
end