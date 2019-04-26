% THIS FUNCTION CAN BE USED TO SUBSTITUTE COMPUTE_ITERATE

function data = convert_to_prospa_data(path,name,write_csv)
%path : directory path to the samples
    
    %if exist ([path,'/kea_format/1/data2.csv'],'file') % check if the data has been converted before
    %else
        %% SETTINGS
        enable_figure = 0;
        perform_rotation = 1;
        mvoltPerDigit = 3200 / 16384; 

        %% DATA PARSING
        tE = read_custom_acqu_par(path,'echoTimeRun');
        SpE = read_custom_acqu_par(path,'nrPnts');
        NoE = read_custom_acqu_par(path,'nrEchoes');
        Df = read_custom_acqu_par(path,'b1Freq')*1e6; % must be in Hz
        Sf = read_custom_acqu_par(path,'adcFreq')*1e6; % must be in Hz
        nrIterations = read_custom_acqu_par(path,'nrIterations');
        en_ph_cycle_proc = read_custom_acqu_par(path,'usePhaseCycle');
        
        %n = 3; Wn = 0.008;
        n = 2; Wn = 0.01;
        % n = 2; Wn = 0.05;
        [butter_b,butter_a] = butter(n,Wn);

        % parse file & remove DC component
        data = zeros(NoE*SpE,1);
        for m = 1:nrIterations
            filename = [path,name,'_',num2str(m,'%03d')];
            if exist(filename,'file')
                temp = load(filename);
                temp = (temp - mean(temp)) ./ nrIterations * mvoltPerDigit;
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

        if enable_figure == 1 
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

        %% DATA_ROTATION
        if perform_rotation
            theta = atan2( sum(imag(datafilt(1,:))), sum(real(datafilt(1,:))) );
            datafilt=datafilt.*exp(-1i*theta);
        end
        
        %% SAVE TO KEA DATA FORMAT
        data = zeros(NoE,SpE*2);
        for i = 1:NoE
            data( i , 1:2:SpE*2 )= real(datafilt((i-1)*SpE+1:i*SpE));
            data( i , 2:2:SpE*2 )= imag(datafilt((i-1)*SpE+1:i*SpE));
        end
        
        if write_csv
            mkdir([path,'/kea_format/1']);
            csvwrite([path,'/kea_format/1/data2.csv'],data);

            fileid = fopen([path,'/kea_format/1/acqu.par'],'w');
            fprintf(fileid,'echoTime = %d\n',tE);
            fprintf(fileid,'dummyEchoes = 0\n');
            fprintf(fileid,'dwellTime = %f\n',1e6/Sf); % must be in uS
            fprintf(fileid,'nrPnts = %d\n',SpE);
            fprintf(fileid,'nrScans = %d\n',nrIterations);
            fprintf(fileid,'nrEchoes = %d\n',NoE);
            fclose(fileid);
        end
    %end
end