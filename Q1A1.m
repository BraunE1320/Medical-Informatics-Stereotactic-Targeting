% Question one of Asssignment one, CISC 330 
% The function takes in parameters of two points on a line, a point on a
% plane and a normal vector on the plane.
% The function outputs the point of intersection of the line defined by the
% two points and plane defined by the point and vector.
% 
% Function created on September 29, 2015
% By Eric Braun ID 10121660


function [IntersectPoint] = Q1A1(A, B, C, D)

Point1 = [A(1); A(2); A(3)]; % First point in the line
Point = [B(1); B(2); B(3)]; % Second point in the line
dirVec = [Point(1)-Point1(1); Point(2)-Point1(2); Point(3)-Point1(3)]; % Direction Vector on line AB = B - A
normVec = dirVec/norm(dirVec); % Normalize the direction vector.


                                                                                                                                 
PlanePoint = [C(1); C(2); C(3)]; % Point on plane
PlaneVector = [D(1); D(2); D(3)]; % Already normalized. 

% Find the distance of the plane equation d = -ax -by -cz
d = (PlanePoint(1)*PlaneVector(1)) + (PlanePoint(2)*PlaneVector(2)) + (PlanePoint(3)*PlaneVector(3));

% Multiply normal plane vector by first point and subtract to find the
% constant in the equation to find t
d = d - ((PlaneVector(1)*Point1(1)) + (PlaneVector(2) * Point1(2)) + (PlaneVector(3)*Point1(3)));

% Multiple normal plane vector by the normalized line vertor and add to
% find the amount t is multiplied by.
t = ((PlaneVector(1)*normVec(1)) + (PlaneVector(2)*normVec(2)) + (PlaneVector(3) * normVec(3)));

% Divide the constant on the left of equation by constant multipled by t to
% find the real t of the line formula
t = d/t;

% Plug t into the Line formula L = P - t(v)
IntersectPoint = [Point1(1) + t*(normVec(1)); 
                  Point1(2) + t*(normVec(2)); 
                  Point1(3) + t*(normVec(3))];
end
