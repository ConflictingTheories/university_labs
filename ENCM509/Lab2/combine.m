% Combine Signatures into One File

function combine(filename, num, auth)
    
    sigAll = cell(1,num);
    sAuth = cell(1,num);
    for i=1:num
        sigAll{i} = strcat(filename,num2str(i),'.mat');
        s(i) = load(sigAll{i});
        sAuth{i} = double(struct2array(s(i))');
    end
    
    if auth == 0
        save sigAUTH sAuth;
    else
        sForg = sAuth;
        save sigFORG sForg;
    end