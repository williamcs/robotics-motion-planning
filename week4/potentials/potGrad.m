function gradpot = potGrad(tspan, robo)
% extern global variables
global goal, % position of the goal
global world, % world with obstacles
global attmag, % attraction gradient scalar
global dgoalstar, % attraction dgoal*
global repmag, % repulsive gradient scalar
global repradi, % repulsive force area

% robot location
rbx = robo(1);
rby = robo(2);

% find the distance to the goal;
dgoal = findSqDistance(robo,goal);

% world obstacles 
noOfObs = size(world,1);

%% find the attractive gradient
if dgoal <= dgoalstar
    xTot = attmag * ( rbx - goal(1));
    yTot = attmag * ( rby - goal(2));
else
    xTot = ( dgoalstar * attmag * ( rbx - goal(1)) ) / dgoal;
    yTot = ( dgoalstar * attmag * ( rby - goal(2)) ) / dgoal;
end

%% find the repulsive gradient

for i = 1: noOfObs
   
    % position of the obstacle Oi
    xObs = world(i,1);
    yObs = world(i,2);
    rObs = world(i,3);
    
    % find the closest point on Oi
    deg = atan2( yObs - rby , xObs - rbx ); % angle between obs and robot
    distObs = findSqDistance([xObs yObs],robo); % distance to obs center
    di = distObs - rObs; % distance to closest point on Oi
    
    % closest point coordinates
    xCl = rbx + di * cos(deg);  
    yCl = rby + di * sin(deg);
    
    if di <= repradi
        xTot = xTot + repmag * (1/repradi - 1/di) * (1/di)^2 * ((rbx - xCl) / di);
        yTot = yTot + repmag * (1/repradi - 1/di) * (1/di)^2 * ((rby - yCl) / di);
    end
     
end
%% return gradpot
gradpot = [-xTot;-yTot];
end

