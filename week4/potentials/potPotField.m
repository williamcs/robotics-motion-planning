function potent = potPotField(loc)

global world,
global goal,
global attmag, % attraction gradient scalar
global dgoalstar, % attraction dgoal*
global repmag, % repulsive gradient scalar
global repradi; % repulsive force area

% distance to goal
dgoal = findSqDistance(loc,goal);
noOfObs = size(world,1);

att = 0;
rep = 0;

if checkBoundary(loc)
    potent = 1;
else
    if checkObstacle(loc)
       % find attractive potential
       if dgoal <= dgoalstar
           att = 1/2 * attmag * dgoal^2;
       else
           att = dgoalstar * attmag * dgoal - 1/2 * attmag * dgoalstar^2; 
       end
       
       % find repulsive potential
        for i = 1: noOfObs

            % position of the obstacle Oi
            xObs = world(i,1);
            yObs = world(i,2);
            rObs = world(i,3);

            % find the closest point on Oi
            distObs = findSqDistance([xObs yObs],loc); % distance to obs center
            di = distObs - rObs; % distance to closest point on Oi

            if di <= repradi
                rep = rep + 1/2 * repmag * (1/di - 1/repradi)^2;
            end

        end
            
        potent = att + rep;
        
        if potent > 100
           potent = 100; 
        end
    else
        potent = 100;
    end
end


end