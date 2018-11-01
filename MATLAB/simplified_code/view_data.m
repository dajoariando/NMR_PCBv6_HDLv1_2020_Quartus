function view_data (data_folder, n, name_data, name_avg, hold_fig)
    % data_folder : the folder path for the data
    % n : number of iteration for every measurement
    % name_data : the data name prefix
    % name_avg : the data averaged name prefix
    % hold_fig : hold plot figure for every measurement

    for i = 1:n
        dat{i} = importfile([data_folder,name_data,num2str(i,'%03d')]);
        avg{i} = importfile([data_folder,name_avg,num2str(i,'%03d')]);
        figure(3);
        title('raw data (no averaging)');
        if (hold_fig)
            hold on;
        end
        plot(dat{i});
        xlim([0 length(dat{i})]);
    end
    dat_sum=zeros(length(dat{1}),1);
    avg_sum=zeros(length(avg{1}),1);
    for i=1:n
        if (mod(i,2)==1)
            dat_sum=dat_sum+dat{i};
            avg_sum=avg_sum+avg{i};
        else
            dat_sum=dat_sum-dat{i};
            avg_sum=avg_sum-avg{i};
        end
    end
    figure(1);
    title('data sum (phase cycled assumed: on)');
    if (hold_fig)
        hold on;
    end
    plot(dat_sum);
    xlim([0 length(dat_sum)]);
    figure(2);
    title('average sum (phase cycled assumed: on)');
    if (hold_fig)
        hold on;
    end
    plot(avg_sum);
    xlim([0 length(avg_sum)]);
end