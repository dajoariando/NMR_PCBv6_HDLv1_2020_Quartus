function [data,TE1times,Params,ExpTime,AcqTime] = LoadKeaT1T2dataList(datadirectory)
%This function is used to load prospa data located in the input
%directory DATADIRECTORY which correspond to CPMG decays with diffusion
%editing times in the list TE1FILENAME.  The first folder in DATADIRECTORY
%corresponds to the dataset collected with a delay time equal to the first
%element in TE1FILENAME.  The data reading is done by LoadProspaData.m, a
%script provided by Magritek.  Ben Chapman 9/13/10

%OUTPUTS: 

%DATA has dimensions NumEchoes x 3 x NumTE1times.  First column is
%the acquisition time points, second column is the signal, third is noise
%channel.

%TE1times is a 1-d array that lists the diffusion editing times


%cd into location of TE1 text file
%cd D:\DOCUMENTS\AsphalteneProject\KEAdata
%cd(datadirectory);

%get experiment parameters
fileid = fopen([datadirectory '\acqu.par']);
ExpPars = textscan(fileid, '%s', 'Delimiter', '\n');
Params = ExpPars{1}; 
fclose(fileid);

%Get TE1 times
% fileid = fopen(TE1filename);
% TE1timesstrct = textscan(fileid,'%f');
% fclose(fileid);
% TE1times = TE1timesstrct{1};
TE1times = LoadProspaData([datadirectory '\TE1array.1d']);
NumTE1times = length(TE1times);

ExpTime = LoadProspaData([datadirectory '\exptime.1d']);

AcqTime = LoadProspaData([datadirectory '\acqtime.1d']);

%Get experimental data
firstdecay = LoadProspaData([datadirectory '\1\decaymatrix.1d']); %Get data from 1st decay

% Ignore first echo
%NumEcho=length(ExpTime);
%PtsEcho=length(firstdecay)/NumEcho;
%ExpTime=ExpTime(2:length(ExpTime));
%firstdecay=firstdecay(PtsEcho+1:length(firstdecay));

NumPts = length(firstdecay); %Determine # of pts acq. per delay time
data = zeros(NumPts,NumTE1times); %allocate memory for remaining decays

data(:,1)= firstdecay; %record 1st decay
%[b,a]=butter(4,0.05);
%data(:,1) = filter(b,a,firstdecay); %record 1st decay

for ii=2:NumTE1times %loop through remaining decays 
    %tmp = LoadProspaData([datadirectory '\' num2str(ii) '\decaymatrix.1d']); %and record data
    %data(:,ii) = tmp(PtsEcho+1:length(tmp));
    data(:,ii) = LoadProspaData([datadirectory '\' num2str(ii) '\decaymatrix.1d']); %and record data
    %data(:,ii) = filter(b,a,data(:,ii));
end