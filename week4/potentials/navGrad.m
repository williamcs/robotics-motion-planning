function gradnav = navGrad(tspan, robo)
% extern global variables
global goal, % position of the goal
global K; % K for navigation
% current robot location
rbx = robo(1);
rby = robo(2);
% goal location
gx = goal(1);
gy = goal(2);

% find the distance to the goal;
dgoal = findSqDistance(robo,goal);

% find distance to obstacles
dobs = findObsDistance(robo);

% find derivative of obstacle distance
dobsdot = findDerDobs(robo);
 
%% find total derivative

% gradiant=(2*(q-qgoal)*(distance2goal^(2*kapa)+distance2obstacle)^(1/kapa)-...
%           distance2goal^2*(1/kapa)*(distance2goal^(2*kapa) + distance2obstacle)^(1/kapa -1)*(2*kapa*distance2goal^(2*kapa-2)*(q-qgoal)+ObstacleDistanceGradiant(q)))...
%           /(distance2obstacle^(2*kapa)+distance2obstacle)^(2/kapa);
      
xTot = ( 2 * (rbx-gx) * (dgoal^(2*K) + dobs)^(1/K) ...
        - dgoal^2 * (1/K) * (dgoal^(2*K) + dobs)^(1/K - 1) * ( 2 * K * dgoal^(2*K-2) * (rbx-gx) + dobsdot(1) ) ) ...
        / (dgoal^(2*K) + dobs)^(2/K);
      
yTot = ( 2 * (rby-gy) * (dgoal^(2*K) + dobs)^(1/K) ...
        - dgoal^2 * (1/K) * (dgoal^(2*K) + dobs)^(1/K - 1) * ( 2 * K * dgoal^(2*K-2) * (rby-gy) + dobsdot(2) ) ) ...
        / (dgoal^(2*K) + dobs)^(2/K);

%% return gradnav
gradnav = [-xTot;-yTot];
end