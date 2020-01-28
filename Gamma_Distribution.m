function [gamma,pv] = Gamma_Distribution(Val,alfa,N)

   pv=zeros(2,N-1); %Vortex positions matrix (1/4 of the chord)
   ppc=zeros(2,N-1); %Control point positions matrix (3/4 of the chord)
   c=zeros(1,N-1); %Pannels length matrix
   nor=zeros(2,N-1); %Normal vectors of the pannels matrix
   for m = 1:N-1
        pv(:,m) =Val(:,m) + 0.25.*(Val(:,m+1)-Val(:,m));  %xi+0.25*delta(x) 
        ppc(:,m) = 0.75.*(Val(:,m+1)-Val(:,m))+Val(:,m);   %x+0.25*delta(x)
        
        c(m)= sqrt((Val(1,m+1)-Val(1,m))^2+(Val(2,m+1)-Val(2,m))^2); %chord=sqrt(delta(x^2) +delta(z^2))
        
        nor(1,m) =  (-(Val(2,m+1)-Val(2,m)))/c(m);    %nor=(-delta(z/c), delta(x/c))         
        
	nor(2,m) =   ((Val(1,m+1)-Val(1,m)))/c(m); 
   end
   nTrans=nor.';
      
 
   % Unitary vortex generated speed   
   u_uni=zeros(N-1,N-1); 
   w_uni=zeros(N-1,N-1);

    for i = 1:N-1  
        for j = 1:N-1  
            rq=((ppc(1,i)-pv(1,j))^2 + (ppc(2,i)-pv(2,j))^2);

            u_uni (i,j)= 1/(2.*pi.*rq).* (ppc(2,i)-pv(2,j));
            w_uni (i,j)= -1/(2.*pi.*rq).* (ppc(1,i)-pv(1,j));

        end

    end
    
    % System of equations and resolution
    A= u_uni.*transpose (nor(1,:)) + w_uni.*transpose (nor(2,:)); 
    alfa_mat= [cos(alfa);sin(alfa)];
    RHS= -nTrans*alfa_mat;

    gamma = A\RHS;
    
end

