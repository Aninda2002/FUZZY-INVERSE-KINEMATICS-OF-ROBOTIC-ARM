%% =========================================================
% FUZZY INVERSE KINEMATICS OF ROBOTIC ARM
%
% INPUTS:
% 1. X Position
% 2. Y Position
%
% OUTPUTS:
% 1. Theta1
% 2. Theta2
%
%% =========================================================


%% CREATE SUGENO FIS
fis = sugfis('Name','RobotArmInverseKinematics');

%% =========================================================
%% INPUT 1 : X POSITION
%% =========================================================

fis = addInput(fis,[0 10],'Name','X');

fis = addMF(fis,'X','gaussmf',[1.5 2], ...
    'Name','Left');

fis = addMF(fis,'X','gaussmf',[1.5 5], ...
    'Name','Center');

fis = addMF(fis,'X','gaussmf',[1.5 8], ...
    'Name','Right');

%% =========================================================
%% INPUT 2 : Y POSITION
%% =========================================================

fis = addInput(fis,[0 10],'Name','Y');

fis = addMF(fis,'Y','gaussmf',[1.5 2], ...
    'Name','Bottom');

fis = addMF(fis,'Y','gaussmf',[1.5 5], ...
    'Name','Middle');

fis = addMF(fis,'Y','gaussmf',[1.5 8], ...
    'Name','Top');

%% =========================================================
%% OUTPUT 1 : THETA1
%% =========================================================

fis = addOutput(fis,[0 180],'Name','Theta1');

fis = addMF(fis,'Theta1','constant',30, ...
    'Name','Low');

fis = addMF(fis,'Theta1','constant',90, ...
    'Name','Medium');

fis = addMF(fis,'Theta1','constant',150, ...
    'Name','High');

%% =========================================================
%% OUTPUT 2 : THETA2
%% =========================================================

fis = addOutput(fis,[0 180],'Name','Theta2');

fis = addMF(fis,'Theta2','constant',45, ...
    'Name','Small');

fis = addMF(fis,'Theta2','constant',90, ...
    'Name','Medium');

fis = addMF(fis,'Theta2','constant',135, ...
    'Name','Large');

%% =========================================================
%% RULE BASE
%%
%% FORMAT:
%% [X Y Theta1 Theta2 Weight AND]
%% =========================================================

rules = [

1 1 1 1 1 1
1 2 1 2 1 1
1 3 2 3 1 1

2 1 2 1 1 1
2 2 2 2 1 1
2 3 3 3 1 1

3 1 3 1 1 1
3 2 3 2 1 1
3 3 3 3 1 1

];

fis = addRule(fis,rules);

%% =========================================================
%% DISPLAY RULES
%% =========================================================

disp('============== FUZZY RULES ==============');
showrule(fis)

%% =========================================================
%% PLOT MEMBERSHIP FUNCTIONS
%% =========================================================

figure('Name','Membership Functions');

subplot(2,2,1);
plotmf(fis,'input',1);
title('X Position');

subplot(2,2,2);
plotmf(fis,'input',2);
title('Y Position');

subplot(2,2,3);
plotmf(fis,'input',1);
title('Theta1');

subplot(2,2,4);
plotmf(fis,'input',2);
title('Theta2');

%% =========================================================
%% TEST TARGET POSITION
%% =========================================================

target = [6 6];

%% =========================================================
%% EVALUATE FUZZY SYSTEM
%% =========================================================

angles = evalfis(fis,target);

theta1 = angles(1);
theta2 = angles(2);

%% =========================================================
%% DISPLAY RESULTS
%% =========================================================

fprintf('\n=========================================\n');
fprintf('FUZZY ROBOT ARM INVERSE KINEMATICS\n');
fprintf('=========================================\n');

fprintf('Target X Position : %.2f\n',target(1));
fprintf('Target Y Position : %.2f\n',target(2));

fprintf('\nPredicted Joint Angles:\n');

fprintf('Theta1 = %.2f degrees\n',theta1);
fprintf('Theta2 = %.2f degrees\n',theta2);

%% =========================================================
%% FORWARD KINEMATICS VISUALIZATION
%% =========================================================

L1 = 5;
L2 = 4;

x1 = L1*cosd(theta1);
y1 = L1*sind(theta1);

x2 = x1 + L2*cosd(theta1 + theta2);
y2 = y1 + L2*sind(theta1 + theta2);

figure('Name','Robotic Arm Visualization');

plot([0 x1],[0 y1],'LineWidth',4);
hold on;

plot([x1 x2],[y1 y2],'LineWidth',4);

plot(x2,y2,'ro','MarkerSize',10,'LineWidth',3);

grid on;

xlim([-10 10]);
ylim([0 10]);

xlabel('X Position');
ylabel('Y Position');

title('2-Link Robotic Arm');

legend('Link 1','Link 2','End Effector');

%% =========================================================
%% SURFACE VIEW
%% =========================================================

figure('Name','Surface Viewer');

gensurf(fis,[1 2],1);

title('X-Y Workspace vs Theta1');

%% =========================================================
%% RULE VIEWER
%% =========================================================

ruleview(fis)

%% =========================================================
%% END
%% =========================================================

