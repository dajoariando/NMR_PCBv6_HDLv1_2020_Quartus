function compute_p1lsw(path,SpS,en_figure)
    
    close all;

    %% CONFIGURABLE PARAMETERS
    hold_fig = 1; % hold the figure render
    pause_op = 1;

    %% MAIN PROGRAM
    fileID = fopen([path,'\p1_length_sweep.txt'],'r');
    param_settings=fscanf(fileID,'%f');
    fclose(fileID);

    start_param = param_settings(1);       % start parameter
    stop_param = param_settings(2);        % stop parameter
    spacing_param = param_settings(3);     % spacing parameter
    %logspaceyesno = param_settings(4);   % 1 for logspace, 0 for linearspace

    %if (logspaceyesno)
    %    sweep_param = logspace(log10(start_param),log10(stop_param),nsteps);
    %else
    %    sweep_param = linspace(start_param,stop_param,nsteps);
    %end
    
    sweep_param = start_param:spacing_param:stop_param;
    for m = 1:length(sweep_param)
        name_data = ['\dat_',num2str(sweep_param(m),'%03.3f'),'_'];
        name_avg = ['\avg_',num2str(sweep_param(m),'%03.3f'),'_'];
        view_data (path, SpS, name_data, name_avg, hold_fig);
        if (pause_op)
            pause;
        end
    end

end