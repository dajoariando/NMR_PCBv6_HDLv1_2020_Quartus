n = 1; Wn = 0.03;
[butter_b,butter_a] = butter(n,Wn);

path = [data_folder,'nmr_2018_03_05_20_28_17'];
filename = '\dat';
data_freq = 4.3e6;
enable_figure = 0;
SpS = 10;

[a,a_init,a_avg] = compute_multiple(path,filename,data_freq,enable_figure, butter_a, butter_b, SpS);
