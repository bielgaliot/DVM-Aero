clc,clear

density=1.225; %[kg/m^3] Earth atmosphere density

prompt= 'Insert the 4 digits of the NACA airfoil: NACA';
NACA =input(prompt);

if (NACA>=1100 && NACA<=9999)
    [f,p,t,alfa,N,x_h,eta,option]=Data_Input(NACA);
    [x,y]=Chord_Distribution(N,f,p);
    Val=[x;y];
 
    if option==1
    [Val]=Flap_Distribution(Val,x_h,eta);
    end
    
    
    [gamma,pv] = Gamma_Distribution(Val,alfa,N);
    [Cl,Cm,L,M] = Lift_Moment_Calculation(gamma,alfa,pv,density);
    
    
elseif (NACA<100)    
    [f,p,t,alfa,N,x_h,eta,option]=Data_Input(NACA);
    [x,y,Val,N]=Symmetric_Chord_Flap_Distribution(x_h,eta,option);
    [gamma,pv] = Gamma_Distribution(Val,alfa,N);
    [Cl,Cm,L,M] = Lift_Moment_Calculation(gamma,alfa,pv,density);
    
elseif ((NACA<1100 && NACA>100)||(NACA>9999))
        fprintf('Please, restart & insert a valid NACA designation\n')
        return
end

    [z_u,z_l] = Plotting(x,y,N,t,f);
    plot(x, z_u, x, z_l)
    ylim([-0.5,0.5]);
    hold on
    plot(Val(1,:),Val(2,:),'-o')
