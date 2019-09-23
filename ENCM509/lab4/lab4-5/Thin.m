%--------------------------------------------------------------------------
%Sub-Function Thin
%--------------------------------------------------------------------------
function Iout = Thin(Iin, nbthin)
    imtemp = bwmorph(imcomplement(Iin), 'thin', nbthin);
    Iout = imcomplement(imtemp);
    %figure, imshow(Iout)