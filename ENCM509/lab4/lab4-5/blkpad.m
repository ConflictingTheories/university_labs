% Pads the original image with columns and rows in such number that the
% horizontal and vertical dimensions are divisible by blkSize


function imout = blkpad(imin, blkSize)

padRow = (ceil(size(imin,1) / blkSize) * blkSize) - size(imin, 1);
padCol = (ceil(size(imin,2) / blkSize) * blkSize) - size(imin, 2);

imout = padarray(imin, [padRow padCol], 'symmetric', 'post');
