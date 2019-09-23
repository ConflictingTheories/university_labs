function Fp = segmentimage(Fp)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SEGMENTIMAGE extracts fingerprint area from background.
%
% The original image is decomposed into blocks. Each block is
% assigned either to background (black) or to fingerprint (white).
%
% Input : 
%           - Fp : Fp.imOrig
%
% Outputs : 
%           - Fp: Fp.imsSegmented : the white pixels corresponds to fp area
%                 Fp.imContour : the white pixels corresponds to fp contour
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% modified by S.Yanushkevich, February 02, 2009

warning off MATLAB:conversionToLogical

im=Fp.imOrig;

blkSize = 16;
se = strel('disk', 16);
width = size(im, 2);
height = size(im, 1);
%%%im=imlincomb(1/max(max(im)),im); %same as division, by it does it in double precision and then truncates 
%im=im/max(max(im));
im=imdivide(im,double(max(max(im)))); %%%if dividing a matrix by a scalar, the scalar  must be double
im = blkpad(im, blkSize); % pad to a multiple of blkSize to avoid zero padding

im = histeq(im); % enhance contrast
im = medfilt2(im);

imSegmented = blkproc(im, [blkSize blkSize], @processblk);

% resize to original size because of the padding
imSegmented = imcrop(imSegmented, [0 0 width height]);


% remove isolated blocks
bw = bwareaopen(imSegmented, 8*(blkSize^2), 4);
bw = imcomplement(bw);
bw = bwareaopen(bw, 8*(blkSize^2), 4);
bw = imcomplement(bw);


% smoothing
bw = padarray(bw, [blkSize blkSize], 'symmetric', 'both');
bw = medfilt2(bw, [32 32]);
bw = bw(blkSize + 1 : size(bw,1) - blkSize, blkSize + 1 : size(bw,2) - blkSize);


Fp.imContour = bwperim(bw);
Fp.imContour = imresize(Fp.imContour, size(Fp.imOrig));

Fp.imSegmented = bw;
Fp.imSegmented = imresize(Fp.imSegmented, size(Fp.imOrig));






%--------------------------------------------------------------------------
%Sub-function processblk
%--------------------------------------------------------------------------
function  imout = processblk(imin) 

[fx, fy] = gradient(double(imin));

gradDev = (std2(fx) + std2(fy));




if gradDev > 30   % 30 good for IPS images
    imout =  ones(size(imin));
else
    imout = zeros(size(imin));
end



