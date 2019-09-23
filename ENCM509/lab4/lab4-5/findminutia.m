function Fp = findminutia(Fp);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function finds minutiae in a binary skeletal representation of a fingerprint
%
% Input: image Fp.imSkeleton, 
% Output: minutiae image Fp.minutiaArray (matrix of minutiae image).
% Minutae are: 1 - ridge ending,  2 - bifurcation
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% modified by S.Yanushkevich, February 02, 2009

width = size(Fp.imSkeleton, 2);
height = size(Fp.imSkeleton, 1);


% resize imskeleton
Fp.imSkeleton = Fp.imSkeleton(26:height-25,26: width-25);

width = size(Fp.imSkeleton, 2);
height = size(Fp.imSkeleton, 1);
Fp.minutiaArray = zeros(height, width);

temp = Fp.imContour;
temp = imresize(temp, size(Fp.imSkeleton)); 
contourDist = bwdist(temp);



count = 1;

[X, Y] = find(Fp.imSkeleton == 0);

while count <= length(X)
    
    if ~(X(count) == 1 | X(count) == height | Y(count) == 1 | Y(count) == width )
       % if ( (X(count)~= min(find(Fp.imSkeleton(X(count),:))==0)) & (X(count)~= max(find(Fp.imSkeleton(X(count),:))==0)) )
                cnp = 0.5 * (abs(Fp.imSkeleton(X(count)-1,Y(count))-Fp.imSkeleton(X(count)-1,Y(count)-1))...
                + abs(Fp.imSkeleton(X(count)-1,Y(count)+1)-Fp.imSkeleton(X(count)-1,Y(count)))...
                + abs(Fp.imSkeleton(X(count),Y(count)+1)-Fp.imSkeleton(X(count)-1,Y(count)+1))...
                + abs(Fp.imSkeleton(X(count)+1,Y(count)+1)-Fp.imSkeleton(X(count),Y(count)+1))...
                + abs(Fp.imSkeleton(X(count)+1,Y(count))-Fp.imSkeleton(X(count)+1,Y(count)+1))...
                + abs(Fp.imSkeleton(X(count)+1,Y(count)-1)-Fp.imSkeleton(X(count)+1,Y(count)))...
                + abs(Fp.imSkeleton(X(count),Y(count)-1)-Fp.imSkeleton(X(count)+1,Y(count)-1))...
                + abs(Fp.imSkeleton(X(count)-1,Y(count)-1)-Fp.imSkeleton(X(count),Y(count)-1)));
        
            if (cnp == 1) & (contourDist(X(count), Y(count)) > 6)  
                Fp.minutiaArray(X(count), Y(count)) = 1;
            elseif (cnp >= 3) & (contourDist(X(count), Y(count)) > 6)      % bifurcation
                Fp.minutiaArray(X(count), Y(count)) = 2;
            end
        %end
    end
    count = count + 1;
end

% remove minutiae
%Sk = imcomplement(Fp.imSkeleton);   chnage from Matlab2009 to 2010
Sk= 1 - Fp.imSkeleton;
[x,y]= find(Sk);
xmax=max(x); % to avoid frequency padding....

[Xro, Yro] = find(Fp.minutiaArray == 1);
[Xrt, Yrt] = find(Fp.minutiaArray == 2);

%if less distance with border less than 10 pixel
for i = 1:length(Xro)
    if (contourDist(Xro(i), Yro(i)) < 30) || (Xro(i)>xmax-40)
        Fp.minutiaArray(Xro(i), Yro(i)) = 0;
    end
end

for i = 1:length(Xrt)
    if (contourDist(Xrt(i), Yrt(i)) < 30) || (Xrt(i)>xmax-40)
        Fp.minutiaArray(Xrt(i), Yrt(i)) = 0;
    end
end

[Xro, Yro] = find(Fp.minutiaArray == 1);
[Xrt, Yrt] = find(Fp.minutiaArray == 2);

nbend = length(Xro);
nbbif = length(Xrt);

% store coordinates of minutia and angle

[rdb, cdb] = find(Fp.minutiaArray ~= 0);
m = imresize(Fp.orientationArray, [size(Fp.minutiaArray)], 'Bicubic');

for i = 1:length(rdb)
    Fp.min(i, 1) = rdb(i);
    Fp.min(i, 2) = cdb(i); 
    Fp.min(i, 3) = m(rdb(i), cdb(i));
end