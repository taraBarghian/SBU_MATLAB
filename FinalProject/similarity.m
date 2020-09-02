function predict = similarity(testDic, healthSpecials, sportSpecials, businessSpecials)

    isHealth = sum(ismember(lower(extractfield(testDic, 'word')), lower(extractfield(healthSpecials, 'word'))));
    isSport = sum(ismember(lower(extractfield(testDic, 'word')), lower(extractfield(sportSpecials, 'word'))));
    isBusiness = sum(ismember(lower(extractfield(testDic, 'word')), lower(extractfield(businessSpecials, 'word'))));
    
    s = isHealth + isSport + isBusiness;
    
    isHealth = (isHealth / s) * 100;
    isSport = (isSport / s) * 100;
    isBusiness = (isBusiness / s) * 100;
   
    predicts = struct('topic', {'Health', 'Sport', 'Business'},...
    'predict', {isHealth, isSport, isBusiness});

    fprintf('\n Health ---> %f percent\n', isHealth);
    fprintf('\n Sport ---> %f percent\n', isSport);
    fprintf('\n Business ---> %f percent\n', isBusiness);
    
    tb = struct2table(predicts);  %convert the struct to table
    tb = sortrows(tb, {'predict'}, {'descend'});
    predicts = table2struct(tb);
    
    predict = predicts(1).topic;

end

