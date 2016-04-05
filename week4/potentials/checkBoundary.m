function res = checkBoundary(pt)

global world;
% get the properties of the bounding sphere
xBnd = world(1,1);
yBnd = world(1,2);
rBnd = world(1,3);

% returns 1 if point is out of boundary
res = ( findSqDistance(pt,[xBnd yBnd]) > rBnd ) * 1;


end