function [vals]=get_params(path_curr,param_names)

[~,num_param]=size(param_names);

vals={};

fid=fopen([path_curr filesep 'acqu.par']);
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    for j=1:num_param
        if strfind(tline,param_names{j})
            vals{j}=get_val(tline);
        end
    end
end
fclose(fid);

function out=get_val(tline)

l=length(tline);
for i=1:l
    if tline(i)=='='
        out=tline(i+1:l);
        break;
    end
end