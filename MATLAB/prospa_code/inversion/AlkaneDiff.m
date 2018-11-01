% Expected D-T2 correlation for mixtures of alkanes at atmospheric pressure,
% based on Freed, JCP 2009
% Ni = individual alkane chain length
% Temp = temperature in C

function [T2i,Di] = AlkaneDiff(Ni,Temp)

Temp=Temp+273.15; % C to K

% Fitting parameters for diffusion
a=-6.3326; b=143.6869; c=-0.2442; d=588.4961;
nu=0.7;

% Fitting parameters for relaxation
a1=-5.75; b1=-227; c1=-1.43; d1=755;
kappa=1.24;

Nav=4:1:100; % Mean alkane chain length

% Calculate D and T2
Di=exp(-(a+b/Temp))*Ni^(-nu)*Nav.^(-(c+d/Temp))*1e-9; % m^2/sec
T2i=exp(-(a1+b1/Temp))*Ni^(-kappa)*Nav.^(-(c1+d1/Temp)); % seconds
