% function randomCircle creates N random points on a circle with radius,
% Radius centered around point Center. Allows Maxoff error and set the z
% value.
% Similar to the random points on sphere except setting z to one value.
% Created on October 29, 2015 by Eric Braun 10121660

function [Points] = randomCircle(Center, Radius, N, Maxoff, Z)


theta = pi * 2 * rand(1, N);
phi = pi;
[x,y,z] = sph2cart(theta,phi,ones(1,N));

% Only difference from Question 5 is adding a random number between 0 and
% maxoff to add to coordinates.
for i = 1:N
    x(i) = (x(i) * Radius + Center(1) + randi([-Maxoff, Maxoff])); 
    y(i) = (y(i) * Radius + Center(2) + randi([-Maxoff, Maxoff]));
    % Z value is a fixed value.
    z(i) = Z;
end

plot3(x,y,z,'.');
Points = [x;y;z];
str = sprintf('Circle at (%d,%d,%d), radius of %d, %d random points, and max offset of %d', Center, Radius, N, Maxoff);
title(str);
end

