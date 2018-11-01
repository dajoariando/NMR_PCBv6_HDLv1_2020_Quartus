% Deconvolve zero-filled spectrum created from CPMG/SLSE data
% Soumyajit Mandal, 07/20/18
% -----------------------------------------------------------
% tvect, fvect = time and frequency-domain vectors
% spect = complex spectrum
% fmax = maximum frequency to deconvolve
% -----------------------------------------------------------
function [J,fv] = deconv_spect(tvect,fvect,spect,fmax)

zf=length(fvect)/length(tvect); % Zero-filling factor

% Create time-domain window
tvect_full=linspace(zf*min(tvect),zf*max(tvect),length(fvect));
ind=find(abs(tvect_full)<max(tvect));
w=zeros(1,length(tvect_full)); w(ind)=1;

% Find estimated PSF from window
psf=fftshift(fft(w));
psf(2:2:length(fvect))=-psf(2:2:length(fvect)); % Correct for 1/2 sample timing error in w

% Assume signal on real channel, noise on imaginary
ind=find(abs(fvect)<fmax);
sig=real(spect(ind)); % Signal
noi=var(imag(spect(ind))); % Noise power
psf=real(psf(ind));
fv=fvect(ind);

% Regularized deconvolution
J = deconvreg(sig,psf/max(psf),noi);

% Plot results;
figure(2); clf;
plot(fv,sig/max(sig)); hold on;
plot(fv,psf/max(psf));
plot(fv,J/max(J));
legend({'Original','PSF','Deconvolved'});
xlabel('Frequency');
ylabel('Normalized spectra');
set(gca,'FontSize',14);

figure(3); clf;
plot(fv,sig); hold on;
plot(fv,J);
legend({'Original','Deconvolved'});
xlabel('Frequency');
ylabel('Un-normalized spectra');
set(gca,'FontSize',14);