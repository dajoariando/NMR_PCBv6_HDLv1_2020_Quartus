function r = downconvert(s,k,tE,Df,Sf,a,b)
    % s = Sample datas in one echo
    % Df = Data frequency
    % Sf = Sampling frequency
    % tE = Echo spacing
    % k = Echo number
    
    T = 1/Sf;
    t = linspace(k*tE,k*tE+T*(length(s)-1),length(s));
	
	% compute the signal frequency: only for ADC freq below Nyquist rate
	% Ds = Df - Sf;
	
	%sReal = s' .* cos(2*pi*Ds*t);
    sReal = s' .* cos(2*pi*Df*t);
    %sImag = s' .* sin(2*pi*Ds*t);
    sImag = s' .* sin(2*pi*Df*t);
		

    %n = 3; Wn = 0.008;
    %n = 3; Wn = 0.001;
    %[b,a] = butter(n,Wn);

    r = filter(b,a,sReal+1i*sImag); % Forward-backward filter to cancel time delay
    %r = filtfilt(b,a,sReal+1i*sImag); % Forward-backward filter to cancel time delay
    %r = sReal+1i*sImag; % Forward-backward filter to cancel time delay

%     figure(27); hold on;
%     plot(t,real(r),'b-');
%     plot(t,imag(r),'r-');
%     set(gca,'FontSize',12);
%     title('Raw data');
%     xlabel('Time (s)');
%     ylabel('Amplitude');

end