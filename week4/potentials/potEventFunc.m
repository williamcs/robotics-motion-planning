function [value,isterminal,direction] = potEventFunc(t,robo)

global epsilon,
global goal;

% find local minima by gradient
gr = potGrad(t,robo)<[epsilon; epsilon];


value = [(norm(potGrad(t,robo))>epsilon)*1  findSqDistance(robo,goal)<epsilon gr(1)*gr(2)<epsilon] ;  

isterminal = [1 1 1];   % Stop the integration
direction = [0 0 0];   % any direction


end