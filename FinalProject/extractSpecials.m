%A function to extract special words
function newDic = extractSpecials(currenctDic, otherDic1, otherDic2)
    isNotInOther1 = ~ismember(lower(extractfield(currenctDic, 'word')), lower(extractfield(otherDic1, 'word')));
    isNotInOther2 = ~ismember(lower(extractfield(currenctDic, 'word')), lower(extractfield(otherDic2, 'word')));
    isNotInOther2s = isNotInOther1 | isNotInOther2;
    currenctDic(~isNotInOther2s) = [];
    newDic = currenctDic;
end

