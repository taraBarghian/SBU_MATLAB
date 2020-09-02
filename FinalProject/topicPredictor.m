clear; close all; clc;


%path = input('Enter the folder path(it should be in the current folder): ', 's');
path1 = 'Health';
path2 = 'Sport';
path3 = 'Business';

fopen('report_lexicon.txt', 'w');   %clear the content of the report file
fclose('all');

%Creating structure arrays for words list of each folder
fprintf('\n Extracting words list from %s folder... \n', path1);
[healthDic, healthTb] = preprocessing(path1);
fprintf('\n Extracting words list from %s folder... \n', path2);
[sportDic, sportTb] = preprocessing(path2);
fprintf('\n Extracting words list from %s folder... \n', path3);
[businessDic, businessTb] = preprocessing(path3);
fclose('all');

%Extracting the special words for each folder
fprintf('\n Extracting special words ...\n');
healthSpecials = extractSpecials(healthDic, sportDic, businessDic);
sportSpecials = extractSpecials(sportDic, healthDic, businessDic);
businessSpecials = extractSpecials(businessDic, healthDic, sportDic);
fprintf('\n Processing is done.\n');

fprintf('-----------------------------------------------------------');
testPath = input('\n Enter the test file name(it should be in the current folder): ', 's');
[testDic, testTb] = testPreprocessing(testPath);
predict = similarity(testDic, healthSpecials, sportSpecials, businessSpecials);
fprintf('\n\n So The predicted topic is %s.\n', predict);


