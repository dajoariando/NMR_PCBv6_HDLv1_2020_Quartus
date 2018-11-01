function [A,T2,asymp_rms,snr,out_tvect,out_datareal,out_dataimag,out_sigdecay,out_residue] = compute_iterate_agnext(T2est,Aest,path,total_scan)
%path : directory path to the samples
%total_scan : total number of scans in the directory / needed to be
%processed
    
    close all;

%     if exist ([path,'\processed_data.mat'],'file') % check if this computation has been done before
%         load([path,'\processed_data.mat']);
%     else
        
        

        %% SETTINGS AND DATA PARSING
        % find nmr settings from the folder
        fileID = fopen([path,'\matlab_settings.txt'],'r');
        nmr_settings=fscanf(fileID,'%f');
        Df	= nmr_settings(6)*1e6;	% data frequency
        enable_figure = 0;          
        
        %n = 3; Wn = 0.008;
        %n = 1; Wn = 0.03;
        n = 2; Wn = 0.05;
        [butter_b,butter_a] = butter(n,Wn);
        
        filename = '\dat';
        [a,a0,datafilt_avg] = compute_multiple(path,filename,Df,enable_figure, butter_a, butter_b, total_scan);
        
        disp('a='); disp(a);
        disp('a0='); disp(a0);
        disp('datafilt_avg='); disp(datafilt_avg);
        
        %waitforbuttonpress;
        
        close all;
        convert_to_prospa_data(path,total_scan);
        ori_dir = pwd;
        cd prospa_code;
        [A,T2,asymp_rms,snr,out_tvect,out_datareal,out_dataimag,out_sigdecay,out_residue]=plot_cpmg_multiexp_opt_081116_agnext([path,'\kea_format'],1,1,1,[1 1 1],T2est,Aest,0);
        
        disp('A='); disp(A);
        disp('T2='); disp(T2);
        disp('asymp_rms='); disp(asymp_rms);
        disp('snr='); disp(snr);
        
        cd(ori_dir);
        
        save([path,'\processed_data']); % save processed data
        
%     end
    
end