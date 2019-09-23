%=========== ENCM 509 ===============%
%=========== Lab 5: Fingerprint: Part II ===============%
%============ Fingerpint matching score =================%
% by S. Yanushekvich, February 04,2009
% based on 
% updated October 1, 2014
clear all
close all


disp('-------------------------------------------------------------------');
disp(' Lab 5, ENCM509');
disp('Biometric Technologies Laboratory, UofC');
disp('Fingerprint matching using Euclidean distance and Gabor filter');
disp('-------------------------------------------------------------------');


    %----------------------------------------------------------------------
    %-------- Select fingerprint 1
    %----------------------------------------------------------------------
       disp('Select Fingerprint 1'); 
 
          
       [namefile,pathname]=uigetfile({'*.bmp;*.tif;*.tiff;*.jpg;*.jpeg;*.gif','IMAGE Files (*.bmp,*.tif,*.tiff,*.jpg,*.jpeg,*.gif)'});
            if namefile~=0
                 [img,map]=imread(strcat(pathname,namefile));
                % if isrgb(img)
                     img=rgb2gray(img);
               %  end
             end
   
%   disp('(Press any key to continue)');
%   pause;
           
         disp('Processing ...');
         Fp1.imOrig = img;
         disp('Segmentation');
         Fp1 = segmentimage(Fp1);
         disp('Orientation array');
         Fp1 = computeorientationarray(Fp1);
         disp('Finding the singularity point');
         Fp1 = findsingularitypoint(Fp1);
         disp('Local frequencies');
         Fp1 = computelocalfrequency(Fp1, Fp1.imOrig);
         disp('Filtering');
         Fp1 = enhance2ridgevalley(Fp1);
         disp('Skeleton cleaning');
         Fp1 = cleanskeleton(Fp1);
         disp('Finding minutiae');
         Fp1 = findminutia(Fp1);
         
         [x1,y1]= find(Fp1.minutiaArray==1);
         [x2,y2]= find(Fp1.minutiaArray==2);

      disp('See the original and the processed fingerprint 1');  
   %   pause;
%       figure(1)
%          subplot(1,2,1), imagesc(Fp1.imOrig),colormap gray, title('Fingerprint 1') 
%          subplot(1,2,2),
%          hold on, imagesc(Fp1.imOrig),colormap gray, title('Minutiae')
%          plot(y1,x1,'or','markersize',8)
%          plot(y2,x2,'sb','markersize',8), axis ij
%          legend('End of Ridge', 'Bifurcation')
%          hold off
     
       
         disp('(Press any key to continue)');
%    pause;
   
    %----------------------------------------------------------------------
    %-------- Select fingerprint 2
    %----------------------------------------------------------------------
  disp('Select Fingerprint 2'); 

               [namefile,pathname]=uigetfile({'*.bmp;*.tif;*.tiff;*.jpg;*.jpeg;*.gif','IMAGE Files (*.bmp,*.tif,*.tiff,*.jpg,*.jpeg,*.gif)'});
             if namefile~=0
                 [img,map]=imread(strcat(pathname,namefile));
                 %if isrgb(img)
                     img=rgb2gray(img);
                % end
             end
         
             disp('Processing ...');
         Fp2.imOrig = img;
         disp('Segmentation');
         Fp2 = segmentimage(Fp2);
         disp('Orientation array');
         Fp2 = computeorientationarray(Fp2);
         disp('Finding the singularity point');
         Fp2 = findsingularitypoint(Fp2);
         disp('Local frequencies');
         Fp2 = computelocalfrequency(Fp2, Fp2.imOrig);
         disp('Filtering');
         Fp2 = enhance2ridgevalley(Fp2);
         disp('Skeleton cleaning');
         Fp2 = cleanskeleton(Fp2);
         disp('Finding minutiae');
         Fp2 = findminutia(Fp2);
         
         [x1,y1]= find(Fp2.minutiaArray==1);
         [x2,y2]= find(Fp2.minutiaArray==2);
  
         disp('See the original and the processed fingerprint 2');  
 
%       
%          figure(2)
%          subplot(1,2,1), imagesc(Fp2.imOrig),colormap gray, title('Fingerprint 2') 
%          subplot(1,2,2),
%          hold on, imagesc(Fp2.imOrig),colormap gray, title('Minutiae')
%          plot(y1,x1,'or','markersize',8)
%          plot(y2,x2,'sb','markersize',8), axis ij
%          legend('End of Ridge', 'Bifurcation')
%          hold off
        
   disp('(Press any key to continue)');
%    pause;
    
    %----------------------------------------------------------------------
    %---- Fingerprint comparison using two methods: Gabor and local matching
    %
    %----------------------------------------------------------------------
       
        disp('Compute matching score using Gabor features')

        disp('Drawing eight filters (eight different angles for orientation)');
        disp('... and drawing the feature difference');
        Score1=MatchGaborFeat(Fp1,Fp2);
        fprintf('Score 1 using Gabor features: %1.2g\n', Score1);
        disp('(Press any key to continue)');
%    pause;
       
   disp('Compute matching score using minutiae and skeleton feature matching')
        user_entry2=input('Enter the threshold (for example, 5, 6,..., 12): ');
    threshold2=user_entry2;  

       Fp2=align2(Fp1,Fp2);
       Score2=match(Fp1.minutiaArray,Fp2.minutiaArrayAlign, Fp1.imSkeleton, Fp2.imSkeletonAlign,threshold2);
       fprintf('Score 2 for minutiae : %1.2g\n', Score2);
%disp('(Press any key to continue)');
 %  pause;
