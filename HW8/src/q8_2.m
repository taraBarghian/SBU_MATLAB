clc; clear; close all 

fid = fopen('bench.txt','r');
bstr=[];
tline = fgetl(fid);
while ischar(tline)
 bstr=[bstr,tline,newline];
 tline = fgetl(fid);
end
fclose(fid); bstr,