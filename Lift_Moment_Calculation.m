function [Cl,Cm,L,M] = Lift_Moment_Calculation(gamma,alfa,pv,density)

    pannel_lift=density*gamma;
    L=sum(pannel_lift)
    Cl=(2*sum(gamma))


    M=-sum(pv(1,:)*pannel_lift*cos(alfa))
    Cm=((-2)*sum((pv(1,:)-0.25)*gamma*cos(alfa)))
end

