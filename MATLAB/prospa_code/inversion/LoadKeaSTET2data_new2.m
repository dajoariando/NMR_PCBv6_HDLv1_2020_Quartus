function [RawData,deltaTimes,encTime,ExpTime,AcqTime] = LoadKeaSTET2data_new2(path_curr,exptnum)

% Read parameters
acqTime=read_kea_acqu(path_curr,exptnum,'acqTime'); % ms
nrPnts=1; % Single complex point stored per echo
nrEchoes=read_kea_acqu(path_curr,exptnum,'nrEchoes');
echoTime=read_kea_acqu(path_curr,exptnum,'echoTime'); % us
b1Freq=read_kea_acqu(path_curr,exptnum,'b1Freq') % MHz
sample=read_kea_acqu_string(path_curr,exptnum,'sample') % sample name

% Read TE1 times (all in ms)

logyesno=read_kea_acqu_string(path_curr,exptnum,'logspace');

minWait=read_kea_acqu(path_curr,exptnum,'minWait');
encTime=read_kea_acqu(path_curr,exptnum,'encTime');
numTE1=read_kea_acqu(path_curr,exptnum,'nrWait');

maxWait=(encTime - minWait)/2;
if strcmpi(logyesno,'no') % Linear
    deltaTimes=linspace(minWait,maxWait,numTE1)';
else % log
    deltaTimes=logspace(log10(minWait),log10(maxWait),numTE1)';
end

AcqTime=acqTime*linspace(0,1,nrPnts)';
ExpTime=echoTime*linspace(0,nrEchoes-1,nrEchoes)';

filname=[path_curr filesep num2str(exptnum) filesep 'data2.csv'];
tmp=csvread(filname);

RawData=zeros(nrPnts,nrEchoes,numTE1);
% Rearrange data to get complex points and split them into echoes
for j=1:numTE1
    tmp_c=tmp(j,1:2:2*nrPnts*nrEchoes-1)'+1i*tmp(j,2:2:2*nrPnts*nrEchoes)'; % Unshuffle
    for i=1:nrEchoes % Split into echoes
        RawData(:,i,j)=tmp_c((i-1)*nrPnts+1:i*nrPnts);
    end
end