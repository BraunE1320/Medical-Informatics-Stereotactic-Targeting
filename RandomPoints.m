% Function to create random points within center of target for CT 
%
function [Points] = RandomPoints()

Points = zeros(30,4);

for i = 1:30
    radi = 2*rand-1;
    lat = asin(radi);
    long = 2 * pi * rand;
    radius = 50;
    Points(i,1) = (radius * cos(lat) * cos(long)) + 125;
    Points(i,2) = (radius * cos(lat) * sin(long)) + 125;
    Points(i,3) = (radius * sin(lat));
    Points(i,4) = 1;
end

end