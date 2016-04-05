function dist = findObsDistance(robo)

global world; % world with obstacles

noOfObs = size(world,1);

% find distance to bounding sphere
% position of the bounding sphere
  xBnd = world(1,1);
  yBnd = world(1,2);
  rBnd = world(1,3);
dist = (-1 * (findSqDistance(robo,[xBnd yBnd]))^2) + rBnd^2;

% find the rest of the obstacle distances
for i = 2:noOfObs
    xObs = world(i,1);
    yObs = world(i,2);
    rObs = world(i,3);
    dist = dist * ((findSqDistance(robo, [xObs yObs]))^2 - rObs^2);    
end

end