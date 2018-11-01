function D=WaterDiff(T) % T in Celsius 

Ts=215.05; %+/-1.2K 
k=2.063; %+/-0.051 
D0=1.635*10^(-8); %+/- 0.002 m^2/s 
D=D0*((T+273.15)/Ts-1).^k;
