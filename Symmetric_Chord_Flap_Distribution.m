function [x,y,Val,N] = Symmetric_Chord_Flap_Distribution(x_h,eta,option)
    if option==0
        Val=[0 1;0 0]; %If there is no flap, only one pannel is needed
    else
        Flap_vector=[1-x_h;0]; %If there is flap, we only need to rotate the Tail Edge point
        Rot=[cos(eta) sin(eta); -sin(eta) cos(eta)];
        Flap_Rot=Rot*Flap_vector;

        Val=[0 x_h x_h+Flap_Rot(1,1);0 0 Flap_Rot(2,1)]; %At the end we only have two pannels
    end
    N=size(Val,2);
    x=0:0.01:1;
    y=zeros(1,101);
end

