% Function to simulate a CT scan through fiducal cage around a patients
% head. Instead of rotating/moving the CT we will be transforming the
% fiducal cage rods by a given transformation matrix.
%
% Function created on February 26, 2016 by Eric Braun 10121660

function [M1,M2,M3,M4,M5,M6,M7,M8,M9] = Simulator(T,a)

% Create plot to show fidicual cage witin CT FOV
figure();
axis([(-2.5*a) (2.5*a) (-2.5*a) (5*a) (-1.0*a) (1.0*a)]);
hold on;

% Define the CT plane using point on place and a norm vector
CT = [0,0,0];
CTnorm = [0,0,1];

% Plot CT Plane
d = -CT * CTnorm';
[xx,yy] = ndgrid((-2.5*a):(2.5*a),(-2.5*a):(5*a));
z = (-CTnorm(1)*xx - CTnorm(2)*yy - d)/CTnorm(3);
h = surf(xx,yy,z);
set(h, 'LineStyle', 'none');
set(h,'FaceColor',[1 0 0], 'FaceAlpha', 0.5);
hold on;

% Create the fiducial rod points for Left side Z motif
LeftPostTop = [a, (-a/2), a/2, 1];
LeftPostBottom = [a, (-a/2), (-a/2), 1];
LeftAntTop = [a, (a/2), (a/2), 1];
LeftAntBottom = [a, (a/2), (-a/2), 1];

% Transform points using Transformation matrix
LeftPostTop2 = (T * LeftPostTop')';
LeftPostBottom2 = (T * LeftPostBottom')';
LeftAntTop2 = (T * LeftAntTop')';
LeftAntBottom2 = (T * LeftAntBottom')';

% Create the bar between two points for Left side
LeftPostBar = [LeftPostTop2; LeftPostBottom2];
LeftDiagBar = [LeftPostTop2; LeftAntBottom2];
LeftAntBar = [LeftAntTop2; LeftAntBottom2]; 

% Plot Left Z cage
plot3([LeftPostTop2(1),LeftPostBottom2(1)],[LeftPostTop2(2),LeftPostBottom2(2)],[LeftPostTop2(3),LeftPostBottom2(3)],'Color','r');
hold on;
plot3([LeftPostTop2(1),LeftAntBottom2(1)],[LeftPostTop2(2),LeftAntBottom2(2)],[LeftPostTop2(3),LeftAntBottom2(3)],'Color','r');
hold on;
plot3([LeftAntTop2(1),LeftAntBottom2(1)],[LeftAntTop2(2),LeftAntBottom2(2)],[LeftAntTop2(3),LeftAntBottom2(3)],'Color','r');
hold on;


% Create the fidcual bar points for the Anterior Z motrif
AntLeftTop = [a/2, (3*a)/2, a/2, 1];
AntLeftBottom = [a/2, (3*a)/2, -a/2, 1];
AntRightTop = [-a/2, (3*a)/2, a/2, 1];
AntRightBottom = [-a/2, (3*a)/2, -a/2, 1];

% Transform points using Transformation matrix
AntLeftTop2 = (T * AntLeftTop')';
AntLeftBottom2 = (T * AntLeftBottom')';
AntRightTop2 = (T * AntRightTop')';
AntRightBottom2 = (T * AntRightBottom')';

% Create the bar between two points for Anterior side
AntRightBar = [AntRightTop2; AntRightBottom2];
AntDiagBar = [AntRightTop2; AntLeftBottom2];
AntLeftBar = [AntLeftTop2; AntLeftBottom2];

% Plot Anterior Z cage
plot3([AntRightTop2(1),AntRightBottom2(1)],[AntRightTop2(2),AntRightBottom2(2)],[AntRightTop2(3),AntRightBottom2(3)],'Color','r');
hold on;
plot3([AntRightTop2(1),AntLeftBottom2(1)],[AntRightTop2(2),AntLeftBottom2(2)],[AntRightTop2(3),AntLeftBottom2(3)],'Color','r');
hold on;
plot3([AntLeftTop2(1),AntLeftBottom2(1)],[AntLeftTop2(2),AntLeftBottom2(2)],[AntLeftTop2(3),AntLeftBottom2(3)],'Color','r');
hold on;

% Create the fidcual points for bar for the Right Z motif
RightAntTop = [-a, (a/2), (a/2), 1];
RightAntBottom = [-a, (a/2), -(a/2), 1];
RightPostTop = [-a, (-a/2), a/2, 1];
RightPostBottom = [-a, (-a/2), -a/2, 1];

% Transform points using Transformation matrix
RightAntTop2 = (T * RightAntTop')';
RightAntBottom2 = (T * RightAntBottom')';
RightPostTop2 = (T * RightPostTop')';
RightPostBottom2 = (T * RightPostBottom')';

% Create the bar lines for Right Side Z motif
RightPostBar = [RightPostTop2; RightPostBottom2];
RightDiagBar = [RightPostTop2; RightAntBottom2];
RightAntBar = [RightAntTop2; RightAntBottom2];

plot3([RightPostTop2(1),RightPostBottom2(1)],[RightPostTop2(2),RightPostBottom2(2)],[RightPostTop2(3),RightPostBottom2(3)],'Color','r');
hold on;
plot3([RightPostTop2(1),RightAntBottom2(1)],[RightPostTop2(2),RightAntBottom2(2)],[RightPostTop2(3),RightAntBottom2(3)],'Color','r');
hold on;
plot3([RightAntTop2(1),RightAntBottom2(1)],[RightAntTop2(2),RightAntBottom2(2)],[RightAntTop2(3),RightAntBottom2(3)],'Color','r');
hold on;


% Find the intersection point between 9 rods and CT scan plane to find the
% 9 marker points

M1 = Q1A1(RightPostBar(1,:),RightPostBar(2,:),CT,CTnorm);
plot3(M1(1),M1(2),M1(3),'.b','MarkerSize',20);
hold on;
M2 = Q1A1(RightDiagBar(1,:),RightDiagBar(2,:),CT,CTnorm);
plot3(M2(1),M2(2),M2(3),'.b','MarkerSize',20);
hold on;
M3 = Q1A1(RightAntBar(1,:),RightAntBar(2,:),CT,CTnorm);
plot3(M3(1),M3(2),M3(3),'.b','MarkerSize',20);
hold on;
M4 = Q1A1(AntRightBar(1,:),AntRightBar(2,:),CT,CTnorm);
plot3(M4(1),M4(2),M4(3),'.b','MarkerSize',20);
hold on;
M5 = Q1A1(AntDiagBar(1,:),AntDiagBar(2,:),CT,CTnorm);
plot3(M5(1),M5(2),M5(3),'.b','MarkerSize',20);
hold on;
M6 = Q1A1(AntLeftBar(1,:),AntLeftBar(2,:),CT,CTnorm);
plot3(M6(1),M6(2),M6(3),'.b','MarkerSize',20);
hold on;
M7 = Q1A1(LeftAntBar(1,:),LeftAntBar(2,:),CT,CTnorm);
plot3(M7(1),M7(2),M7(3),'.b','MarkerSize',20);
hold on;
M8 = Q1A1(LeftDiagBar(1,:),LeftDiagBar(2,:),CT,CTnorm);
plot3(M8(1),M8(2),M8(3),'.b','MarkerSize',20);
hold on;
M9 = Q1A1(LeftPostBar(1,:),LeftPostBar(2,:),CT,CTnorm);
plot3(M9(1),M9(2),M9(3),'.b','MarkerSize',20);
hold on;

end