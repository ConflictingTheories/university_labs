function Fp = findsingularitypoint(Fp)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes positions of singularity points of the fingerprint, such as
% loops, deltas, archs, ...
% It computes the irregularity values for every point from Fp.orientationArray
%
% input : Fp structure
% outputs : coordinates, that is Fp.singularityPoint coord. of the
% sinmgularity point
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% modified by S.Yanushkevich, February 02, 2009

im = double(Fp.imOrig);
[fx,fy] = gradient(im);



% Filtering the image
f = fspecial('Average', 4);
im = imfilter(im, f);

angleArray = zeros(size(im));
interval = 9;  

for i = 1 : interval : interval * floor(size(im,1)/interval)
    for j = 1 : interval:interval * floor(size(im,2)/interval)
        angleArray(i,j) = Fp.orientationArray(i,j);
    end
end


angleArray = padarray(angleArray, [interval interval], 0, 'both');
singularityArray = zeros(size(angleArray));
[X,Y] = find(angleArray ~= 0);

for i = 1 : length(X);
    
    x = X(i);
    y = Y(i);
    
    a1 = angleArray(x - interval, y - interval);
    v1 = [cos(2*a1) sin(2*a1)];
    
    a2 = angleArray(x - interval, y);
    v2 = [cos(2*a2) sin(2*a2)];
    
    a3 = angleArray(x - interval, y + interval);
    v3 = [cos(2*a3) sin(2*a3)];
    
    a4 = angleArray(x, y - interval);
    v4 = [cos(2*a4) sin(2*a4)];
    
    a5 = angleArray(x, y);
    v5 = [cos(2*a5) sin(2*a5)];
    
    a6 = angleArray(x, y + interval);
    v6 = [cos(2*a6) sin(2*a6)];
    
    a7 = angleArray(x + interval, y -interval);
    v7 = [cos(2*a7) sin(2*a7)];
    
    a8 = angleArray(x + interval, y );
    v8 = [cos(2*a8) sin(2*a8)];
    
    a9 = angleArray(x + interval, y + interval);
    v9 = [cos(2*a9) sin(2*a9)];
    
    num = norm(v1 + v2 + v3 + v4 + v5 + v6 + v7 + v8 + v9);                         %calculates the irregularity value
    denom = (norm(v1) + norm(v2) + norm(v3) + norm(v4) + norm(v5) + ...             %from the range (0,1). Zero means ridges are parallel,
        norm(v6) + norm(v7) + norm(v8) + norm(v9));                                 % close to 1 means singularity
    irregularity = num / denom;                                                     %irregularity value for 
    singularityArray(x - floor(interval/2) : x + floor(interval/2),...
        y - floor(interval/2) : y + floor(interval/2)) = irregularity;
end

singularityArray = imcrop(singularityArray, [interval+1  interval+1 size(im,2)-1 size(im,1)-1]);


singularityArray = imextendedmin(singularityArray, .1); % discards points whose irregularity<0.2
singularityArray = imclearborder(singularityArray);

%takes the borderline and if a detected pont of irregularity above 0.2 is close to the border it is being discarded
temp = Fp.imSegmented;

im = imcomplement(temp);                                %
im = padarray(im, [1 1], 1, 'both');
imdist = bwdist(im);

% remove false points
[I, J] = find(singularityArray == 1);
for i = 1 : length(I)
    if (imdist(I(i), J(i)) < 50) | (im(I(i) + 1, J(i) + 1) == 1)   
        % near border or outside fp area    
        singularityArray(I(i), J(i)) = 0;
    end
end
Fp.singularityArray = singularityArray;

% Store coordinates of singularity points in Fp struct
% !!! 1st coordinate -> column (horizontal)
%     2nd coordinate -> row (vertical)
L = bwlabeln(singularityArray);
stat = regionprops(L, 'Centroid');
Fp.singularityPoint = stat;                 %saves the coordinates of the singularity point into Fp.singularityPoint



