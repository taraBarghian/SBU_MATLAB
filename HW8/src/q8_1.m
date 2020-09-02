clc; clear; close all 
%%address of bench.txt
%ADDRESS = 'F:\Lessons\Matlab Lab\New folder\New folder\lastR';
fid = fopen('bench.txt','r');
bstr=[];
tline = fgets(fid);
while ischar(tline)
 bstr=[bstr,tline];
 tline = fgets(fid);
end
fclose(fid);bstr, 

