% To integrate matlab
path = 'C:\Users\Glennan519A\Desktop\Cheng\NMR Data\011518\CPMG\CPMG';

while(1)
    pause(2)
    filename =[path '\1\data2.csv'];
    % save the directory as varaible 

    
    % get the status of prospa 
    % 0 means prospa still running; 1 means prospa stops 
    
    statusname =[path '\1\matlabstatus.csv'];
    fileID = csvread(statusname);
    
    if(fileID(1)==0)
        continue
        
    else
        
        pause(100)
        id =[path '\1\id.csv'];
        
        
        if(id)
        n_40t = [0.561, 0.5905, 0.6026,0.5725 , 0.5743 , 0.5338, 0.6041, 0.5760 ,0.5986 ,0.6124];
        t40 = size(n_40t);
        n_40t_avg = sum(n_40t)/t40(2);
        n_40t_std = std(n_40t);

        n_30t = [0.4399 0.3987 0.4629 0.4034 0.4217 0.4409 0.4651 0.4680 0.4271 0.3759 0.4136];
        t30 = size(n_30t);
        n_30t_avg = sum(n_30t)/t30(2);
        n_30t_std = std(n_30t);

        n_20t = [0.3531 0.2425 0.2608 0.2584 0.3130 0.3350 0.2558 0.3024 0.2644 0.2747];
        t20 = size(n_20t);
        n_20t_avg = sum(n_20t)/t20(2);
        n_20t_std = std(n_20t);

        n_25t = [0.3480 0.3400 0.3363 0.335 0.3781 0.3626 0.4231 0.3472 0.3472 0.335];
        t25 = size(n_25t);
        n_25t_avg = sum(n_25t)/t25(2);;
        n_25t_std = std(n_25t);


        y_t =  [0,20,25,30,40];
        x_t =  [0,n_20t_avg,n_25t_avg,n_30t_avg,n_40t_avg];
        p = polyfit(x_t,y_t,1);
        xxx = polyfit(y_t,x_t,1);

        x1_t = linspace(0,50,100);
        y1_t = polyval(p,x1_t);




% figure(1)
% plot(n_40t_avg,40,'r*');hold on
% plot(n_30t_avg,30,'r*');hold on
% plot(n_25t_avg,25,'r*');hold on
% plot(n_20t_avg,20,'r*');hold on
% plot(y1_t,x1_t )


    %calculate signal/tablet relation from script 
    % Tylenol settings 
    % amplitude compared to database, dertermine the tablet
    est=read_kea_acqu(path,1,'estimate')
    est_amp = polyval(p,est);
    
	[A,T2,asymp_rms,snr]= plot_cpmg_multiexp_opt_081116(path,1,01,1,[1,1,1],est_amp,1800,0);
    % test
    % 40 tablets

    NoTablets = round(polyval(p,A));
    csvwrite([path '\1\NoTablets.csv'] ,NoTablets)
    Quantity = NoTablets*0.5;
    csvwrite([path '\1\Quantity.csv'] ,Quantity)
    
    if (Quantity>30)
        errorrate = round(polyval(p,2*n_40t_std));
    elseif (Quantity>25)
        errorrate = round(polyval(p,2*n_30t_std));       
    elseif (Quantity>20)
        errorrate = round(polyval(p,2*n_25t_std));  
    else
        errorrate = round(polyval(p,2*n_20t_std));  
    end
    csvwrite([path '\1\errorrate.csv'] ,errorrate)

    % indicate matlab finishes calculating
    status =0;
    fileID = fopen([path '\1\status.txt'],'w');
    fprintf(fileID,'%d',status);
    csvwrite([path '\1\status.csv'],status)
    % fclose(fileID);
        else
            n_20l = [0.1744 0.2079 0.1987 0.1655 0.1452 0.1701 0.1748];
            l20 = size(n_20l);
            n_20l_avg = sum(n_20l)/l20(2);
            n_20l_std = std(n_20l);
            
                    y_t =  [0,20];
        x_t =  [0,n_20l_avg];
        p = polyfit(x_t,y_t,1);
        xxx = ployfit(y_t,x_t,1);

        x1_t = linspace(0,50,100);
        y1_t = polyval(p,x1_t);
              est=read_kea_acqu(path,exptnum,'estimate')
    est_amp = polyval(p,est);
    
	[A,T2,asymp_rms,snr]= plot_cpmg_multiexp_opt_081116(path,1,01,1,[1,1,1],est_amp,400,0)
        NoTablets = round(polyval(p,A));
    csvwrite([path '\1\NoTablets.csv'] ,NoTablets)
    Quantity = NoTablets*0.5;
    csvwrite([path '\1\Quantity.csv'] ,Quantity)
            errorrate = round(polyval(p,2*n_20l_std));  
                % indicate matlab finishes calculating
    status =0;

    csvwrite([path '\1\status.csv'],status)
    end
    end
end
    