function res = checkObstacle(pt)

global world;
% get the properties of the bounding sphere
noOfObs = size(world,1);

res = 1;

for i = 2:noOfObs
    xObs = world(i,1);
    yObs = world(i,2);
    rObs = world(i,3);
    
    % res remains 1 if pt is out of all obstacles
    res = res * ( findSqDistance(pt,[xObs yObs]) > rObs ) * 1;
end

end