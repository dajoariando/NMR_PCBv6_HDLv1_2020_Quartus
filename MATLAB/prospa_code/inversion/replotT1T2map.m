% replot T1T2 maps for selected alpha value from saved data
% path_curr = path to data file
% expnum = experiment number
% clr = color for 1-D plots
% aplot = value of alpha to plot

function [T1lm,T2lm,chi,SNR]=replotT1T2map(path_curr,expnum,aplot,clr)

fname=[path_curr filesep num2str(expnum) filesep 'data2.csv'];
data=load(fname);

theAlphalist=data.theAlphalist;
FEstlist=data.FEstlist;
T1=data.T1; T2=data.T2;
stdout=data.stdout;
T1minp=data.T1minp; T1maxp=data.T1maxp;
T2minp=data.T2minp; T2maxp=data.T2maxp;

[~,ii]=min(abs(aplot-theAlphalist)); % closest match to specified alpha value

fnf = sum(sum(FEstlist{ii}.f));
fnorm = 1/fnf*FEstlist{ii}.f';
T2lm =  exp(sum(log(T2).*sum(fnorm,1)));
T1lm = exp(sum(log(T1').*sum(fnorm,2)));
chi=FEstlist{ii}.chi;
SNR=1/stdout;

%figure('OuterPosition',[100,100,1200,1000])
subplot(3,3,[2 3 5 6])
contour(T2,T1,FEstlist{ii}.f.',8); hold on;
set(gca,'xscale','log','yscale','log');
loglog([T2(1) T2(end)],[T2(1) T2(end)],'k--');
xlabel('T_2'); ylabel('T_1');

subplot(3,3,[8 9]);
semilogx(T2,sum(FEstlist{ii}.f.',1),clr); hold on;
xlim([10^(T2minp) 10^(T2maxp)])
xlabel('T_2');

subplot(3,3,[1 4]);
semilogy(sum(FEstlist{ii}.f.',2),T1,clr); hold on;
ylim([10^(T1minp) 10^(T1maxp)])
ylabel('T_1');

subplot(3,3,7);
plot(eye(4));
cla;
axis off;
text(0,1,['\alpha = ' num2str(FEstlist{ii}.alpha)]);
text(0,.8,['T_{1lm} = ' num2str(T1lm*1e3,3) ' ms']);
text(0,.6,['T_{2lm} = ' num2str(T2lm*1e3,3) ' ms']);
text(0,.4,['SNR \approx ' num2str(SNR,3)]);
text(0,.2,['\chi = ' num2str(chi,4)]);