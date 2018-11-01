data = avg4;

n = 2; Wn = 0.03;
[butter_b,butter_a] = butter(n,Wn);

data = data - mean(data);

r = downconvert(data,1,400e-6,4.3e6,4.5e6,butter_a,butter_b);


figure(27); 
plot(real(r),'b-'); hold on;
plot(abs(r),'g');
plot(imag(r),'r-'); hold off;
set(gca,'FontSize',12);
title('Raw data');
xlabel('Time (s)');
ylabel('Amplitude');

figure(10); plot(data);
