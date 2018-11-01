function remove_ringing(path,expts,numpts,NE)

close all;
numexpts=length(expts);

for i=1:numexpts
    filname=[path '\' num2str(expts(i)) '\data_orig.csv'];
    data=csvread(filname);
    
    filname=[path '\' num2str(expts(i)) '\data_orig.csv'];
    csvwrite(filname,data);
    
    sizdata=size(data);
    pe=sizdata(1)/NE;
    for j=1:NE
        vect=(j-1)*pe+1:(j-1)*pe+numpts;
        data(vect,1)=zeros(1,numpts);
        data(vect,2)=zeros(1,numpts);
    end
    
    filname=[path '\' num2str(expts(i)) '\data.csv'];
    csvwrite(filname,data);
end
