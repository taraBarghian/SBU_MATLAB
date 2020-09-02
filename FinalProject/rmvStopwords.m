%A function to remove stop words from a word list
function newDic  = rmvStopwords(dic)
    stopwords = strsplit(fileread('stopwords.txt'), {'\n'});
    isStopword = ismember(lower(extractfield(dic, 'word')), stopwords); %create a logical vector whiche determines if the corresponding word is stopword or not
    dic(isStopword) = [];   %remove the stopwords from dictionary
    newDic = dic;
end

