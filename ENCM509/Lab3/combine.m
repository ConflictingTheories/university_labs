function combine(filename, num, auth)
%function combine(filename, num, auth)
%
%   Combines Selected .Mat Files of the form filenameX.mat
%   where X is the num variable passed from 1-num.
%
%   auth is set to 0 for true, or any other value for false
%

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