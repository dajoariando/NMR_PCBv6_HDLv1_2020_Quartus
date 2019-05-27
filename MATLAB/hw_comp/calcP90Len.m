function [ voltage, current, power,B,t ] = KeaCalc90Length(keaPower,rs,L,frequency,numTurns,coilLength)
%KEACALC90LENGTH: estimates the 90 degree pulse length based on a given kea
%power

%keaPower: The power input to prospa
% rs: series resitance of coil
% L: inductance of coil
% frequency: Larmor frequency in Hz
% numTurns: Number of turns in coil
% coilLength: Length of coil in m

        alpha = pi/2;
        gamma = 42.6e6*2*pi;
        u = 4*pi*10^-7;

        power = 100*(10^(keaPower/10));
      
%         V = sqrt(2*power*rs)
%         
%         P = V^2/Z
        z=2*pi*L*frequency;
       
        
%         voltage = sqrt((power*2)*rs)*2*pi*L*frequency;
%          voltage = sqrt((power*2)*rs)*2*pi*L*frequency;
        voltage = sqrt(power*z)/cos(rs/z)
%         current = sqrt((power*2)/rs);
         current = sqrt(2)*power/voltage;
    
        
        B =u*current*(numTurns/coilLength);
        
        t = alpha/(gamma*B);
        
      
end

