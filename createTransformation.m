% Helped function to quickly make Transformation matrix from rotation in x
% and y direction
%
% Function created on February 25, 2016 by Eric Braun 10121660

function [T] = createTransformation(degreeX, degreeY)

angleX = degtorad(degreeX);
angleY = degtorad(degreeY);

Rotx = [1,     0,             0,      0;
        0, cos(angleX), sin(angleX), 0;
        0, -sin(angleX), cos(angleX),  0;
        0,     0      ,       0,      1];
    
Roty = [cos(angleY), 0, -sin(angleY), 0;
            0      , 1,     0,       0;
        sin(angleY), 0, cos(angleY), 0;
            0,       0,      0,      1];
        
T = Roty * Rotx;


end