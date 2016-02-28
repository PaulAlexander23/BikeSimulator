function [value,isterminal,direction] = events1(t,y)
    value = abs(y(5))-pi/2;
    direction = 0;
    isterminal = 1;
end

