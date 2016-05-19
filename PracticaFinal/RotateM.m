function  MR = RotateM(Ea)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    M = [ -1  -1 1;   %Node 1
        -1   1 1;   %Node 2
        1   1 1;   %Node 3
        1  -1 1;   %Node 4
        -1  -1 -1;  %Node 5
        -1   1 -1;  %Node 6
        1   1 -1;  %Node 7
        1  -1 -1]'; %Node 8
    Ea = Ea*pi/180;

    MR = (EulerAngles2rotM(Ea(1),Ea(2),Ea(3))*M);

 
end

