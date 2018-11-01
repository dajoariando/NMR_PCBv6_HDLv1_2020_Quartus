function [RawData,TE1times,ExpTime,AcqTime] = LoadKeaT1T2data(datadirectory)

filname=[datadirectory filesep 'data.csv']
tmp=csvread(filname);

TE1times=tmp(:,1);
numTE1=length(TE1times);

param_names={'acqTime','nrPnts','nrEchoes','echoTime','Sample','b1Freq'};
[vals]=get_params(datadirectory,param_names);

acqTime=str2double(vals{1});
nrPnts=str2double(vals{2});
nrEchoes=str2double(vals{3});
echoTime=str2double(vals{4});

Sample=vals{5}
b1Freq=str2double(vals{6})

AcqTime=acqTime*linspace(0,1,nrPnts)';
ExpTime=echoTime*linspace(0,nrEchoes-1,nrEchoes)';

filname=[datadirectory filesep 'data2d.csv'];
tmp=csvread(filname);

RawData=zeros(nrPnts,nrEchoes,numTE1);

% Rearrange to eliminate dummy scan (2nd), and move long time point from
% first to last
vec=[3:numTE1+3,1]; cnt=0;
for j=vec
    cnt=cnt+1;
    ind=(vec(cnt)-1)*nrEchoes+1:vec(cnt)*nrEchoes;
    for i=1:nrEchoes
        RawData(:,i,cnt)=tmp(ind(i),1:2:2*nrPnts-1)+1i*tmp(ind(i),2:2:2*nrPnts);
    end
end