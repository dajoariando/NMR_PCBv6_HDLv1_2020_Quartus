function noise_plot(data_folder)
    fs = 25e6;
    
    data = load([data_folder,'\noisedata.o']); % import settings file from the wobble folder
    figure(3);
    Tf = 1/fs;
    xtime = linspace(Tf,(length(data)-1)*Tf,length(data));
    plot(xtime*1e6,data);
    title('Noise data');
    xlabel('Time (\muS)');
    ylabel('Amplitude');
    
    figure(4); hold on;
    histfit(data);
    
    
    
    [~, ~] = nmr_fft(data_folder,'noisedata.o',fs);
    
    
end