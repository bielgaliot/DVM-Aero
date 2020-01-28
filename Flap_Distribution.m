function [Val] = Flap_Distribution(Val,x_h,eta)
    x_flap_i=find(Val(1,:)>x_h); %Matrix positions of the points forward the flap beggining
    Flap=Val(:,x_flap_i); %Matrix of the flap points

    dim= size(Flap, 2);   %Number of columns of the matrix
    
    
    %Vectors of the points of the flap to be rotated
    vectors_flap = zeros(2, dim-1); 
    
    for i=1:(dim-1)
        vectors_flap(:,i)=Flap(:,i+1)- Flap(:,i);                                     
    end

    rot=[cos(eta) sin(eta); -sin(eta) cos(eta)]; %Clockwise rotation matrix 
    
    
    %Rotation of each point of the flap
    vectors_flap_rotats = zeros(2, dim-1);
    for i=1:(dim-1)
        vectors_flap_rotats(:,i) = rot*vectors_flap(:,i); 
    end
    

    %New chord distribution
    for i=1:(dim-1)
    Val(:,(x_flap_i(i)+1))=Val(:,(x_flap_i(i)))+vectors_flap_rotats(:,i);
    end

end

