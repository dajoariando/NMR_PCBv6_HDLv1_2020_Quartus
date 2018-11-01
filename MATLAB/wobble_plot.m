function wobble_plot(path)
%path       : directory path to the data sample
%freq_sta   : start frequency
%freq_sto   : stop frequency
%freq_spa   : spacing frequency
%wobb_bw    : bandwidth search (boundary) for the particular frequency (to avoid rounding error)
%fs         : sampling frequency
    
    recompute = 1;

    if exist ([path,'\processed_data.mat'],'file') && ~recompute % check if this computation has been done before
        load([path,'\processed_data.mat']);
    else
        
        %% LOAD SETTINGS & SET CONFIGURATION
        %wobble_settings = load([path,'\matlab_settings.txt']); % import settings file from the wobble folder
        %freq_sta = wobble_settings(1);
        %freq_sto = wobble_settings(2);
        %freq_spa = wobble_settings(3);
        %n_data   = wobble_settings(4);
        %fs      = 25e6;
        
        freq_sta = read_custom_acqu_par(path,'freqSta');
        freq_sto = read_custom_acqu_par(path,'freqSto');
        freq_spa = read_custom_acqu_par(path,'freqSpa');
        n_data = read_custom_acqu_par(path,'nSamples');
        fs      = read_custom_acqu_par(path,'freqSamp')*1e6;
        
        wobb_bw = (fs/n_data)*4; % this wobb_bw is the search bandwidth due to finite resolution due to frequency sampling, therefore one data frequency is not plotted exactly at its frequency (in freq domain), but must be within this +- bw. Multiplier is not needed, but added as safety


        %% DATA PROCESSING
        freq = freq_sta:freq_spa:freq_sto;
        s11_plot = zeros(1,length(freq));
        for n=1:length(freq)
            %[spectx, specty] = nmr_fft(path,['wobbdata_',num2str(freq(n),'%.2f'),'.o'],fs);
            [spectx, specty] = nmr_fft(path,['wobbdata_',num2str(freq(n),'%.3f')],fs);
            ref_index = abs(spectx-(freq(n)*1e6)) < wobb_bw; % find index within the bandwidth at a particular center frequency
            s11_plot(1,n) = max(abs(specty(ref_index))); % find the maximum value within the bandwidth (to find the reflection value at the center frequency)
            hold on; % hold the figure inside the nmr_fft function
        end

        save([path,'\processed_data']); % save processed data
        
    end
    
    %% PLOT
    figure(1); hold on;
    plot( freq , 20*log10(s11_plot/max(s11_plot)), 'Linewidth',2 );
    xlim([min(freq) max(freq)]);
    xlabel('Frequency (MHz)');
    ylabel('S11 parameter (dB)');
    set(gca,'FontSize',14);
        
end