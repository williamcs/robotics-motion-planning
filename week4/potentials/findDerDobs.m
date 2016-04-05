function dobsdot = findDerDobs(robo)

dobsdot = [0;0];
global world; % world with obstacles

noOfObs = size(world,1);

% find der. to bounding sphere
% position of the bounding sphere
  xBnd = world(1,1);
  yBnd = world(1,2);
  
for i=1:noOfObs
   
   xObs = world(i,1);
   yObs = world(i,2);
   
   dx = 1;
   dy = 1;
   
    if (i == 1)
        xTop = -2 * ( robo(1) - xObs);
        yTop = -2 * ( robo(2) - yObs);
        
        for j=1:noOfObs
            
            xObs = world(j,1);
            yObs = world(j,2);
            rObs = world(j,3);

            if ( j ~= i)
               if ( j == 1) % bounding sphere
                    dx = dx * (-1 * (findSqDistance(robo,[xObs yObs]))^2) + rObs^2;
                    dy = dy * (-1 * (findSqDistance(robo,[xObs yObs]))^2) + rObs^2; 
               else % other obstacles
                    dx = dx * ((findSqDistance(robo, [xObs yObs]))^2 - rObs^2);
                    dy = dy * ((findSqDistance(robo, [xObs yObs]))^2 - rObs^2); 
               end
            end  
            
        end
    else
        xTop = 2 * ( robo(1) - xObs);
        yTop = 2 * ( robo(2) - yObs);
        
        for j=1:noOfObs
            
            xObs = world(j,1);
            yObs = world(j,2);
            rObs = world(j,3);

            if ( j ~= i)
               if ( j == 1) % bounding sphere
                    dx = dx * (-1 * (findSqDistance(robo,[xObs yObs]))^2) + rObs^2;
                    dy = dy * (-1 * (findSqDistance(robo,[xObs yObs]))^2) + rObs^2; 
               else % other obstacles
                    dx = dx * ((findSqDistance(robo, [xObs yObs]))^2 - rObs^2);
                    dy = dy * ((findSqDistance(robo, [xObs yObs]))^2 - rObs^2); 
               end
            end  
            
        end

    end
    
    xTop = xTop * dx;
    yTop = yTop * dy;
    
    dobsdot(1) = dobsdot(1) + xTop;
    dobsdot(2) = dobsdot(2) + yTop;
end

end