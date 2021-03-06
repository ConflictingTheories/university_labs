% Lab4 ENCM509 
% Fingerprint processing using Gabor filter
% Svetlana Yanushkevich
% October 1 2014 

clear all
close all

disp('-------------------------------------------------------------------');
disp('              Fingerprint preprocessing (cont.) using Gabor Filter');
disp('            Biometric Technologies Laboratory, UofC');
disp('-------------------------------------------------------------------');


    %----------------------------------------------------------------------
    %-------- Reading image from a bitmap or other format
    %----------------------------------------------------------------------
disp('Reading the image from a file')
        [namefile,pathname]=uigetfile({'*.bmp;*.tif;*.tiff;*.jpg;*.jpeg;*.gif','IMAGE Files (*.bmp,*.tif,*.tiff,*.jpg,*.jpeg,*.gif)'});
        [img,map]=imread(strcat(pathname,namefile));
        
if ndims(img) > 2
    img = double(rgb2gray(img));        % Convert to grayscale
else
    img = mat2gray(double(img));
end
 
imshow(img)

Fp.imOrig = img;
figure(1), imagesc(Fp.imOrig), colormap gray, title('Original Image');
 

 
   disp('(Press any key to continue)');
   pause;
    
      %----------------------------------------------------------------
    %-------- Gabor Filtering With  Angles
    %----------------------------------------------------------------
   
            disp('Gabor filtering With Various Angles');
        
xsize = floor(size(img,2)/10); ysize = floor(size(img,1)/10);
tx = floor(xsize/8); ty = floor(ysize/8);
f = 0.11; angle = pi/4;
fi = GaborFilter(xsize,ysize, tx, ty, angle, f);
I1 = Fp.imOrig;
If1(:,:) = imfilter(I1,fi);
F1(:,:) = blkproc(squeeze(If1(:,:)), [floor(xsize/2) floor(ysize/2)], inline('abs(mean2(x)-std(x))'));
figure(2), plot(2), imagesc(fi), colormap gray;
figure(3), plot(2), imagesc(squeeze(F1(:,:))), colormap gray;

            
    disp('(Press any key to continue)');        
    pause;