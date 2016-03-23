function [T] = FidReg(F1,F2,F3,M1,M2,M3)

[e1,e2,e3,c1] = CartesianSystem(F1,F2,F3);
[v1,v2,v3,c2] = CartesianSystem(M1,M2,M3);

[o1,o2,o3,oc] = CartesianSystem([0,0,0],[1,0,0],[0,1,0]);

Trans = [1,0,0, c2(1) - c1(1);
         0,1,0, c2(2) - c1(2);
         0,0,1, c2(3) - c1(3);
         0,0,0,     1       ];
     
Rotation1 = [dot(e1,o1), dot(e1,o2), dot(e1,o3),0; 
             dot(e2,o1), dot(e2,o2), dot(e2,o3),0;
             dot(e3,o1), dot(e3,o2), dot(e3,o3),0;
                  0     ,     0     ,     0     , 1];

     
Rotation2 = [dot(v1,o1), dot(v1,o2), dot(v1,o3),0; 
             dot(v2,o1), dot(v2,o2), dot(v2,o3),0;
             dot(v3,o1), dot(v3,o2), dot(v3,o3),0;
                  0     ,     0     ,     0     , 1] ;       
              
% Rotation from Scanner to Fiducial
R1 = [e1(1), e2(1), e3(1), 0;
     e1(2), e2(2), e3(2), 0;
     e1(3), e2(3), e3(3), 0;
       0  ,   0  ,    0 , 1];
   
% Translation from Scanner to Fiducial
Trans1 = [1,0,0, -c1(1);
          0,1,0, -c1(2);
          0,0,1, -c1(3);
          0,0,0, 1 ];
 
% Transformation from Scanner to Fiducial


% Transformation from Fiducial to Scanner

% Rotation from Scanner to Marker
R2 = [v1(1), v2(1), v3(1);
      v1(2), v2(2), v3(2);
      v1(3), v2(3), v3(3)];
  
% Translation from Scanner to Marker
Trans2 = [1,0,0, c2(1);
          0,1,0, c2(2);
          0,0,1, c2(3);
          0,0,0,       1      ];
      
% Transformation from Scanner to Marker
T = Trans2 * Rotation2' * Rotation1 * Trans1;
 
end