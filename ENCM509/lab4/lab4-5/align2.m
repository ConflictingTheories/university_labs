%%%modified by S. Yanushkevich on Feb.10, 2010
% modified by A. Poursaberi on February 18, 2011


function Fp2 = align2(Fp1,Fp2)
warning off all

matchingScore = [];
cond_valid = 0;


f = fspecial('gaussian',[8 8],  6); %%% define a special filter
sizeInput = size(Fp2.imSkeleton);
sizeRef = size(Fp1.imSkeleton);
padSize = 40; %%%you can chnage the size of the cropped image

dbSkel= imcomplement(full(Fp1.imSkeleton)); % modified by A. Poursaberi
%%%%% dbSkel= full(imcomplement(Fp1.imSkeleton)); %%%Convert sparse matrix 
%%% which is the complement (256-pixel value) of the fingerprint's skeleton
dbMinutia = full(Fp1.minutiaArray); %%%Convert sparse matrix to full matrix

inputSkel= imcomplement(full(Fp2.imSkeleton)); % modified by A. Poursaberi
%%%%%inputSkel = full(imcomplement(Fp2.imSkeleton));
inputMinutia = full(Fp2.minutiaArray);

se = ones(3); %%%creates 3x3 matrix of 1s
dbMinutia = imdilate(dbMinutia, se); %%%Make the output image the size of 3x3
inputMinutia = imdilate(inputMinutia, se);


angle = 0;
maxCorr = 0;
maxRef = 0;
dwnSampleFactor = 2;


inputSkelp = imfilter(double(inputSkel), f); %%%filtering using the filter specified by f
dbSkelp = imfilter(double(dbSkel), f);

inputSkelp = inputSkelp/max(inputSkelp(:));
dbSkelp = dbSkelp/max(dbSkelp(:));

inputSkelp = imresize(inputSkelp, 1/dwnSampleFactor);
dbSkelp = imresize(dbSkelp, 1/dwnSampleFactor);

t1 = size(inputSkelp,1);
t2 = size(inputSkelp,2);

% looking for best translation
im1=zeros(size(dbSkel,1),size(dbSkel,2));
[x,y]= find(Fp1.singularityArray);
for i=1:length(x)          
    im1(x(i),y(i))=3;
end
im2=zeros(size(dbSkel,1),size(dbSkel,2));
[x,y]= find(Fp2.singularityArray);
for i=1:length(x)          
    im2(x(i),y(i))=3;
end

% compute max correlation coefficient
c = normxcorr2(im2,im1); 
[max_cc, imax] = max(abs(c(:)));
[ypeak, xpeak] = ind2sub(size(c),imax(1));
offset = [ (ypeak-size(im1,1)) (xpeak-size(im1,2)) ];

%reconstruction good fp skeletonp translated
%translate
inputSkelpreconstruct=inputSkelp;
for i=1:size(inputSkelpreconstruct,1)
    for j=1:size(inputSkelpreconstruct,2)
        if (i-offset(1))>0 & (i-offset(1))<size(inputSkelpreconstruct,1)& (j-offset(2))>0 & (j-offset(2))<size(inputSkelpreconstruct,2)
            im(i,j)=inputSkelpreconstruct(i-offset(1),j-offset(2));
        else im(i,j)=0;
        end
    end
end
inputSkelpreconstruct=im;

%reconstruction good fp skeleton
inputSkelreconstruct=inputSkel;
%%%translate (move or shift image) according to offset
for i=1:size(inputSkelreconstruct,1)
    for j=1:size(inputSkelreconstruct,2)
        if (i-offset(1))>0 & (i-offset(1))<size(inputSkelreconstruct,1)& (j-offset(2))>0 & (j-offset(2))<size(inputSkelreconstruct,2)
            im(i,j)=inputSkelreconstruct(i-offset(1),j-offset(2));
        else im(i,j)=0;
        end
    end
end
inputSkelreconstruct=im;

% looking for best rotation
for ang = -12:3:12
    inputSkelr = imrotate(inputSkelpreconstruct, ang, 'crop');
    cc = normxcorr2(inputSkelr, dbSkelp);
     
    % compute max correlation coefficient
    [max_cc, imax] = max(abs(cc(:)));
    [rpeak, cpeak] = ind2sub(size(cc),imax(1));
    corr_offset = [rpeak cpeak];
    corr_offset = [(rpeak-size(inputSkelr,1)) (cpeak-size(inputSkelr,2))];
    
    if max_cc > maxRef
        maxRef = max_cc;
        offsetrot = corr_offset;
        angle = ang;
        ccRef = cc;
    end
    
end


%%%reconstruction of the  good fp skeleton
%rotation
inputSkelreconstruct=imrotate(inputSkelreconstruct,angle,'crop');
xs = showsimilarity(dbSkel,inputSkelreconstruct);
%%%% inputSkelreconstruct = full(imcomplement(inputSkelreconstruct));
inputSkelreconstruct = imcomplement(full(inputSkelreconstruct)); % modified by A. Poursaberi
Fp2.imSkeletonAlign=inputSkelreconstruct;

%%%reconstruct the good minutiae
%rotation
inputMinRec=inputMinutia;
inputMinRec=imrotate(inputMinRec,angle,'crop');
%translate
for i=1:size(inputMinRec,1)
    for j=1:size(inputMinRec,2)
        if (i-offset(1))>0 & (i-offset(1))<size(inputMinRec,1)& (j-offset(2))>0 & (j-offset(2))<size(inputMinRec,2)
            im(i,j)=inputMinRec(i-offset(1),j-offset(2));
        else im(i,j)=0;
        end
    end
end
inputMinRec=im;
%%% make superposed skeletons + minutiae

[x1,y1]= find(dbMinutia);
[x2,y2]= find(im);

hold on, title('Minutiae')
plot(y1,x1,'or','markersize',8)
plot(y2,x2,'sb','markersize',8), axis ij
legend('Fp1 minutiae', 'Fp2 minutiae')
hold off

Fp2.minutiaArrayAlign=im;


%--------------------------------------------------------------------------
function x = showsimilarity(db, input)

    
Color = db + 1;
[I, J] = find(input == 1);
 
for i = 1 : length(I)
    Color(I(i), J(i)) = 3;
end
  
map = [1 1 1;0.7 0 0;0 0 0];%%%specifies the color map (full color, red, blank)
x = ind2rgb(Color, map); %%%converts 3 colours of the pixel and the
%%%    colormap MAP to RGB (truecolor) format.
figure, imshow(x)





