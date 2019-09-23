function Fp = computeorientationarray(Fp)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% computes orientation array at every pixel at the original image. 
% 
% outputs : Fp.orientationArray
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% modeified by S. Yanushkevich, Feb 2, 2009

im=Fp.imOrig;
contour = Fp.imSegmented;

blkSize = 10;

[fx, fy] = gradient(double(im));
orientationArray = zeros(size(im) - 2 * blkSize);

for x = 1 : size(im,1) - 2 * blkSize
    for y = 1 : size(im,2) - 2 * blkSize
        if contour(x + blkSize, y + blkSize)~=0
            orientationAngle = computelocalorientation(x + blkSize, y + blkSize, fx, fy, blkSize);
            orientationArray(x, y) = orientationAngle;
        end  
    end
end

orientationArray = padarray(orientationArray, [blkSize blkSize], 'replicate', 'both');
Fp.orientationArray = orientationArray;
