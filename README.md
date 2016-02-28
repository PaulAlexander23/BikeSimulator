# BikeSimulator

## 1 Model the motion of a bicycle in MATLAB

First I consider the motion of the wheels as their path is only dependent on the steering angle, see BikeTrailsUsingAlpha.m. Then I used angular momentum to determine the motion of the centre of mass, see TiltChange.m. Finally I combine the two in PhysicsEngine.m which uses events1.m to determine when it crashes and Animation.m to plot the bike.

I gave a colloquium talk on this project 27/01/16 and made the presentation for that. It roughly explains the maths behind what I did but obviously I explained it in more detail in the talk. It also has a short section on Gradient Descent which is a learning algorithm which I was planning to implement.

## 2 Implement a simple learning algorithm - WIP

Objective: Without much outside help, the computer should, over multiple runs, increase the length of time it is able to maintain upright and become more stable.
