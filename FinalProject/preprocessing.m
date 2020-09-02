function [ dic,  tb] = preprocessing( path )


%Read the text files in the folder
directory = dir([path, '\*.txt']);

%open a text file to write the report in it
report = fopen('report_lexicon.txt', 'a+');

n = length(directory);  % n = number of text files in the folder

if ~isempty(directory)
    dic = struct('word', {},...
    'folder_name', {},...
    'total_percentage_abundance', {});

    mergedTexts = [];
    
    for i = 1 : n   %for loop over text files in the directory 
        rawtext = fileread([path, '/', directory(i).name]); %files's text
        mergedTexts = [mergedTexts, rawtext];    %mergeTexts is a string which contains all the text files in the folder
    end
    %TODO .........
    totalWords = strsplit(mergedTexts, {' ', '\n', ',', '"', '  ', '.', '(', ')', '0', '1', '2', '3', '4', '5'...
        , '6', '7', '8', '9', ';', ':', '{', '}', '-', '?', '!', '[', ']'...
        , '@', '#', '''', '&', '/', '\', '_', '+', '='});    %vector of total words in the folder
    
    nwords = size(totalWords, 2);    %total number of words in the folder
    uniqueWords = unique(lower(totalWords));    %vector of unique words in the folder
    
    
    for i = 1 : size(uniqueWords, 2)
        total = size(find(strcmp(lower(totalWords), lower(char(uniqueWords(i))))), 2);
        dic(end + 1) = struct('word', {char(uniqueWords(i))}, 'folder_name', {path}, ...
        'total_percentage_abundance', {(total / nwords) * 100}); %add the data to the struct array   
        
        
    end
    
    dic = rmvStopwords(dic);    %remove stopwords from the words list
    tb = struct2table(dic);  %convert the struct to table
    tb = sortrows(tb, {'total_percentage_abundance'}, {'descend'});  %sort the table based on the abundance
    dic = table2struct(tb);  %reconvert the table to struct
    
    %For loop for writing the informations in the report file
    fprintf(report, '\nWords information for %s topic: \n\n', path);
    
    fprintf(report, '\nWord  ,  Topic  ,  Total_percentage_abundance \n');
    fprintf(report, '-------------------------------------------------------------------------------\n');
    for i = 1 : size(dic, 1)
        fprintf(report, '%s  %s  %f \n', dic(i).word, dic(i).folder_name, dic(i).total_percentage_abundance);
    end
end

fclose('all');
end

