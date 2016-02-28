function Animation(sol,l,b,h)
    t = 0;
    for i = 1:length(sol.x)-1
        t = t+(sol.x(i+1)-sol.x(i));
        if t > 0.05
            t = 0;
            plot3([sol.y(1,i),sol.y(3,i),sol.y(3,i)*(1-b/l) + b* sol.y(1,i)/l - (sol.y(2,i)-sol.y(4,i))*h*sin(sol.y(5,i)),sol.y(1,i)],...
                  [sol.y(2,i),sol.y(4,i),sol.y(4,i)*(1-b/l) + b* sol.y(2,i)/l - (sol.y(3,i)-sol.y(1,i))*h*sin(sol.y(5,i)),sol.y(2,i)],...
                  [0,0,h*cos(sol.y(5,i)),0]);
            grid on;
            axis equal;
            %axis([-6,6,-6,6])
            axis([-5+sol.y(1,i),5+sol.y(1,i),-5+sol.y(2,i),5+sol.y(2,i),0,3])
            %disp(sqrt((sol.y(1,i)-sol.y(3,i))^2+(sol.y(2,i)-sol.y(4,i))^2));
            %pause(0.1);
            pause(0.05);
        end

    end
end