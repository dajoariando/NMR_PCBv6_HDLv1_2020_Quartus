function T1T2Data_basicplot (path_curr)

    data = T1T2Data_import([path_curr,'/','1','/','data2.csv']);
    for i = 1:length(data(:,1))
        figure(1)
        plot(data(i,1:2:length(data(i,:))));
        title('KeA compatible data - real');
        hold on;

        figure(2)
        plot(data(i,2:2:length(data(i,:))));
        title('KeA compatible data - imag');
        hold on;

        figure(3)
        plot( abs( data(i,1:2:length(data(i,:)))+ 1i.*data(i,2:2:length(data(i,:))) ) );
        title('Kea compatible data - abs');
        hold on;
        
        %pause;
    end

end