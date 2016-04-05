function [value,isterminal,direction] = navEventFunc(t,robo)

global epsilon,
global goal;

% gr = navGrad(t,robo)<[epsilon; epsilon];


value = [(norm(navGrad(t,robo))>epsilon)*1  findSqDistance(robo,goal)<epsilon ] ;  

isterminal = [1 1];   % Stop the integration
direction = [0 0];   % any direction


end