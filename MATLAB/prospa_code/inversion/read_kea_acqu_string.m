% Find value of a string parameter named par_name from a Kea acqu.par file

function [out_str]=read_kea_acqu_string(path,exptnum,par_name)

fid=fopen([path filesep num2str(exptnum) filesep 'acqu.par']);
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    if strfind(tline,par_name)
        out_str=get_string(tline);
    end
end
fclose(fid);

function out=get_string(tline)

l=length(tline);
for i=1:l
    if tline(i)==char(34) % char(34) = "
        out=tline(i+1:l-1); % remove final "
        break;
    end
end