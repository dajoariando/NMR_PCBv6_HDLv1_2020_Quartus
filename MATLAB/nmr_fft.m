function [spectx,specty] = nmr_fft(path,filename,fs)
%path       : directory path to the samples
%filename   : the name of the file where the data stored
%fs         : the sampling frequency
    
    y=load([path,'\',filename]);
    y=y';
    
    % figure(1); hold on; legend('show');
    % plot(y,'DisplayName',filename);
    
    spectx  = linspace(-fs/2,fs/2,length(y));
    specty  = abs(fftshift(fft(y-mean(y))));
    % IMPORTANT FIGURE TEST
    figure(2); %legend('show');
    plot(spectx(length(y)/2:length(y))/1e6,specty(length(y)/2:length(y)),'DisplayName',filename);
    xlabel('Frequency (MHz)');
    ylabel('Amplitude');
    title('FFT Data');

end