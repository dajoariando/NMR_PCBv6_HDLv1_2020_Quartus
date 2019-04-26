function [A,T2,asymp_rms,snr] = compute_iterate(path)
%path : directory path to the samples
    addpath('signal_proc');
    %% SETTINGS
    recompute = 1;
    process_multiexp = 1;
    enable_figure = 1;
    
    Df = read_custom_acqu_par(path,'b1Freq') * 1e6;
    Sf = read_custom_acqu_par(path,'adcFreq') * 1e6;
    tE = read_custom_acqu_par(path,'echoTimeRun');
    total_scan = read_custom_acqu_par(path,'nrIterations');
    
    % filter settings for downconversion
    %n = 3; Wn = 0.008;
    n = 2; Wn = 0.02;
    %n = 2; Wn = 0.05;
    [butter_b,butter_a] = butter(n,Wn);

    %% MAIN PROGRAM
    if exist ([path,'\processed_data.mat'],'file') && ~recompute % check if this computation has been done before
        load([path,'\processed_data.mat']);
    else
        
        filename = '\dat';
        [a,a0,datafilt_avg] = compute_multiple(path,filename,Df,Sf,tE,total_scan,enable_figure,butter_a,butter_b,0,0,0);
        
        %disp('a='); disp(a);
        disp('a0='); disp(a0);
        disp('datafilt_avg='); disp(datafilt_avg);
        
    end
    
    if process_multiexp == 1
        close all;
        convert_to_prospa_data(path,'\dat',1);
        ori_dir = pwd;
        cd prospa_code;
        [A,T2,asymp_rms,snr]=plot_cpmg_multiexp_opt_081116_extout([path,'\kea_format'],1,1,1,[1 1 1],1,1800,0);
        [A,T2,asymp_rms,snr]=plot_cpmg_multiexp_opt_081116_extout([path,'\kea_format'],1,1,1,[1 1 1],A,T2,1);

        disp('A='); disp(A);
        disp('T2='); disp(T2);
        disp('asymp_rms='); disp(asymp_rms);
        disp('snr='); disp(snr);

        cd(ori_dir); 
    end
    
    rmpath('signal_proc');
    clear recompute process_multiexp;
    save([path,'\processed_data']); % save processed data
    
end