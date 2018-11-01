function plotT1T2maps(path,clr)

filname=[path '\1\data2.csv'];
tmp=load(filname);

FEstlist=tmp.FEstlist;
theAlphalist=tmp.theAlphalist;
T1=tmp.T1;
T2=tmp.T2;
stdout=tmp.stdout;

% plot T1T2 maps for each alpha value

for ii = 1:length(theAlphalist)
    fnf = sum(sum(FEstlist{ii}.f));
    fnorm = 1/fnf*FEstlist{ii}.f';
    T2lm =  exp(sum(log(T2).*sum(fnorm,1)));
    T1lm = exp(sum(log(T1').*sum(fnorm,2)));
    
    figure(ii)
	subplot(3,3,[2 3 5 6])
	contour(T2,T1,FEstlist{ii}.f.',8,clr); hold on;
    set(gca,'xscale','log','yscale','log');
    loglog([T2(1) T2(end)],[T2(1) T2(end)],'k--');
	xlabel('T_2'); ylabel('T_1');
    
    subplot(3,3,[8 9]);
    semilogx(T2,sum(FEstlist{ii}.f.',1),[clr '-']); hold on;
    xlabel('T_2');
    
    subplot(3,3,[1 4]);
    semilogy(sum(FEstlist{ii}.f.',2),T1,[clr '-']); hold on;
    ylabel('T_1');    
    
    subplot(3,3,7);
    plot(eye(4)); hold on;
    cla;
    axis off;
    text(0,1,['\alpha = ' num2str(FEstlist{ii}.alpha)]);
    text(0,.8,['T_{1lm} = ' num2str(T1lm*1e3,3) ' ms']);
    text(0,.6,['T_{2lm} = ' num2str(T2lm*1e3,3) ' ms']);
    text(0,.4,['SNR \approx ' num2str(1/stdout,3)]);
    text(0,.2,['\chi = ' num2str(FEstlist{ii}.chi,4)]);
    saveas(gcf,['T1T2maps_alphaind' num2str(ii)]);
end
