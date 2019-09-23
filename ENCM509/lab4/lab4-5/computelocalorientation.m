function orientation = computelocalorientation(x, y, fx, fy, blkSize)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculates the orientation for a given pixel of coord. x,y
% use :
%   fx, fy - gradients of the image (given by gradient function (Matlab))
%   blkSize - half-side length of the neighborhood square around pixel x,y
% 
% Inputs : 
%       - x,y : coordinates of pixel
%       - fx,fy : image gradient of original image
%       - blkSize : size of block to analyse
%
% Outputs :
%       - orientation : angle of pixels into the analysed block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fxtemp = fx(x - blkSize : x + blkSize, y - blkSize : y + blkSize);
fytemp = fy(x - blkSize : x + blkSize, y - blkSize : y + blkSize);

Gxy = fxtemp .* fytemp;
Gxx = fxtemp.^2 + (rand/10000);
Gyy = fytemp.^2 + (rand/10000);

Gxy = sum(Gxy(:));
Gxx = sum(Gxx(:));
Gyy = sum(Gyy(:));

expr1 = (Gxx - Gyy);
expr2 = (2 * Gxy);


if expr1 >= 0
    theta =  0.5 * atan((2 * Gxy)/(Gxx-Gyy));
elseif expr1 < 0 & expr2 > 0
    theta =  0.5 * (atan((2 * Gxy)/(Gxx-Gyy)) + (pi));
else 
    theta =  0.5 * (atan((2 * Gxy)/(Gxx-Gyy)) - (pi));
end


if theta <=0
    orientation = theta + pi/2;
else 
    orientation = theta - pi/2;
end

