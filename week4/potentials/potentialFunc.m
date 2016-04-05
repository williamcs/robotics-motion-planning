function potentialFunc
%% world and obstacle definition

% global world definition
% [ xi,yi,ri ; ...]
global world;
% simple case
% world = [0 0 15; 1 1 2; -5 -7 3 ];
% composed case
% world = [0 0 15; -3 -6 2; 2 1 3; -3 7 2];
% local minimum
% world = [0 0 15; -4 -2 3; 4 -2 3; 0 5 3];
% last case
world = [0 0 15; 0,0,4];
noOfObs = size(world,1);

% plot the world and obstacles
for i = 1:noOfObs
[s,r] = sprintf('(x - %f)^2 + (y - %f)^2 - (%f)^2',world(i,1)...
    ,world(i,2),world(i,3));
ezplot(s,[-15 15 -15 15]);
hold on
end
title('');xlabel(''); ylabel('');


%% robot and goal pose definition

global robot, global goal,global epsilon;

% simple case
% robot = [-3 -11];
% goal = [-1 5];
% composed case
% robot = [-3 -11];
% goal = [-1 12];
% local minimum case
% robot = [-1 -11];
% goal = [0 12];
% last case
robot = [0.2 -11];
goal = [0 12];

epsilon = 1e-1;

plot(robot(1),robot(2),'go');
hold on
plot(goal(1),goal(2),'r*');
hold on

%% pot function parameters
global attmag, % attraction gradient scalar
global dgoalstar, % attraction dgoal*
global repmag, % repulsive gradient scalar
global repradi; % repulsive force area


attmag = 0.5;
dgoalstar = 15; 
repmag = 1;
repradi = 1;

%% call potential function with ode
tsp = [0 1e25];
options = odeset('Event',@potEventFunc);
tic
[T,Y] = ode45(@potGrad,tsp,robot,options);
toc
%% plot results
plot(Y(:,1),Y(:,2),'g','LineWidth',2);

plotPotential();


end