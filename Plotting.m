function [z_u,z_l] = Plotting(x,y,N,t,f)

    if f==0
        N=101;
    end
    
    i=1;
    y_t=zeros(1,N); %y_t: y_thickness
    while i<=N
        y_t(i)=(t/0.2)*(0.2969*sqrt(x(i))-0.1260*x(i)-0.3516*(x(i))^2+0.2843*(x(i))^3-0.1015*(x(i))^4);
        i=i+1;
    end

    z_u=y+y_t; %upperside (z_upper)
    z_l=y-y_t; %lowerside (z_lower)
    
end

