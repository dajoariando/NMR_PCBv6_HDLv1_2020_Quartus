data = importfile('asum');

% settings
dcval = 9725; % the DC value of the sequence
trim_fact = 4; % trim the data so that the output text file is not that long

% remove DC
data = data - dcval;


% IQ data extraction
dataI = zeros(length(data),1);
dataI(1:4:length(data),1) = data(1:4:length(data),1).*0.707;
dataI(2:4:length(data),1) = data(2:4:length(data),1).*0.707;
dataI(3:4:length(data),1) = data(3:4:length(data),1).*-0.707;
dataI(4:4:length(data),1) = data(4:4:length(data),1).*-0.707;

subplot(2,1,1);
plot(dataI(1:2:length(dataI)/trim_fact)); hold on;
plot(dataI(2:length(dataI)/trim_fact));

csvwrite('../FIR_test_input.txt',dataI_nozero(1:length(dataI)/trim_fact));


