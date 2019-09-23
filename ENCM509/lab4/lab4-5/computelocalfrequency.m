function Fp = computelocalfrequency(Fp, im);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes local frequencies in a fingerprint image at discrete position at
% grid defined by step (depends on the size of the original image).
% 
% Frequency computed function frequest
% Usage:
%  freqim =  freqest(Fp)
%
% Input:
%         Fp : - structure
%        
% Output:
%         Fp : - Fp.frequencyArray, a matrix of the size identical with the
%                original image with all values set to the estimated ridge 
%                spatial frequency
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

border = 30; %prevents from calculating the frequencies too close from the border of the image
%%%step = max(round(size(im, 2)/8), 50);
step = max(round(size(im, 2)/16), 40);

f = fspecial('Average', 3);
imh = imfilter(im, f);
imh = histeq(imh);
contour=Fp.imSegmented;

ind1 = 2;
ind2 = 2;
if size(im,1) - border < border
    disp('error in computlocalfrequency.m, size too small');
end


frequencyArray = zeros(size(im,1),size(im,2));
for i = border : step : size(im,1) - border
    ind2 = 2;
    for j = border : step : size(im,2) - border
        if (i+step < size(im,1) - border) & (j+step < size(im,2) - border)
        imc = im(i:i+step,j:j+step);
        orient = Fp.orientationArray(i:i+step,j:j+step);
        frequencyArray(i:i+step,j:j+step) =  freqest(imc, orient, 5, 5, 15);
        end
        ind2 = ind2 + 1;
    end
    ind1 = ind1 + 1;
end

% frequencyArray = zeros(size(im,1),size(im,2));
% for i = 1 : step : size(im,1)
%     ind2 = 2;
%     for j = 1 : step : size(im,2)
%         if (i+step < size(im,1)) & (j+step < size(im,2))
%             if (Fp.imSegmented(round(i+step/2),round(j+step/2))~=0)
%                 imc = im(i:i+step,j:j+step);
%                 orient = Fp.orientationArray(i:i+step,j:j+step);
%                 frequencyArray(i:i+step,j:j+step) =  freqest(imc, orient, 5, 5, 15);
%             end
%         end
%         ind2 = ind2 + 1;
%     end
%     ind1 = ind1 + 1;
% end


Fp.frequencyArray = frequencyArray;         