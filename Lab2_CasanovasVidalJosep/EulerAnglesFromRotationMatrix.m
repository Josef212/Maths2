function [eulAng]  = EulerAnglesFromRotationMatrix(R)

theta = -asin(R(3,1));
eulAng(2) = theta;

if(cos(theta)==0 && R(3,1) == 1)
    eulAng(3)=0;
    eulAng(1) = atan2(-R(2, 3),-R(1, 3));
    
elseif(cos(theta)==0 && R(3,1) == -1)
    eulAng(3)=0;
    eulAng(1) = atan2(R(2, 3),R(1, 3));
 
else
 eulAng(3) = atan2(R(3,2)/cos(theta), R(3,3)/cos(theta));           
 eulAng(1) = atan2(R(2,1)/cos(theta), R(1,1)/cos(theta));
    
end