function compute_plsw(path,enable_figure)
%path : directory path to the samples
% enable_figure : enable the figure
    
    %% SETTINGS
    recompute = 0;
    plottype = 0;
    %profile on;
    
    tE = read_custom_acqu_par(path,'echoTimeRun');
    NoE = read_custom_acqu_par(path,'nrEchoes');
    Df = read_custom_acqu_par(path,'b1Freq')*1e6;
    Sf = read_custom_acqu_par(path,'adcFreq')*1e6;
    start_param = read_custom_acqu_par(path,'p90LengthGiven_sta');
    stop_param = read_custom_acqu_par(path,'p90LengthGiven_sto');
    spacing_param = read_custom_acqu_par(path,'p90LengthGiven_spa');
    nrIterations = read_custom_acqu_par(path,'nrIterations');

    % this is a standard butterworth filter used by downconverter (downconvert.m)
    % it is implemented here because it takes forever to compute it, and
    % the downconverter is called thousand times depending on the data
    n = 2; Wn = 0.008;
    [butter_b,butter_a] = butter(n,Wn);
    
    %% MAIN PROGRAM
    if exist ([path,'\processed_data.mat'],'file') && ~recompute % check if this computation has been done before
        
        load([path,'\processed_data.mat']);
    
    else
        
        sweep_param = start_param : spacing_param : stop_param;
        a = zeros(length(sweep_param),NoE);
        a_init = zeros(1,length(sweep_param));
        noise = zeros(1,length(sweep_param));
        snr = zeros(1,length(sweep_param));
        for m = 1:length(sweep_param)
            disp(['current pulse length: ',num2str(sweep_param(m)),' uS']);
            filename = ['\dat_',num2str(sweep_param(m),'%03.3f')];
            [a(m,:),a_init(m),a_sum_simple(m)] = compute_multiple(path,filename,Df,Sf,tE(m),nrIterations,enable_figure, butter_a, butter_b, 0, 0, 0);
            
            % Estimate SNR/echo/scan
            noise(1,m) = std(imag(a(m,:)));
            snr(1,m) = a_init(m)/(noise(1,m)*sqrt(nrIterations));
        end
        
        save([path,'\processed_data']); % save processed data
        
    end
    
    %% PLOT OPTIONS
    if plottype == 0
        figure(171);
        plot(sweep_param,snr);
        title('Signal-to-noise ratio'); set(gca,'FontSize',16);
        xlabel('90 degrees pulse length (\mus)');
        ylabel('SNR');

        figure(172);
        plot(sweep_param,sum(real(a')));
        title('Echo average with pulse length'); set(gca,'FontSize',16);
        xlabel('90 degrees pulse length (\mus)');
        ylabel('Amplitude');

        figure(173);
        plot(sweep_param,a_init/max(a_init),'x', 'Linewidth',1.5);
        % title('Initial signal with pulse length');
        set(gca,'FontSize',16);
        xlabel('\pi/2 pulse length (\mus)');
        ylabel('Normalized amplitude');
    
        figure(174);
        plot(sweep_param,a_sum_simple);
        title('Real signal amplitude'); set(gca,'FontSize',16);
        xlabel('90 degrees pulse (\mus)');
        ylabel('Amplitude');
    
    else
            
        % curve fit
        fittype = 'poly5';
        [v_curve,~,v_output]=fit(sweep_param',sum(real(a'))',fittype);
        [a_curve,~,a_output]=fit(sweep_param',a_init',fittype);
        [s_curve,~,s_output]=fit(sweep_param',a_sum_simple',fittype);

        figure(172);
        subplot(2,1,1); hold on;
        plot(sweep_param,sum(real(a')));
        plot(v_curve,sweep_param,sum(real(a')));
        title('Vector signal amplitude');
        xlabel('90 degrees pulse (\mus)');
        ylabel('Amplitude');
        subplot(2,1,2);
        hist(v_output.residuals);
        title('Residual');
        xlabel('\Delta A');
        ylabel('Amplitude');  

        figure(173);
        subplot(2,1,1); hold on;
        plot(sweep_param,a_init);
        plot(a_curve,sweep_param,a_init);
        title('Initial signal amplitude');
        xlabel('90 degrees pulse (\mus)');
        ylabel('Amplitude');
        subplot(2,1,2);
        hist(a_output.residuals);
        title('Residual');
        xlabel('\Delta A');
        ylabel('Amplitude');

        figure(174);
        subplot(2,1,1); hold on;
        plot(sweep_param,a_sum_simple);
        plot(s_curve,sweep_param,a_sum_simple);
        title('Real signal amplitude');
        xlabel('90 degrees pulse (\mus)');
        ylabel('Amplitude');
        subplot(2,1,2);
        hist(s_output.residuals);
        title('Residual');
        xlabel('\Delta A');
        ylabel('Amplitude');
    
    end
    
    %profile viewer;
    
end