%function takes names of fingerprints (Fn1,Fn2) and the parameter (disp)
%and returns the matching score. (disp=1) turns on graphs, (disp=0) turns
%off graphs. Example of use: [Score]=MatchGaborFeat('1_1','1_2',1);

%%% modified by S. Yanushkevich, February 2, 2009

function [Score]=MatchGaborFeat(Fn1,Fn2)
%%%function [Score]=MatchGaborFeat(Fn1,Fn2,disp)

I1=Fn1.imOrig;
I2=Fn2.imOrig;

%%%I1=I1(39:size(I1,1)-39,39:size(I1,2)-39);%crop out part of the core area
%%%I2=I2(39:size(I2,1)-39,39:size(I2,2)-39);%crop out part of the core area

ss=48; %%% sizing a part of the image; you can choose other size here
I1=I1(ss:size(I1,1)-ss,ss:size(I1,2)-ss);%crop out part of the core area
I2=I2(ss:size(I2,1)-ss,ss:size(I2,2)-ss);%crop out part of the core area
 
%display both compared fingerprint fragments
%%%if disp==1
figure, subplot(1,2,1),imagesc(I1),colormap gray
title('Fp1')
subplot(1,2,2), imagesc(I2)
title('Fp2')
%%%end

norient=8;  %define the parameters for the gabor filters
xsize=32;   %filter size: x
ysize=32;   %filter size: y
dx=8;       %standard deviation of the gaussian envelope: x
dy=4;       %standard deviation of the gaussian envelope: y
fq=0.11;    %frequency

angle=[0:pi/8:pi-pi/8];
n=1;

%define the features - absolute deviation from the mean
%%% aad = @(x) abs(mean2(x)-std2(x)); 
aad=inline('abs(mean2(x)-std2(x))');  %%%inline(expression) 
%%%constructs an inline function object from the expression.  x is a default argument 

%filtering and feature extraction
   figure, hold on
for a=angle
    %build the filter
    f{n}=GaborFilter(32,32,8, 4, a, 0.11);

    If1(n,:,:)=imfilter(I1,f{n});%filter I1
    If2(n,:,:)=imfilter(I2,f{n});%filter I2
    %extract features
    F1(n,:,:) = blkproc(squeeze(If1(n,:,:)),[16 16],aad);
    F2(n,:,:) = blkproc(squeeze(If2(n,:,:)),[16 16],aad);
%%% blkproc apply the function aad to each 16x16 block of squeeze(If1(n,:,:))
    
    %show Gabor filters+features
 %%%   if disp==1
    subplot(3,norient,n),imagesc(f{n}), colormap gray
    subplot(3,norient,n+norient),imagesc(squeeze(F1(n,:,:))), colormap gray
    subplot(3,norient,n+2*norient),imagesc(squeeze(F2(n,:,:))), colormap gray
    %%%  end
    n=n+1;
end
hold off

%reshape features into a vector (eg. to classify using any 
%classifier that operates on fixed-length feature vectors)
F1=reshape(F1,prod(size(F1)),1);
F2=reshape(F2,prod(size(F2)),1);

%compute score as the mean of the Euclidian distance between 2 feature vectors
D=abs(F1-F2);
Score=mean(D);

%%% fprintf('Score for minutiae : %1.2g\n', Score);

%display the differences in feature vectors
%%%if disp==1
%%%figure, plot(F1,'r'), hold on
%%%plot(F2,'b'), plot(D,'g'), hold off
%%%title('Feature differences: F1 is read, F2 is blue, difference is green')
%%%xlabel(['Matching Score (mean of differences): ',num2str(Score)])
%%%end

        