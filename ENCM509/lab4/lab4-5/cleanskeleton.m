function Fp = cleanskeleton(Fp);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLEANSKELETON cleans the thinned version of fingerprint. 
%
% It removes bridges, spurs, and link break.  
% Cs is an intern stucture of this function.
% uses separate subfunctions for removal of each type of artifacts:
% Cs = removespur(Cs);
% Cs = linkbreak(Cs);
% Cs = removebridge(Cs);
% Each subfunction calls Cs = detectendbifurcation(Cs) to clean the 
% minutiae matrix
% Input :
%       - Fp
% Outputs :
%       - Fp : Fp.imSkeleton : skeleton image
%              Fp.minutiaArray : matrix of minutiae data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% modified by S. Yanushkevich, Feb 2, 2009

warning off all

Cs.skeleton = Fp.imSkeleton;
Cs.contour = Fp.imContour;
Cs.orientationArray = imresize(Fp.orientationArray, [size(Fp.imOrig)]);


Cs.holeBlkSize = 200;
Cs.spurInterval = 10;
Cs.bridgeInterval = 12;
Cs.breakInterval = 10;
width = size(Cs.skeleton, 2);
height = size(Cs.skeleton, 1);


% remove background components from skeleton
temp = Fp.imSegmented;
Cs.skeleton = temp & Cs.skeleton;

Cs.skeleton = imcomplement(Cs.skeleton);
Cs.skeleton = padarray(Cs.skeleton, [25 25], 1, 'both');


% remove holes 
% If a 'hole' is present in a bigger 'hole', small one not detected
% -> use different blkSize to detect 'holes

skeleton = Cs.skeleton;
for i = 1:5
    blkSize = round(Cs.holeBlkSize/i);
    skeleton = blkproc(skeleton, [blkSize blkSize], @removehole);
    skeleton = Thin(imcomplement(skeleton), 'Inf');
end



% remove noise, i.e. small objects
skeleton = bwareaopen(imcomplement(skeleton), 20);
Cs.skeleton = imcomplement(skeleton);


[Cs.fx, Cs.fy] = gradient(double(Cs.skeleton));
Cs = detectendbifurcation(Cs);


% remove spurs
Cs = removespur(Cs);

% link breaks
Cs = linkbreak(Cs);

% remove bridges
Cs = removebridge(Cs);

Cs = removespur(Cs);


Cs.skeleton = blkproc(Cs.skeleton, [blkSize blkSize], @removehole);
Cs.skeleton = Thin(imcomplement(Cs.skeleton), 'Inf');
Cs.skeleton = bwareaopen(imcomplement(Cs.skeleton), 10);
Cs.skeleton = imcomplement(Cs.skeleton);

% store in Fp the clean version  of skeleton

Fp.imSkeleton = Cs.skeleton;
Fp.minutiaArray = Cs.minutiaArray;         %matrix of minutiae image is stored in Fp.minutiaArray
Fp.imSkeleton = sparse(Fp.imSkeleton); %skeleton image Fp.imSkeleton is updated with a cleaned skeleton

warning on all





%--------------------------------------------------------------------------
%Sub-Function detectendbifurcation
%--------------------------------------------------------------------------
function Cs = detectendbifurcation(Cs);    %cleans the minutiae matrix Cs.minutiaArray from artifacts

% Input : skeleton of fingerprint.
% Output : matrix containing ends of line and bifurcations.
% Ends of line are marked 1, Bifurcations 2.

width = size(Cs.skeleton, 2);
height = size(Cs.skeleton, 1);

temp = Cs.contour;

% pad to fit the size of the skeleton and array of minutia.
temp = padarray(temp, [25 25], 0, 'both');
contourDist = bwdist(temp);

Cs.minutiaArray = zeros(height, width);

count = 1;
[X, Y] = find(Cs.skeleton == 0);
while count <= length(X)
    
    cnp = 0.5 * (abs(Cs.skeleton(X(count)-1,Y(count))-Cs.skeleton(X(count)-1,Y(count)-1))...
        + abs(Cs.skeleton(X(count)-1,Y(count)+1)-Cs.skeleton(X(count)-1,Y(count)))...
        + abs(Cs.skeleton(X(count),Y(count)+1)-Cs.skeleton(X(count)-1,Y(count)+1))...
        + abs(Cs.skeleton(X(count)+1,Y(count)+1)-Cs.skeleton(X(count),Y(count)+1))...
        + abs(Cs.skeleton(X(count)+1,Y(count))-Cs.skeleton(X(count)+1,Y(count)+1))...
        + abs(Cs.skeleton(X(count)+1,Y(count)-1)-Cs.skeleton(X(count)+1,Y(count)))...
        + abs(Cs.skeleton(X(count),Y(count)-1)-Cs.skeleton(X(count)+1,Y(count)-1))...
        + abs(Cs.skeleton(X(count)-1,Y(count)-1)-Cs.skeleton(X(count),Y(count)-1)));
    
    if (cnp == 1)  & (contourDist(X(count), Y(count)) > 5)  
        % end of ridge and not to close from border
        Cs.minutiaArray(X(count), Y(count)) = 1;
    elseif (cnp >= 3) & (contourDist(X(count), Y(count)) > 5)  
        % bifurcation
        Cs.minutiaArray(X(count), Y(count)) = 2;
    end
    count = count + 1;
end




%--------------------------------------------------------------------------
%Sub-Function linkbreak
%--------------------------------------------------------------------------
function Cs = linkbreak(Cs)

count = 1;
[Im, Jm] = find(Cs.minutiaArray == 1);

while count <= length(Im)
    
    x = Im(count);
    y = Jm(count);
    
    % 1st test : distance, i.e. explore the neighborhood of pixel (x,y)
    test =  Cs.minutiaArray(x - Cs.breakInterval : x + Cs.breakInterval,...
        y - Cs.breakInterval : y + Cs.breakInterval);
    
    test(Cs.breakInterval + 1,Cs.breakInterval +1) = 0;
    
    [I, J] = find(test == 1);
    
    label_mat = zeros( 2 * Cs.breakInterval + 3);
    label_mat(2 : 2 *Cs.breakInterval + 2, 2 : 2 *Cs.breakInterval + 2)...
        = imcomplement(Cs.skeleton(x - Cs.breakInterval : x + Cs.breakInterval,...
        y - Cs.breakInterval : y + Cs.breakInterval));
    
    L = bwlabel(label_mat, 8);
    
    if ~isempty(I) 
        % another ridge's ending in the neighbourhood
        
        
        for i = 1:length(I)
            
            
            % if the ends are not connected, we can continue the test.
            % Otherwise,  for sure (x,y) is not an end of line 
            % (lie on the same ridge)
            if ~(L(Cs.breakInterval + 2,Cs.breakInterval + 2) == L(I(i) + 1, J(i) +1))
                
                a = x - Cs.breakInterval + (I(i)-1);
                b = y - Cs.breakInterval + (J(i)-1);
                
                alpha1 = Cs.orientationArray(a-25, b-25);
                alpha2 = Cs.orientationArray(x-25, y-25);
                alpha3 = - atan((b - y)/(a - x));
      
               
                cond3 = (sqrt((x - a)^2 + (y - b)^2) <= 8);
                
                diff = min(abs(alpha1 - alpha2), pi - abs(alpha1 - alpha2));
                cond1 = diff < pi/4;
              
                            
                % If two ends are pointing towards the same direction and are
                % alignated. Or if two are pointing towards the same direction
                % and are close. That's because two close ends could be not
                % alignated.
                if cond3 & cond1
                    
                    % link the two end points
                    [cx,cy,c] = improfile(Cs.skeleton, [a x], [b y]);
                    cxc = ceil(cx);
                    cyc = ceil(cy);
                    cxf = floor(cx);
                    cyf = floor(cy);
                    
                    for i = 1:length(cxc)
                        Cs.skeleton(cxc(i), cyc(i)) = 0;
                        Cs.skeleton(cxf(i), cyf(i)) = 0;
                    end
                
                end
            end
        end
    end
    
    count = count + 1;
end

Cs.skeleton = Thin(Cs.skeleton, 'Inf');
[Cs.fx, Cs.fy] = gradient(double(Cs.skeleton));
Cs = detectendbifurcation(Cs);




%--------------------------------------------------------------------------
%Sub-Function removespur
%--------------------------------------------------------------------------
function Cs = removespur(Cs)

[Im, Jm] = find(Cs.minutiaArray == 1);
count = 1; 

while count <= length(Im)
    
    x = Im(count);
    y = Jm(count);
    
    matrixtemp = Cs.minutiaArray(x - Cs.spurInterval : x + Cs.spurInterval,...
                                 y - Cs.spurInterval : y + Cs.spurInterval);
    
    % take the corresponding part on skeleton
    label_mat = imcomplement(Cs.skeleton(x - Cs.spurInterval : x + Cs.spurInterval,...
                                         y - Cs.spurInterval : y + Cs.spurInterval));
                                     
    label_mat = padarray(label_mat, [1 1], 0, 'both');
    
    L = bwlabel(label_mat, 8);
    
    % Is there a bifurcation close to end?
    [I, J] = find(matrixtemp == 2);
    
    for i = 1 : length(I)
        
        % a, b : coordinates of bifurcation in Cs.skeleton
        a = x - Cs.spurInterval + (I(i) - 1);
        b = y - Cs.spurInterval + (J(i) - 1);
        
        if (L(Cs.spurInterval + 2, Cs.spurInterval + 2) == L(I(i) + 1, J(i) + 1))
            % birucation and end are linked
            
            % remove spur in Cs.skeleton
            test = Cs.skeleton(min(x,a) - 2 : max(x,a) + 2, min(y,b) - 2: max(y,b) + 2);
            temp = bwmorph(imcomplement(test), 'spur', 'inf');
            Cs.skeleton(min(x,a) - 2 : max(x,a) + 2, min(y,b) - 2: max(y,b) + 2) = imcomplement(temp);
            
        end
    end
    count = count + 1;
end

[Cs.fx, Cs.fy] = gradient(double(Cs.skeleton));
Cs = detectendbifurcation(Cs);



%--------------------------------------------------------------------------
%Sub-Function removebridge
%--------------------------------------------------------------------------
function Cs = removebridge(Cs)

count = 1;
[Im, Jm] = find(Cs.minutiaArray == 2);

while count <= length(Im)
    
    x = Im(count);
    y = Jm(count);
    
    matrixtemp1 =  Cs.minutiaArray(x-3 : x+3,  y-3 : y+3);
    matrixtemp1(4, 4) =0;
    
    matrixtemp2 =  Cs.minutiaArray(x - Cs.bridgeInterval : x + Cs.bridgeInterval,...
                                   y - Cs.bridgeInterval : y + Cs.bridgeInterval);    
    matrixtemp2(Cs.bridgeInterval + 1, Cs.bridgeInterval +1) = 0;
    
    % segment line objects
    lineobjects = padarray(imcomplement(Cs.skeleton(x - Cs.bridgeInterval : x + Cs.bridgeInterval,...
                                                    y - Cs.bridgeInterval : y + Cs.bridgeInterval)), [1 1], 0, 'both');
                                                
    L = bwlabeln(lineobjects, 8);
    
    % search other bifurcation in neighborhood
    [I, J] = find(matrixtemp2 == 2);
    if isempty(I)
        Cs.minutiaArray(x,y) = 2;    
        % no other bifurcation found in neighborhood -> keep bifurcation
    else
        
        for i = 1 : length(I)
            if (L(Cs.bridgeInterval + 2, Cs.bridgeInterval +2 ) == L(I(i) + 1, J(i) +1))  
                % test if bifurcation lies on the same line
                
                a = x - Cs.bridgeInterval + (I(i) - 1);
                b = y - Cs.bridgeInterval + (J(i) - 1);
                
                alpha1 = Cs.orientationArray(a-25, b-25);
                alpha2 = Cs.orientationArray(x-25, y-25);
              
                
                v1 = [cos(alpha1) sin(alpha1)];   %local orientation of 1st bifurcation
                v2 = [cos(alpha2) sin(alpha2)];   %local orientation of 2nd bifurcation
                v3 = [(b - y) (a - x)];           %vector between the two bifurcations
                
                % 2nd test : compare local orientation 
                %diff_orientation = abs(acos(dot(v1, v2) / (norm(v1) * norm(v2))));
                diff_orientation = min(abs(alpha1 - alpha2), pi - abs(alpha1 - alpha2));
                
                % compute angle between subspace
                % pi -> potential bridge perpendicular to ridges
                cond1 =  subspace(v1', v3') + subspace(v2', v3') > (pi/2);  
                
                cond2 = diff_orientation < pi/2;
                
                if cond1 & cond2
                    
                    % remove black pixels that form the bridge
                    [cx, cy, c] = improfile(Cs.skeleton, [a x], [b y]);
                    cxr = round(cx);
                    cyr = round(cy);
                    
                    for i = 1:length(cxr)
                        Cs.skeleton(cxr(i), cyr(i)) = 1;
                    end
                    
                    Cs.skeleton(a,b) = 0;
                    Cs.skeleton(x,y) = 0;
                    
                    test = Cs.skeleton(min(x,a) - 1 : max(x,a) + 1, min(y,b) - 1 : max(y,b) + 1);
                    
                    temp = bwmorph(imcomplement(test), 'spur', 'inf');
                    
                    Cs.skeleton(min(x,a) - 1 : max(x,a) +1, min(y,b) - 1: max(y,b) + 1) = imcomplement(temp);
                    
                    Cs.skeleton = bwareaopen(imcomplement(Cs.skeleton),10);
                    Cs.skeleton = imcomplement(Cs.skeleton);
                    
                    break
                end
            end
        end  
    end
    count = count + 1;
end
Cs = detectendbifurcation(Cs);

%--------------------------------------------------------------------------
%Sub-Function removehole
%--------------------------------------------------------------------------
function imout = removehole(imin)

imtemp = imfill(imcomplement(imin), 4, 'holes');

imtemp = imcomplement(imtemp);
imhole = imin - imtemp;

hole_objects = bwlabeln(imin - imtemp);
hole_stat = regionprops(hole_objects, 'Area');

for i = 1:length(hole_stat)
    if hole_stat(i).Area > 120 
        [I, J] = find(hole_objects == i);
        for j = 1 : length(I)
            imhole(I(j), J(j)) = 0;
        end
    end
end

imout = (imcomplement(imin) | imhole);



%--------------------------------------------------------------------------
%Sub-Function Thin
%--------------------------------------------------------------------------
function Iout = Thin(Iin, nbthin)
    imtemp = bwmorph(imcomplement(Iin), 'thin', nbthin);
    Iout = imcomplement(imtemp);
    %figure, imshow(Iout)