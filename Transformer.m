% Function used to create a transformation matrix between CT and fiducial
% cage
%
% I choose to define the FC coordinate system as the center of the cage

% Function created on Februrary 25, 2016 by Eric Braun 10121660

function [T] = Transformer(M1,M2,M3,M4,M5,M6,M7,M8,M9,a)

% Create the x and y dimensions for the fiducial cage points
P1 = [-((M8(1)-M2(1))/2),-(M3(2)-M1(2))/2];
P2 = [-((M8(1)-M2(1))/2),(M3(2)-M1(2))/2 - (M3(2)-M2(2))];
P3 = [-((M8(1)-M2(1))/2),(M3(2)-M1(2))/2];
P4 = [-(M6(1)-M4(1))/2,(M6(2)-M9(2))*(3/4)];
P5 = [((M6(1)-M4(1))/2) - (M6(1)-M5(1)),(M6(2)-M9(2))*(3/4)];
P6 = [(M6(1) - M4(1))/2,(M6(2)-M9(2))*(3/4)];
P7 = [((M8(1)-M2(1))/2),(M7(2)-M9(2))/2];
P8 = [((M8(1)-M2(1))/2),(M7(2)-M9(2))/2 - (M7(2)-M8(2))];
P9 = [((M8(1)-M2(1))/2),-(M7(2)-M9(2))/2];
%P1 = M1;% - 125;
%P2 = M2;% - 125;
%P3 = M3;% - 125;
%P4 = M4;% - 125;
%P5 = M5;% - 125;
%P6 = M6;% - 125;
%P7 = M7;% - 125;
%P8 = M8;% - 125;
%P9 = M9;% - 125;

% Diagnonal length of Z motif
L = sqrt(2*(a.^2));

% Calculate the z value for first Z motif
d12 = sqrt((P2(1)-P1(1)).^2 + (P2(2)-P1(2)).^2);
d23 = sqrt((P3(1)-P2(1)).^2 + (P3(2)-P2(2)).^2);

c1 = L * (d12/(d12 + d23)) - L/2;
z1 = cos(degtorad(45)) * c1;
P2(3) = z1

% Calculate the z value for the second Z motif
d45 = sqrt((P5(1)-P4(1)).^2 + (P5(2)-P4(2)).^2);
d56 = sqrt((P6(1)-P5(1)).^2 + (P6(2)-P5(2)).^2);

c2 = L * (d45/(d45 + d56)) - L/2;
z2 = cos(degtorad(45)) * c2;
P5(3) = z2

% Calculate the z value for the thrid Z motif
d78 = sqrt((P8(1)-P7(1)).^2 + (P8(2)-P7(2)).^2);
d89 = sqrt((P9(1)-P8(1)).^2 + (P9(2)-P8(2)).^2);

c3 = L * (d89/(d78 + d89)) - L/2;
z3 = cos(degtorad(45)) * c3;
P8(3) = z3

% Create the transformation matrix between fiducal cage system grounded at
% center, made by 3 center points and the CT original points

[T] = FidReg(M8,M5,M2,P8,P5,P2);
end