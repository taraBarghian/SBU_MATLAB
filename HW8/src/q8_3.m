clc; clear; close all 


%As the name suggests, both the functions are used for scanning the input data,
%but the main difference is the medium of input.
%fscanf : Read data from text file
%sscanf : Read formatted data from string


fid = fopen('bench.txt','r');
k = 0;
while ~feof(fid)
 curr = fscanf(fid,'%c',1);
 if ~isempty(curr)
 k = k+1;
 bstr(k) = curr;
 end
end
fclose(fid);bstr,
[A,n,errmsg] = sscanf(bstr,'%f')

info='0.0735    0.1026    0.1964    0.2728    0.3955    0.3876';
info = sscanf(info,'%f', [2 3])

