%estimate B1/I ratio
% determine pulse length according to frequency and power input
% 

% model 
%                        C1
%          SIG -----------||---------------------
%                    |             )  Ls        |
%                    |             )            |
%                    |             )            |
%                    |             |      Cpar ---  
%                C2 ---            |           ---
%                   ---             > Rs        |
%                    |              >           |       
%                    |              >           |
%          GND ----------------------------------

filename= 'Rs.xlsx';
Rs = xlsread(filename, 'B15:B215' );
f = xlsread(filename, 'A15:A215' );

filename= 'Ls.xlsx';
Ls = xlsread(filename, 'B15:B215' );

% test
%Rs = 1.67;

gamma = 3.077e6; % Nitrogen \gamma _{n}/(2\pi ) (MHz T ?1)
theta = 120*pi/180;


tp = 150e-6;
power = 6.3;
%power = 12.6;

%theta = gamma*B1*tp;
%power = I.^2*R/2;
Cpar = 
% Actual resistance
s = j*2*pi*f;
Zon = (Rs + s.*Ls)./(s.^2.*Ls*Cpar +s.*Rs*Cpar+1);
R = real(Zon);

I = sqrt(2*power./(Rs));

% reflection loss
s11
power = power(1 - s11.^2);

I = sqrt(power./(Rs/2));

B1 = ratio.*I;
tp = theta./(gamma*B1);

% frequency@2.83MHz
B1 = theta/(gamma*tp);

% I = sqrt(power./(Rs(152)/2));
% = sqrt(power./(Rs/2));
x
ratio = B1./I



x1 = linspace(1,3,1e4);
p_pulse = polyfit(f/1e6,tp*1e6,5);
y_pulse = polyval(p_pulse,x1);
figure(1)
plot(f/1e6, tp'*1e6,'r*');hold on;
%plot(x1,y_pulse, 'r')
%title('Pulse length along frequency')
xlabel('Freqeucny (MHz)');
ylabel('pulse length(us)');

p = polyfit(f/1e6,1./tp,2);

y1 = polyval(p,x1);
figure(2)
plot(f/1e6, 1./tp'./1e3); hold on;
plot(x1,y1./1e3);
title('Selected data')
xlabel('Freqeucny (MHz)');
ylabel(' Bandwidth (kHz)');


%select the excitation frequency according the bandwith, make sure cover
%the whole range

freq = 1e3;
freq_list = [freq];
while (freq<3e3)

BW = polyval(p,freq/1e3)/1e3; %kHz

next = freq +BW ;
freq_list = [freq_list next];
freq = next;

end

y2 = polyval(p/1e3,freq_list/1e3);
figure(3)
plot(freq_list/1e3,y2,'b*')
xlabel('Freqeucny (MHz)');
ylabel('Bandwidth (kHz)');
legend({'Frequency selected'});

fid=fopen('f_0624.txt','w');
fprintf(fid,'%d,',freq_list/1e3);
fclose(fid);

y_pulse = polyval(p_pulse,freq_list/1e3);

fid=fopen('tp_0624.txt','w');
fprintf(fid,'%d,',y_pulse);
fclose(fid);