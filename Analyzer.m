% Function to analyze the simulator and transformer for CT scan with
% fiducial cage around a patient for HW3 CISC 472
%
% Function created on February 25, 2016 by Eric Braun 10121660

function [FRE, TRE] = Analyzer(FLEMax)

% Create values between -45 and 45 to be used as the CT transformation
angles = zeros(10,2);
for i = 1:10
   angles(i,1) =  (15 * (2 * rand - 1));
   angles(i,2) = (15 * (2 * rand - 1));
   
   % Create transformation matrix using angles
   T = createTransformation(angles(i,1),angles(i,2));
   
   % Calculate CT points using transformation matrix
   [m1,m2,m3,m4,m5,m6,m7,m8,m9] = Simulator(T,100);
   close all;
   
   % Spoil points using FLE
   sP1 = addFLE(m1,FLEMax);
   sP2 = addFLE(m2,FLEMax);
   sP3 = addFLE(m3,FLEMax);
   sP4 = addFLE(m4,FLEMax);
   sP5 = addFLE(m5,FLEMax);
   sP6 = addFLE(m6,FLEMax);
   sP7 = addFLE(m7,FLEMax);
   sP8 = addFLE(m8,FLEMax);
   sP9 = addFLE(m9,FLEMax);
   
   % Create 30 random target points
   [TargetPoints] = RandomPoints();
   
   % Create transformation matrix between CT and fiducial cage using
   % Transformer
   Trans = Transformer(sP1,sP2,sP3,sP4,sP5,sP6,sP7,sP8,sP9,100);

   FRE1 = ComputeError(sP1,T,Trans);
   FRE2 = ComputeError(sP2,T,Trans);
   FRE3 = ComputeError(sP3,T,Trans);
   FRE4 = ComputeError(sP4,T,Trans);
   FRE5 = ComputeError(sP5,T,Trans);
   FRE6 = ComputeError(sP6,T,Trans);
   FRE7 = ComputeError(sP7,T,Trans);
   FRE8 = ComputeError(sP8,T,Trans);
   FRE9 = ComputeError(sP9,T,Trans);
   
   disp('Average FRE:');
   FRE = (FRE1+FRE2+FRE3+FRE4+FRE5+FRE6+FRE7+FRE8+FRE9)/9;
   disp(FRE);
   stdFRE = std([FRE1,FRE2,FRE3,FRE4,FRE5,FRE6,FRE7,FRE8,FRE9])
   
   TREs = zeros(1,30);
   for j = 1:30
       TREs(i) = norm(T*(TargetPoints(i,:))' - Trans*(TargetPoints(i,:))');
   end
   
   TRE = mean(TREs);
   stdTRE = std(TREs);
end

end
