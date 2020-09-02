clear; close all; clc;

path = input('Enter the text file path(it should be in the current folder): ', 's');
%Read the text file
fid = fopen(path,'r');
bstr=[];
tline = fgets(fid);
while ischar(tline)
    bstr=[bstr,tline];
    tline = fgets(fid);
end

%Open the report text file
report = fopen('Report.txt', 'w');

%total number of words
str = fileread(path);
words = strsplit(str, {' ', '\n', ','});
nwords = size(words, 2)
fprintf(report, 'Total number of words: %d\n\n', nwords);

%average characters
wordsSize = zeros(nwords, 1);
for i = 1 : nwords
    wordsSize(i) = size(char(words(i)), 2);
end    
average = mean(wordsSize)
fprintf(report, 'Average characters used in words: %f\n\n', average);

%total number of unique words
uniqueWords = sort(unique(words));
total_number_of_uniques = size(uniqueWords, 2)
fprintf(report, 'Total number of unique words: %d\n\n', total_number_of_uniques);

%words abundance
dic = struct('row', {},...
    'word', {},...
    'abundance', {},...
    'length', {});
fprintf(report, 'Words abundance: \n');
fprintf(report, 'Row  ,  Word  ,  Abundance  ,  Length: \n');
for i = 1 : size(uniqueWords, 2)
     total = size(find(strcmp(lower(words), lower(char(uniqueWords(i))))), 2);
     dic(end + 1) = struct('row', {i}, 'word', {char(uniqueWords(i))}, ...
     'abundance', {total}, 'length', {length(char(uniqueWords(i)))}); %add the data to the struct array   
end

tb = struct2table(dic);  %convert the struct to table
sortedTb = sortrows(tb, {'abundance'} , 'descend');  %sort the table based on the abundance
sortedDic = table2struct(sortedTb);  %reconvert the table to struct
for i = 1 : size(sortedDic, 1)
     sortedDic(i).row = i;  %assign the new row numbers into the struct
     fprintf(report, '%d. "%s"  %d  %d \n', sortedDic(i).row, sortedDic(i).word, sortedDic(i).abundance, sortedDic(i).length);
end

abundanceSortedTb = struct2table(sortedDic)
%writetable(abundanceSortedTb, 'report.txt');

%Other types of the words list
fprintf(report, '\nOther types of the words list: \n');
dic = sortedDic;
tb = struct2table(dic);  %convert the struct to table
lengthSortedTb = sortrows(tb, {'length'})  %sort the table based on the length
lengthSortedDic = table2struct(lengthSortedTb);  %reconvert the table to struct

subsets = struct('lengthOfwords', {},...
    'subset', {});
for len = lengthSortedDic(1).length : lengthSortedDic(end).length   
    subsetDic = lengthSortedDic([lengthSortedDic.length] == len);
    
    if ~isempty(subsetDic)
        fprintf(report, '\n%d character words: \n', len);
        fprintf(report, 'Row  ,  Word  ,  Abundance  ,  Length: \n');
        for i = 1 : length(subsetDic)
            subsetDic(i).row = i;  %assign the new row numbers into the subsetDic
            fprintf(report, '%d. "%s"  %d  %d \n', subsetDic(i).row, subsetDic(i).word, subsetDic(i).abundance, subsetDic(i).length);
        end
        subsets(end + 1) = struct('lengthOfwords', {len}, 'subset', {subsetDic});   %add the subset to the struct of subsets
        subsetTb = struct2table(subsetDic)
    end    
    
end









