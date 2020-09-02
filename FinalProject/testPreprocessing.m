function [ dic,  tb] = testPreprocessing( path )

    dic = struct('word', {},...
    'total_percentage_abundance', {});

    rawtext = fileread(path); %files's text
    
    totalWords = strsplit(rawtext, {' ', '\n', ',', '"', '  ', '.', '(', ')', '0', '1', '2', '3', '4', '5'...
        , '6', '7', '8', '9', ';', ':', '{', '}', '-', '?', '!', '[', ']'...
        , '@', '#', '''', '&', '/', '\', '_', '+', '='});    %vector of total words in the file
    
    nwords = size(totalWords, 2);    %total number of words in the file
    
    uniqueWords = unique(lower(totalWords));    %vector of unique words in the file
    
    for i = 1 : size(uniqueWords, 2)
        total = size(find(strcmp(lower(totalWords), lower(char(uniqueWords(i))))), 2);
        dic(end + 1) = struct('word', {char(uniqueWords(i))}, ...
        'total_percentage_abundance', {(total / nwords) * 100}); %add the data to the struct array   
    end
    
    dic = rmvStopwords(dic);    %remove stopwords from the words list
    tb = struct2table(dic);  %convert the struct to table
    tb = sortrows(tb, {'total_percentage_abundance'}, {'descend'});  %sort the table based on the abundance
    dic = table2struct(tb);  %reconvert the table to struct


end

