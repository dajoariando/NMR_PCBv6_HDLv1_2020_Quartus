% Find value of a parameter named par_name from a Kea acqu.par file

function [val]=read_kea_acqu(path,exptnum,par_name)

val = 0;

fid=fopen([path filesep num2str(exptnum) filesep 'acqu.par']);
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    if strfind(tline,par_name)
        val=get_val(tline);
    end
end
fclose(fid);

function out=get_val(tline)

l=length(tline);
for i=1:l
    if tline(i)=='='
        out=str2num(tline(i+1:l));
        break;
    end
end