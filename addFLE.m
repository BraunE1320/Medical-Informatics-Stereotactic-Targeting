% Function to add FLE error to poitns
% I choose to only spoil along the x and y axis because a CT scan wouldnt
% ever rotate around the y axis as to change it
%
% Function created on feb 25 by Eric braun 10121660

function [newPoint] = addFLE(Point, FLEmax)

% Create random interval to FLEmax
long = 2*pi*rand;
radius = FLEmax*rand;

% Change x and y componenet
newPoint(1) = (radius * cos(long)) + Point(1);
newPoint(2) = (radius * sin(long)) + Point(2);
% Keep z componenet the same
newPoint(3) = Point(3);

end