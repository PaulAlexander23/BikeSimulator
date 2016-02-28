% Bike Trails

%A Script which generates the path the wheels of a bicycle take given the
%angle the handlebars are turned at, alpha(t).

%Constants
v = 5; %Speed
l = 2; %Length

%Turn angle
alpha = @(t) pi/16 * cos(t);

%ODE to solve
%Y = [xf,yf,xb,yb]
F = @(t,Y)[v*((Y(1)-Y(3))-tan(alpha(t))*(Y(2)-Y(4)))/l,...
           v*(tan(alpha(t))*(Y(1)-Y(3))+(Y(2)-Y(4)))/l,...
           v*(Y(1)-Y(3))/l,...
           v*(Y(2)-Y(4))/l]';      

%Initial Values
Y0 = [3,1,1,1];

options = odeset('MaxStep',0.1,'abstol',10^-6,'reltol',10^-6);
sol = ode23t(F,0:10,Y0,options);

%Loop to show motion of the bicycle
i = 1;
ct = 0;
while i < length(sol.x)-1
    
    plot([sol.y(1,i),sol.y(3,i)],[sol.y(2,i),sol.y(4,i)]);
     grid on;
    axis equal;
    %axis([-6,6,-6,6])
    axis([-3+sol.y(1,i),3+sol.y(1,i),-3+sol.y(2,i),3+sol.y(2,i)])
    
%disp(sqrt((sol.y(1,i)-sol.y(3,i))^2+(sol.y(2,i)-sol.y(4,i))^2));

    ct = sol.x(i);
    while i <length(sol.x)-1 && abs(sol.x(i)-ct) < 0.02 
        i = i + 1;
    end
    if i ~= length(sol.x)
        pause(sol.x(i)-ct);
    end
end

%Plotting full curves
plot(sol.y(1,:),sol.y(2,:),sol.y(3,:),sol.y(4,:))
axis equal;