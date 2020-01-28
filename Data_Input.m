function [f,p,t,alfa,N,x_h,eta,option] = Data_Input(NACA)
    %Separation of the different numbers of the NACA airfoil value
    fpt =str2double(regexp(num2str(NACA),'\d','match'));
    
    if size(fpt,2)==4
        %Calculation of the properties of the airfoil
        f = 0.01*fpt(1);
        p = 0.1*fpt(2);
        t = 0.1*fpt(3)+0.01*fpt(4);
        %Discard non valid NACA number (Max. camber value without camber or no
        %thickness
        if((p==0 && f~=0) || t==0)
            fprintf('Please, restart & insert a valid NACA designation\n')
            return
        end

        prompt='Insert the number of pannels for the analysis: N=';
        N = input (prompt) + 1;

    %Symmetric airfoils
    elseif size(fpt,2)==2
        N=0;
        f=0;
        p=0;
        t = 0.1*fpt(1)+0.01*fpt(2);
        if t==0
            fprintf('Please, restart & insert a valid NACA designation\n')
            return
        end
        
    elseif size(fpt,2)==1
        N=0;
        f=0;
        p=0;
        t = 0.01*fpt(1);
        if t==0
            fprintf('Please, restart & insert a valid NACA designation\n')
            return
        end
    end
    
    
    
    prompt= 'Attack angle in degrees: ';
    alfa = (pi/180)*input(prompt);
    while(alfa>=0.35 || alfa<=(-0.35))
        prompt='Wrong value. Please insert an angle between 20º/-20º:';
        alfa = (pi/180)*input(prompt);
    end
    
    
    
    prompt= 'Has your airfoil a flap? Yes[1]/No[0]:';
    option= input (prompt);
    
    while(option~=1 && option~=0)
        prompt='Wrong value. Please insert 1 for Yes or 0 for No:';
        option=input(prompt);
    end
    
    if (option==1)
        prompt= 'Insert relative position of the beggining of the flap regarding the chord lenght given as a fraction of unity: x_h/c=';
        x_h=input(prompt);
        
        while(x_h>1 || x_h==0 || x_h==1)
            prompt='Wrong value. Please insert a value between 0 and 1 (both not included):';
            x_h=input(prompt);
        end
        
        prompt= 'Insert deflection angle of the flap in degrees: ';
        eta = (pi/180)*input(prompt);
        while(eta>1.57 || eta<(-1.57))
        prompt='Wrong value. Please insert an angle between 90º/-90º:';
        eta = (pi/180)*input(prompt);
        end
    end

    if (option==0)
        x_h=1;
        eta=0;
    end
end

