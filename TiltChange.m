%Constants
l = 2; %Distance between bike wheels
b = 1; %Distance of centre of mass in front of rear wheel
h = 1; %Height of centre of mass when upright
g = 9.81; %Gravity
v = 5; %Velocity

%Variables
theta = 0.3;
ICs = [theta,0,0]; %Initial condition for Y
%C = @(x,Y) 0;
%C = @(x,Y) pi/4*cos(x);
C = @(x,Y) Y(1) + Y(2);
%C = @(x,Y) Y(2);
%C = @(x,Y) Y(3);
%C = @(x,Y) 5*tan(Y(1))*cos(Y(3));
%C = @(x,Y) (l*tan(Y(1))*cos(Y(3))^2/(2*v) - v* sin(Y(3))*cos(Y(3)) + v*h*sin(Y(1))*sin(Y(3))^2/l);

%Y = [theta,theta dot,alpha]


F = @(x,Y) [Y(2),-v^2*cos(Y(1))*tan(Y(3))/(h*l) - b/h*(v*sec(Y(3))^2/l*C(x,Y))*cos(Y(1)) + v^2*tan(Y(3))/l*sin(Y(1))*cos(Y(1))+g/h*sin(Y(1)),C(x,Y)]';

options = odeset('Events',@events2);
sol = ode15s(F,[0,30],ICs,options);

plot(sol.x,sol.y);
legend('\theta','D\theta','\alpha');

disp(sol.x(end));