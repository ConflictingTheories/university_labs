%created by S. Yanushkevich Feb.2, 2009
function  gabor = GaborFilter(xsize,ysize,tx, ty, angle, f) 

x = [-xsize/2:xsize/2];
y = [-ysize/2:ysize/2];

[x, y] = meshgrid(x,y);

xp = sin(angle) .* x + cos(angle) .* y;
yp = sin(angle) .* y - cos(angle) .* x;
gabor = exp(-0.5 * ((xp.^2 / tx^2) + (yp.^2/ty^2))) .* cos(2 * pi * f .* xp);


