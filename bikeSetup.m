

reach = 387;
stack = 577;
top_tube = 560;
seat_tube = 533;
head_angle = 73.5;
seat_angle = 73.3;
head_tube = 170;
chainstay = 407;
wheelbase = 980;
standover = 781;
bb_drop = 70;
fork_rake = 40;
trail = 58;
wheel_diameter = 700;

bb = [0; 0];
seat_tube_top = bb + [cos(seat_angle*pi/180),sin(seat_angle*pi/180);-sin(seat_angle*pi/180),cos(seat_angle*pi/180)] * [seat_tube; 0];

points = [bb,seat_tube_top];
hold on;
for index = 1:2
    plot(points(index,1),point(index,2),'.b');
end
