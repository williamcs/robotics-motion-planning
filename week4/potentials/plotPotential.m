function plotPotential()

global world;

% field resolution
fres = 0.10;
% get the radius of the bounding sphere
worldSize = world(1,3); 

xPs = -worldSize:fres:worldSize ;
yPs = -worldSize:fres:worldSize ;
zPs =  zeros(size(yPs,2),size(xPs,2));

for i=1:size(xPs,2)
    for j=1:size(yPs,2)
       zPs(j,i) = potPotField( [xPs(i) yPs(j)]);                 
    end
end
figure(2);
hnd = surf(xPs,yPs,zPs,zPs);
set(hnd,'LineStyle','none');
end