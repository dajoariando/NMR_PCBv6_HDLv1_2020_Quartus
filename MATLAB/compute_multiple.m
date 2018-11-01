function [a,a0,snr,T2,noise,theta,scan_avg,echo_avg] = compute_multiple(path,name,Df,Sf,tE,total_scan,en_fig,butter_a,butter_b,en_ext_param,thetaref,echoref_avg)
% path          : directory path to the samples
% name          : name of the file
% Df            : data signal frequency
% Sf            : sampling frequency
% tE            : echo time / echo spacing
% en_fig        : plot figures (a lot!)
% filter parameter is here to make computation faster (only done once
% outside this function)
% butter_a      : parameter a for butterworth filter
% butter_b      : parameter b for butterworth filter
% en_ext_param  : enable external parameters
% thetaref      : external parameter -> rotation angle reference
% echoref_avg   : external parameter -> echo average reference

    %% SETTINGS AND DATA PARSING
    SpE = read_custom_acqu_par(path,'nrPnts');
    NoE = read_custom_acqu_par(path,'nrEchoes');
    en_ph_cycle_proc = read_custom_acqu_par(path,'usePhaseCycle');
    
    perform_rotation = 1;   % perform rotation for the data
    mtch_fltr_sta_idx = 1;  % 1 is default or something referenced to SpE, e.g. SpE/4; the start index for match filtering is to neglect ringdown part from calculation
    
    % parse file & remove DC component
    data = zeros(NoE*SpE,1);
    for m = 1:total_scan
        filename = [path,name,'_',num2str(m,'%03d')];
        if exist(filename,'file')
            temp = load(filename);
            temp = (temp - mean(temp)) ./ total_scan;
            if (en_ph_cycle_proc)
                if mod(m,2)==0
                    data = data + temp;
                else
                    data = data - temp;
                end
            else
                data = data + temp;
            end
        end
    end
    
    if en_fig == 1 
        figure(100); hold on;
        subplot(1,3,1); hold on;
        echo_space = (1/Sf)*linspace(1,SpE,SpE); % in s
        for i_echo = 1:NoE
            plot( ((i_echo-1)*tE*1e-6 + echo_space)*1e3 , data( (i_echo-1)*SpE+1:i_echo*SpE ) ,'b.-'); %hold on;
        end
        set(gca,'FontSize',12);
        title('Echo decay');
        xlabel('Time (mS)');
        ylabel ('Amplitude');
    end
    
    %% BASIC DOWNCONVERTION
    % filter the raw data and store it in the same data length (storage) in
    % quadrature format
    datafilt=zeros(1,SpE*NoE);
    for i = 1:NoE
        datafilt((i-1)*SpE+1:i*SpE) = downconvert(data((i-1)*SpE+1:i*SpE), i, tE, Df, Sf, butter_a, butter_b);
    end
    
    %% FIND ECHOSUM, ECHO AVERAGE, ECHO MAGNITUDE, SCAN ROTATION
    
    % scan rotation
    if en_ext_param % external rotation
        datafilt=datafilt.*exp(-1i*thetaref);
        theta = atan2( sum(imag(datafilt(1,:))), sum(real(datafilt(1,:))) );
    else
        theta = atan2( sum(imag(datafilt(1,:))), sum(real(datafilt(1,:))) );
        if perform_rotation
            datafilt=datafilt.*exp(-1i*theta);
        end
    end

    
    % compute echo average and echo magnitude
    scan_avg    = zeros(NoE,SpE);   % scan sum
    echo_avg    = zeros(1,SpE);     % echo average
    for i = 1:NoE
        scan_avg(i,:) = datafilt((i-1)*SpE+1:i*SpE);
        echo_avg = echo_avg + datafilt((i-1)*SpE+1:i*SpE) ./ (NoE);
    end
    
    if en_fig == 1 
        figure(31); hold on;
        plot((1/Sf)*1e6*linspace(1,SpE,SpE),abs(echo_avg),'b.-');
        plot((1/Sf)*1e6*linspace(1,SpE,SpE),real(echo_avg),'r.-');
        plot((1/Sf)*1e6*linspace(1,SpE,SpE),imag(echo_avg),'y.-');
        legend('abs','real','imag');
        %spect_datafiltsum(m,:) = fftshift(fft(datafilt_avg(m,:)-mean(datafilt_avg(m,:))));
        %plot(fs,abs(spect_datafiltsum(m,:)));
    end
    
    
    %% ECHO AMPLITUDES (MATCH FILTERING), INITIAL AMPLITUDE, T2, SNR
    a = zeros(1,NoE);
    for i = 1:NoE
        if en_ext_param
            a(i) = sum(scan_avg(i,mtch_fltr_sta_idx:SpE) .* conj(echoref_avg(1,mtch_fltr_sta_idx:SpE)) );
        else
            a(i) = sum(scan_avg(i,mtch_fltr_sta_idx:SpE) .* conj(echo_avg(1,mtch_fltr_sta_idx:SpE)) );
            % a(i) = sum((scan_avg(i,mtch_fltr_sta_idx:SpE)));
        end
    end
        
    if en_fig == 1
        figure(100); hold on;
        subplot(1,3,2); hold on;
        cla;
        plot(tE/1e6*linspace(1,NoE,NoE),real(a),'b.-'); hold on;
        plot(tE/1e6*linspace(1,NoE,NoE),imag(a),'r.-');
    end
    f = fit(tE/1e6*linspace(1,NoE,NoE)',real(a)','exp1');
    if en_fig == 1 
        plot(f,tE/1e6*linspace(1,NoE,NoE)',real(a)');
        set(gca,'FontSize',12);
        title('Filtered data');
        xlabel('Time (S)');
        ylabel ('Amplitude');
    end
    
    a0  = f.a;
    T2  = -1 / f.b;
    disp(['Initial amplitude = ' num2str(a0)])
    disp(['T2 = ' num2str(T2) ' sec'])

    % Estimate SNR/echo/scan
    noise   = std(imag(a));
    snr     = a0/(noise*sqrt(total_scan));
    disp(['SNR per echo per scan = ' num2str(snr)])

    %% DATA SUM
    
    if en_fig == 1 
        figure(100); hold on;
        subplot(1,3,3); hold on;
        plot((1/Sf)*1e6*linspace(1,SpE,SpE),real(echo_avg),'b-');
        plot((1/Sf)*1e6*linspace(1,SpE,SpE),imag(echo_avg),'r-');
        set(gca,'FontSize',12);
        title('Echo shape');
        xlabel('Time (uS)');
        ylabel ('Amplitude');
    end
    
    % plot the fft for the datas
    if en_fig == 1 
        figure(5);
        fs=linspace(-(Sf/2),Sf/2,SpE);
        spect_datasumall = fftshift(fft(echo_avg-mean(echo_avg)));
        plot(fs,abs(spect_datasumall));
    end
end