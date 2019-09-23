function Fp = GaborEnhanced(Fp)

% GaboEnhanced implements directional filtering (Gabor). 
% Max nNumber of filters: 48
% Orientation  field range : [- pi/2 : pi/8 : pi/2]
% At most 3 different frequencies used
% parameter sigma {2, 4)
%
% Function findsingularitypoint function find the coordinates of singular points in
% the fingerprint
%
% Fp.frequencyArray represent the frequency matrix
%
% Function choosefrequency generates three most common frequencies from
% frequency matrix given by computelocalfrequency
%
% 
% Input : - Fp
%
% Outputs :
%         - Fp : Fp.imBinary : binary reconstructed image (local threshold method)
%                Fp.imSkeleton :  the thinned binary image 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% modified by S. Yanushkevich

Filteredimages = cell(2,8,3);
Reconstructedimages = cell(2,3);
binaryBlkSize = 20;

imoriginal = Fp.imOrig;
width = size(imoriginal, 2);
height = size(imoriginal, 1);

im = mat2gray(double(imoriginal));


% locate points of singularity, i.e. delta, loops
singularityDist = bwdist(Fp.singularityArray); 

% determines 3 freqences that will be used for directional filtering
Fp = choosefrequency(Fp);


% Creating a set of Gabor filters:
% Gabor parameter sigma is determined by the variable indsi
% Fp.frequencyVector specifies the  frequency
% Variable indan specify 8 orientations
for indfr = 1 : length(Fp.frequencyVector)
    frequency = Fp.frequencyVector(indfr);
    indsi = 2;  
    sigmax = 2 * indsi;
    sigmay = 2 * indsi;
       
    for indan = -4 : 3
        angle = indan * (pi/8);
   %%%Gabor filtering plus image filtering
        imFiltered = gaborimfilter(im, sigmax, sigmay, angle, frequency); 
        Filteredimages{indsi, indan + 5, indfr} = imFiltered;   %cell array of resulting Gabor-filtered images
    end  
end


% This is to construct the final image. 
% The values of pixels from Fp.frequencyArray and Fp.orientationArray
% are evaluated by rounding them to the closest frequency values of the Gabor filters 
% (from % Fp.frequencyVector), and the closest discrete angular value (orientation)
% is found
% 
contourDist = bwdist(Fp.imContour);
contourDist = imresize(contourDist, .3);
contour = Fp.imSegmented;

for i = 1 : size(im,1)
    for j = 1 : size(im,2)  
        if contour(i,j)~=0
            % chose the closest frequence
            frq = Fp.frequencyArray(i,j);
            temp(1 : length(Fp.frequencyVector)) = frq;
            temp = abs(Fp.frequencyVector - temp);
            freqIndice = find(temp == min(temp));
        
            ang = Fp.orientationArray(i,j);
            ang = - round(ang/(pi/8));   %finds the closest discrete angular value (orientation)
            if ang == 4; ang = -4; 
            end
            imOutput(i,j) = Filteredimages{2, ang + 5,freqIndice(1)}(i,j);
        else
            imOutput(i,j) = 0;
        end
        
    end
end


imReconstruct = mat2gray(imOutput);    %reconstructed image
imReconstruct = blkpad(imReconstruct, binaryBlkSize);
imReconstruct = blkproc(imReconstruct, [binaryBlkSize binaryBlkSize], @binarizeimage);
imReconstruct = imcrop(imReconstruct, [0 0 width height]);

Fp.imBinary = imReconstruct;            %binary version of imReconstruct
imOutput = bwmorph(imcomplement(imReconstruct),'thin', 'Inf'); %perform thinning the reconstructed image
Fp.imSkeleton = imOutput;               %stores the thinned binary image in Fp.imSkeleton




%--------------------------------------------------------------------------
%Sub-Function gaborimfilter
%--------------------------------------------------------------------------
function  imfilt = gaborimfilter(im, tx, ty, angle, f) 

%%% same as GaborFilter except for this ...
x = [-16:16];
y = [-16:16];

[x, y] = meshgrid(x,y);

xp = sin(angle) .* x + cos(angle) .* y;
yp = sin(angle) .* y - cos(angle) .* x;
gabor = exp(-0.5 * ((xp.^2 / tx^2) + (yp.^2/ty^2))) .* cos(2 * pi * f .* xp);

%%% ... and this
imfilt = imfilter(im, gabor, 'replicate', 'same');

imfilt = mat2gray(imfilt);



%--------------------------------------------------------------------------
%Sub-Function binarizeimage
%--------------------------------------------------------------------------
function  Iout = binarizeimage(Iin) 
level = graythresh(Iin);
Iout = im2bw(Iin, level);



