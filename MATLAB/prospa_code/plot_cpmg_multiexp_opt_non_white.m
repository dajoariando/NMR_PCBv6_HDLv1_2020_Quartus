
% General multi-exponential fitting function for CPMG data
% --------------------------------------------------------------------------
% Inputs:
% path -> path to experiment folder
% exptnum -> number of experiment
% nignore -> number of initial echoes to ignore in fit
% norms -> normalization values for [asymptotic echo, echo decay, spectrum]
% navg -> number of adjacent echoes to average before fitting
% Aest -> estimated  amplitudes of exponential components
% T2est -> estimated T2 values of exponential components
% plt -> turn plotting on/off
% --------------------------------------------------------------------------
% Outputs:
% A -> best-fitting amplitudes
% T2 -> best-fitting T2 values
% asymp_rms -> RMS value of average echo shape
% snr -> SNR [per echo, parameters] per scan (in voltage units)
% --------------------------------------------------------------------------
% Edit history:
% 12/09/13 -> changed code to report SNR/scan, average across navg echoes
% 04/08/15 -> used optimum T2-weighted definition of the matched filter
% (needs the T2est (ms) and Aest vectors to be entered)
% 08/14/15 -> generalized to multi-exponential fit
% 10/09/15 -> added goodness-of-fit parameter (gf)
% 07/25/16 -> changed output plot window, fixed bugs
% 07/26/16 -> replaced gf with snr for each estimated parameter

function [A,T2,asymp_rms,snr]=plot_cpmg_multiexp_opt_081116(path,exptnum,nignore,navg,norms,Aest,T2est,plt)

numbin=20; % Number of bins in histograms
zf=8; % zero-filling factor to get smoother spectra
numiter=1e2; % number of fitting iterations to get statistics on parameters

% Read parameters
TE=read_kea_acqu(path,exptnum,'echoTime')*1e-3; % TE -> echo spacing (ms)
nDummy=read_kea_acqu(path,exptnum,'dummyEchoes'); % Number of dummy echoes
TE=TE*(nDummy+1);
DW=read_kea_acqu(path,exptnum,'dwellTime'); % DW -> dwell time (us)
nrScans=read_kea_acqu(path,exptnum,'nrScans'); % numb000er of scans

disp(['Effective echo spacing = ' num2str(TE*1e3*navg) ' us'])

%close all;
filname=[path '\' num2str(exptnum) '\data2.csv'];
data=csvread(filname);
sizdata=size(data);

data_c=zeros(sizdata(1),sizdata(2)/2);

echo_asymp=zeros(1,sizdata(2)/2);
tacq=DW*linspace(-sizdata(2)/4,sizdata(2)/4,sizdata(2)/2); % us
tvect=TE*linspace(1,sizdata(1),sizdata(1))';

nexp=length(T2est); % Number of exponential components
sig_decay_est=zeros(1,sizdata(1))'; % Multi-exponential signal decay function
for j=1:nexp
    sig_decay_est=sig_decay_est+Aest(j)*exp(-tvect/T2est(j));
end

if plt
    figure(1); drawnow;
    set(get(handle(gcf),'JavaFrame'),'Maximized',1); % Maximize figure
    subplot(2,4,[1,2]);
end
for j=1:sizdata(1)
    data_c(j,:)=data(j,1:2:sizdata(2)-1)+1i*data(j,2:2:sizdata(2));
    if j>nignore
        %        No T2-weighting
        %        echo_asymp=echo_asymp+data_c(j,:)/(sizdata(1)-nignore);
        %        T2-weighted
        echo_asymp=echo_asymp+data_c(j,:)*sig_decay_est(j)/(sizdata(1)-nignore);
    end
    if plt
        plot(j*TE+tacq/1e3,real(data_c(j,:)),'b-'); hold on;
        plot(j*TE+tacq/1e3,imag(data_c(j,:)),'r-');
    end
end
if plt
    xlim([0 sizdata(1)*TE+max(tacq)/1e3])
    title(['Raw data, ' num2str(nrScans) ' scans']);
    xlabel('Time (ms)'); ylabel('Received voltage (\muV)');
    set(gca,'FontSize',12);
end

theta=atan2(sum(imag(echo_asymp)),sum(real(echo_asymp)));
echo_asymp=echo_asymp*exp(-1i*theta);
asymp_rms=sqrt(trapz(tacq,abs(echo_asymp).^2));

if plt
    subplot(2,4,3);
    plot(tacq, real(echo_asymp)/norms(1),'b-','LineWidth',1); hold on;
    plot(tacq, imag(echo_asymp)/norms(1),'r-','LineWidth',1);
    %plot(tacq, abs(echo_asymp)/norms(1),'k-','LineWidth',1);
    xlabel('Time (\mus)');
    ylabel('Echo signal (a.u.)');
    %legend({'Real','Imag','Mag'});
    legend({'Real','Imag'},'Location','northeast'); set(gca,'FontSize',12);
    xlim(max(tacq)*[-1,1]);
end

% Fit asymptotic echo shape with polynomial
% p = polyfit(tacq,echo_asymp,3);
% echo_asymp = polyval(p,tacq);
% plot(tacq, real(echo_asymp),'b--','LineWidth',1); hold on;
% plot(tacq, imag(echo_asymp),'r--','LineWidth',1);

echo_int=zeros(sizdata(1),1);

%w=hamming(sizdata(2)/2)';
w=ones(1,sizdata(2)/2);
N0 = 0.16e-6*sqrt(0.256e-3);
NC = 0.25e-6*sqrt(0.265e-3);
for j=1:sizdata(1)
    data_c(j,:)=data_c(j,:)*exp(-1i*theta);
    echo_int(j)=trapz(data_c(j,:).*conj(echo_asymp))/asymp_rms; % Matched filter
    echo_int_x(j) =NC*sqrt(1/N0*trapz(tacq*1e-6,abs(data_c(j,:).*data_c(j,:))));
    %echo_int(j)=trapz(data_c(j,:).*w); % Windowed integration
end

% windowSize = 2; % Running average filter
% echo_int=filter(ones(1,windowSize)/windowSize,1,echo_int);
% echo_int=echo_int(windowSize:sizdata(1));
% tvect=tvect(windowSize:sizdata(1));
% sizdata=size(tvect);

% Average navg echoes
npts=floor(sizdata(1)/navg); tmp1=zeros(1,npts); tmp2=tmp1;
for j=1:npts
    tmp1(j)=mean(echo_int((j-1)*navg+1:j*navg));
    tmp2(j)=mean(tvect((j-1)*navg+1:j*navg));
end
echo_int=tmp1; tvect=tmp2;

% Fit to multi-exponential, ignore first nignore echoes
sig_decay_est=sig_decay_est(nignore+1:npts)';
tvect=tvect(nignore+1:npts); echo_int=echo_int(nignore+1:npts);
npts=length(tvect);
optfun=@(vars)expfun(vars,tvect,echo_int);

% fmincon-based optimization
%options = optimoptions('fmincon','Display','iter','Algorithm','interior-point');
options = optimoptions('fmincon','Algorithm','interior-point');
vars=fmincon(optfun,[Aest,T2est],[],[],[],[],[zeros(1,nexp),1e-1*ones(1,nexp)],...
    [1e3*ones(1,nexp),1e4*ones(1,nexp)],[],options);

% GA-based optimization
%options=gaoptimset('Display','iter');
%vars=ga(optfun,2*length(Aest),[],[],[],[],[zeros(1,nexp),1e-1*ones(1,nexp)],...
%     [1e3*ones(1,nexp),1e4*ones(1,nexp)],[],options);

% Load optimization results
A=vars(1:nexp); T2=vars(nexp+1:2*nexp);

sig_decay_fit=zeros(1,npts);
for j=1:nexp
    sig_decay_fit=sig_decay_fit+A(j)*exp(-tvect/T2(j));
end

mimag=mean(imag(echo_int)); simag=std(imag(echo_int)); % Imaginary channel
res=real(echo_int)-sig_decay_fit; % Estimate residuals
mres=mean(res); sres=std(res);

% Noise per echo based on imag channel - use last 75% of echoes to avoid transient artifacts
%ind=round(npts/4):npts; noise=std(imag(echo_int(ind)));

% Noise per echo based on residuals
noise=sres;

% Estimate SNR metrics
snr_e=sum(A)/(sqrt(nrScans)*noise); % SNR per echo per scan

% Fit with synthetic data to estimate SNR for parameter estimates
fitvals=zeros(numiter,2*nexp); snr_params=zeros(1,2*nexp);
for i=1:numiter
    % Synthetic data assuming residuals are normally distributed
    echo_int_syn=sig_decay_fit+mres+sres*randn(1,length(tvect));
    
    optfun=@(vars)expfun(vars,tvect,echo_int_syn);
    vars=fmincon(optfun,[Aest,T2est],[],[],[],[],[zeros(1,nexp),1e-1*ones(1,nexp)],...
        [1e3*ones(1,nexp),1e4*ones(1,nexp)],[],options);
    fitvals(i,1:nexp)=sort(vars(1:nexp)); 
    fitvals(i,nexp+1:2*nexp)=sort(vars(nexp+1:2*nexp));
end
for i=1:2*nexp
    snr_params(i)=mean(fitvals(:,i))/(sqrt(nrScans)*std(fitvals(:,i)));
end
snr=[snr_e, snr_params];

if plt
    subplot(2,4,[5,6]);
    plot(tvect,real(echo_int)/norms(2),'b-'); hold on;
    plot(tvect,imag(echo_int)/norms(2),'r-');
    plot(tvect,sig_decay_est*sum(A)/(sum(Aest)*norms(2)),'m--','LineWidth',1);
    plot(tvect,sig_decay_fit/norms(2),'k--','LineWidth',1);
    plot(tvect,res/norms(2),'g-');
    legend({'Data (real)','Data (imag)','Initial estimate','Fit',...
        'Residuals'},'Location','northeast');
    xlabel('Time (ms)');
    ylabel('Echo amplitude (a.u.)');
    title(['SNR_{e} = ' num2str(snr_e,3) ', SNR_{A} = [' num2str(snr_params(1:nexp),3) '] (per scan)']);
    set(gca,'FontSize',12);
    xlim([0 max(tvect)])
    
    subplot(2,4,7);
    histogram(res,numbin); % Residuals
    title(['Residuals, (' num2str(mres,3) ',' num2str(sres,3) ')']);
    
    subplot(2,4,8);
    histogram(imag(echo_int),numbin); % Imaginary channel
    title(['Imag channel, (' num2str(mimag,3) ',' num2str(simag,3) ')']);
end

% figure(4);
% if norm
%     plot(tvect,abs(echo_int)/A,'k-'); hold on;
%     plot(tvect,exp(-tvect/T2),'k--');
% else
%     plot(tvect,abs(echo_int),'k-'); hold on;
%     plot(tvect,A*exp(-tvect/T2),'k--');
% end
%
% legend('Data (abs)',['Fit, T_{2} = ' num2str(round(T2)) ' ms']);
% xlabel('Time (ms)');
% ylabel('Echo amplitude (a.u.)');

ws=2*pi*1e6/(tacq(2)-tacq(1)); % Hz
wvect=linspace(-ws/2,ws/2,length(tacq)*zf);
echo_zf=zeros(zf*length(echo_asymp),1);
echo_zf((zf-1)*length(echo_asymp)/2:(zf+1)*length(echo_asymp)/2-1)=echo_asymp;
spect=zf*(fftshift(fft(ifftshift(echo_zf))));

if plt
    subplot(2,4,4);
    plot(wvect/(2*pi*1e3),real(spect)/norms(3),'b-','LineWidth',1); hold on;
    plot(wvect/(2*pi*1e3),imag(spect)/norms(3),'r-','LineWidth',1);
    xlim(4*1e3/max(tacq)*[-1,1]);
    set(gca,'FontSize',12);
    xlabel('Offset frequency, kHz');
    ylabel('Echo spectrum (a.u.)')
end

function val=expfun(vars,tvect,echo_int)

nexp=length(vars)/2;
A=vars(1:nexp); T2=vars(nexp+1:2*nexp);

ideal=zeros(1,length(tvect));
for j=1:nexp
    ideal=ideal+A(j)*exp(-tvect/T2(j));
end
val=sum((ideal-real(echo_int)).^2);

