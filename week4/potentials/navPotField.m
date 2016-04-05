function potent = navPotField(loc)

global goal,
global K;

% distance to goal
dgoal = findSqDistance(loc,goal);
% distance to obstacles
dobs = findObsDistance(loc);

if checkBoundary(loc)
    potent = 1;
else
    if checkObstacle(loc)
        potent = dgoal^2 / ( (dgoal)^(2*K) + dobs )^(1/K);
    else
        potent = 1;
    end
end


end