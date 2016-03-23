% Function to compute error given a point and two transformation matrices
%
% Function created on feb 25 by Eric Braun 10121660

function [Error] = ComputeError(Point,T1,T2)

% Add buffer to point
Point(4) = 1;


translated1 = T1 * Point';

translated2 = T2 * Point';

Error = norm(translated2-translated1);


end