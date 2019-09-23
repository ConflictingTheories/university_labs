%%% modified by S.Yanushkevich, February 02, 2009
% uses sub-function Thin
function showorientationfield(Fp);

displayInterval = 15;
radius = 10;
border = 10;
im = Fp.imOrig;

% imSegmented : background in black
temp = Fp.imSegmented;
imSegmentedDist = bwdist(imcomplement(temp));


temp = Fp.imContour;
temp = Thin(imcomplement(temp), 'Inf');
temp = bwmorph(imcomplement(temp), 'dilate');
figure(5), title('Contour and Orientation Field') %imshow(temp),
hold on
axis ij
imagesc(Fp.imOrig),colormap gray
for x = displayInterval : displayInterval : size(im, 1) - displayInterval
    for y = displayInterval : displayInterval : size(im, 2) - displayInterval
        
        if imSegmentedDist(x, y) > 15
            orientation = Fp.orientationArray(x, y);
            plot([y - radius/2 * cos(orientation)  y + radius/2 * cos(orientation)],...
                [x - radius/2 * sin(orientation)  x + radius/2 * sin(orientation)], 'red', 'linewidth', 1.2)
        end
    end
end

hold off

%--------------------------------------------------------------------------
%Sub-Function Thin
%--------------------------------------------------------------------------
function Iout = Thin(Iin, nbthin)
    imtemp = bwmorph(imcomplement(Iin), 'thin', nbthin);
    Iout = imcomplement(imtemp);
    %figure, imshow(Iout)
   