% THIS FUNCTION CAN BE USED TO SUBSTITUTE COMPUTE_ITERATE

function data = convert_to_prospa_data_t1(datain,path,write_csv)
%datain     : input data in tauSteps*NoE matrix format
%write_csv  : write output to csv file

    %% SETTINGS AND DATA PARSING
    % find nmr settings from the folder
    tE = read_custom_acqu_par(path,'echoTimeRun');
    NoE = read_custom_acqu_par(path,'nrEchoes');
    SpE = read_custom_acqu_par(path,'nrPnts');
    Df = read_custom_acqu_par(path,'b1Freq')*1e6;
    Sf = read_custom_acqu_par(path,'adcFreq')*1e6;
    start_param = read_custom_acqu_par(path,'minTau')*1e3;
    stop_param = read_custom_acqu_par(path,'maxTau')*1e3;
    nsteps = read_custom_acqu_par(path,'tauSteps');
    logspaceyesno = read_custom_acqu_par(path,'logSpace');
    nrIterations = read_custom_acqu_par(path,'nrIterations');
    
    %% CONVERSION
    if (logspaceyesno)
        sweep_param = logspace(log10(start_param),log10(stop_param),nsteps);
    else
        sweep_param = linspace(start_param,stop_param,nsteps);
    end
    
    data = zeros(length(sweep_param),NoE*2);
    for i=1:length(sweep_param)
            data(i,1:2:NoE*2)   = real(datain(i,:));
            data(i,2:2:NoE*2)   = imag(datain(i,:));
    end
    
    if write_csv
        mkdir([path,'/kea_format/1']);
        csvwrite([path,'/kea_format/1/data2.csv'],data);

        fileid = fopen([path,'/kea_format/1/acqu.par'],'w');
        fprintf(fileid,'echoTime = %d\n',tE);
        fprintf(fileid,'dummyEchoes = 0\n');
        fprintf(fileid,'dwellTime = %f\n',1/Sf*1e6);
        fprintf(fileid,'nrPnts = %d\n',SpE);
        fprintf(fileid,'nrScans = %d\n',nrIterations);
        fprintf(fileid,'nrEchoes = %d\n',NoE);
        fprintf(fileid,'maxTau = %d\n',stop_param/1000);
        fprintf(fileid,'minTau = %d\n',start_param/1000);
        fprintf(fileid,'tauSteps = %d\n',length(sweep_param));
        fprintf(fileid,'b1Freq = %fd\n',Df/1e6);
        fprintf(fileid,'delaySpacing = "linear"\n');
        if logspaceyesno
            fprintf(fileid,'logspace = "yes"\n');
        else
            fprintf(fileid,'logspace = "no"\n');
        end
        fclose(fileid);
    end
end