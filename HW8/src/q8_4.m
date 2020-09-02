clc; clear; close all 


%fileread
filetext = fileread('bench.txt');
filetext

%%%%%%%%%%%%%

%textread
[name1, name2, name3] = textread('bench.txt', ...
    '%s %s %s ', 1)
