%Constants
l = 2; %Distance between bike wheels
b = 1; %Distance of centre of mass in front of rear wheel
h = 1; %Height of centre of mass when upright
g = 9.81; %Gravity
v = 5; %Velocity

FinalTime = 10;

%Variables
theta = (0/90) * pi/2;
%ICs = [2,0,0,0,theta,0,atan(l*g*theta/v^2)]; %Initial condition for Y
%C = @(x,Y) 0;

ICs = [22,0,20,0,theta,0,0];

%C = @(x,Y) 0;
%C = @(x,Y) Y(5)*0.975;
%C = @(x,Y) Y(5) + 3*Y(6);
%C = @(x,Y) Y(5) - 0.1 + 3*Y(6);
%C = @(x,Y) Y(5) - 0.1*sawtooth(x/120*2*pi) + 3*Y(6);
%C = @(x,Y) Y(5) + 0.06*cos(Y(1)/240*2*pi) + 3*Y(6);
C = @(x,Y) Y(5) + 0.1*tanh(atan((Y(2)-Y(4))/(Y(1)-Y(3)))+pi/2.1) + 3*Y(6);


%C = @(x,Y) 2 * Y(5) + 5 * sign(Y(5)) * Y(5) ^ 2;
%C = @(x,Y) 5*tan(Y(5))*cos(Y(7));
%C = @(x,Y) Y(5) + sign(Y(6))*Y(6)^2*2;
%C = @(x,Y) (l*tan(Y(5))*cos(Y(7))^2/(2*v) - v* sin(Y(7))*cos(Y(7)) + v*h*sin(Y(5))*sin(Y(7))^2/l);

%Y = [xf,yf,xb,yb,theta,theta dot,alpha]
F = @(x,Y) [v*((Y(1)-Y(3))-tan(Y(7))*(Y(2)-Y(4)))/l,...
            v*(tan(Y(7))*(Y(1)-Y(3))+(Y(2)-Y(4)))/l,...
            v*(Y(1)-Y(3))/l,...
            v*(Y(2)-Y(4))/l,...
            Y(6),...
            -v^2*cos(Y(5))*tan(Y(7))/(h*l) - b/h*(v*sec(Y(7))^2/l*C(x,Y))*cos(Y(5)) + v^2*tan(Y(7))/l*sin(Y(5))*cos(Y(5))+g/h*sin(Y(5)),...
            C(x,Y)]';

        
options = odeset('MaxStep',0.3,'Events',@events1);
sol = ode15s(F,[0,FinalTime],ICs,options);

figure
%plot(sol.x,sol.y)

%Loop to show motion of the bicycle

%
plot([sol.y(1,:);sol.y(3,:)],[sol.y(2,:);sol.y(4,:)]);
axis equal;
%plot3([sol.y(1,:);sol.y(3,:)],[sol.y(2,:);sol.y(4,:)],[sol.y(5,:);sol.y(5,:)]);


figure
Animation(sol,l,b,h);

% 
% v = 5;
% l = 2;
% 
% alpha = @(t) pi/16 * cos(t);
% 
% 
% %Y = [xf,yf,xb,yb]
% F = @(t,Y)[v*((Y(1)-Y(3))-tan(alpha(t))*(Y(2)-Y(4)))/l,...
%            v*(tan(alpha(t))*(Y(1)-Y(3))+(Y(2)-Y(4)))/l,...
%            v*(Y(1)-Y(3))/l,...
%            v*(Y(2)-Y(4))/l]';
% Y0 = [3,1,1,1];
% 
% options = odeset('MaxStep',0.3,'abstol',10^-6,'reltol',10^-6);
% sol = ode23t(F,0:10,Y0,options);
% 
% 
% 
% for i = 1:length(sol.x)
%     
%    
%     plot([sol.y(1,i),sol.y(3,i)],[sol.y(2,i),sol.y(4,i)]);
%      grid on;
%     axis equal;
%     %axis([-6,6,-6,6])
%     axis([-3+sol.y(1,i),3+sol.y(1,i),-3+sol.y(2,i),3+sol.y(2,i)])
%     disp(sqrt((sol.y(1,i)-sol.y(3,i))^2+(sol.y(2,i)-sol.y(4,i))^2));
% %     pause(0.1);
%     if i ~= length(sol.x)
%         pause(sol.x(i+1)-sol.x(i));
%     end
%     
% end
% 
% plot(sol.y(1,:),sol.y(2,:),sol.y(3,:),sol.y(4,:))
% axis equal;