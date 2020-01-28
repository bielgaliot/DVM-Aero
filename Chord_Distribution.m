function [x,y] = Chord_Distribution(N,f,p)
%Distribution of the points of the chord
a=1:N;
x=0.5*(1-cos(((a-1)/(N-1))*pi)); %Full cosine

%Value of chamber in the points set before
y=zeros(1,N);
i=1;
while(x(i)<=p)
    y(i)=(f/p^2)*(2*p*x(i)-(x(i))^2); %NACA 4 digits formula (Leading Edge - Max.camber)
    i=i+1;
end    
while (x(i)>=p && i<N)
    y(i)=(f/(1-p)^2)*(1-2*p+2*p*x(i)-(x(i))^2); %NACA 4 digits formula (Max.camber - Tail Edge)
    i=i+1;
end
y(N)=0;

end

