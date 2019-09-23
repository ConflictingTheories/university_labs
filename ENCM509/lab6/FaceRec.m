
%=========================== Lab 8: Part II: recognition faces ===============%
%===========================  =================%
% created by S. Yanushkevich, March 24, 2010, modified November 1, 2013
% The original eigenface-based recognition algorithm is credited 
%to Santiago Serrano (Drexel University)

clear all
close all
clc

disp('-------------------------------------------------------------------');
disp(' Lab 6, ENCM509');
disp('Biometric Technologies Laboratory, UofC');
disp('Face recognition using eigenfaces and Euclidean distance ');
disp('-------------------------------------------------------------------');

% number of images in your training set.
M=12;  %M could be large (for example, 16: 8 of yours and 8 of a friend) 

% Standard deviation and mean:  
% can be any number that  is close to the std and mean of most of the images.
um=100;
ustd=80;

% read and show image
S=[]; % img matrix
figure(1);
%%% You can specify you directory here, please, change the string below:
path = '.\DATA\'
for i=1:M
str=strcat(path,int2str(i),'.jpg'); % concatenates two strings that form the name of the image
eval('img=imread(str);');
subplot(ceil(sqrt(M)),ceil(sqrt(M)),i)
img=rgb2gray(img); %%% this version works with gray, not rgb images
imshow(img)
if i==3
title('Training set','fontsize',18)
end
drawnow;
[irow icol]=size(img); % get the number of rows (N1) and columns (N2)
temp=reshape(img',irow*icol,1); % creates a (N1*N2)x1 vector
S=[S temp]; % S is a N1*N2xM matrix after finishing the sequence
end


% Here we change the mean and std of all images. We normalize all images.
% This is done to reduce the error due to lighting conditions and background.
for i=1:size(S,2)
temp=double(S(:,i));
m=mean(temp);
st=std(temp);
S(:,i)=(temp-m)*ustd/st+um;
end

% show normalized images
figure(2);
for i=1:M
str=strcat(int2str(i),'.jpg');
img=reshape(S(:,i),icol,irow);
img=img';
eval('imwrite(img,str)'); 
subplot(ceil(sqrt(M)),ceil(sqrt(M)),i)
imshow(img)
drawnow;
if i==3
title('Normalized Training Set','fontsize',14)
end
end


% mean image
m=mean(S,2); % calculates the mean of each row instead of each column
tmimg=uint8(m); % converts to unsigned 8-bit integer. Values range from 0 to 255
img=reshape(tmimg,icol,irow); % takes the N1*N2x1 vector and creates a N1xN2 matrix
img=img'; 
figure(3);
imshow(img);
title('Mean Image','fontsize',18)

% Change image for manipulation
dbx=[]; % A matrix
for i=1:M
temp=double(S(:,i));
dbx=[dbx temp];
end

%Creating covariance matrix  L
A=dbx';
L=A*A';
% vv is the eigenvector for L
% dd is the eigenvalue for  L=dbx'*dbx;
[vv dd]=eig(L);
% Sort and eliminate ones with zero eigenvalue
v=[];
d=[];
for i=1:size(vv,2)
if(dd(i,i)>1e-4)
v=[v vv(:,i)];
d=[d dd(i,i)];
end
end

%sort d in ascending order
[B index]=sort(d);
ind=zeros(size(index));
dtemp=zeros(size(index));
vtemp=zeros(size(v));
len=length(index);
for i=1:len
dtemp(i)=B(len+1-i);
ind(i)=len+1-index(i);
vtemp(:,ind(i))=v(:,i);
end
d=dtemp;
v=vtemp;


%Normalization of eigenvectors
for i=1:size(v,2) %access each column
kk=v(:,i);
temp=sqrt(sum(kk.^2));
v(:,i)=v(:,i)./temp;
end

%Eigenvectors of C matrix
u=[];
for i=1:size(v,2)
temp=sqrt(d(i));
u=[u (dbx*v(:,i))./temp];
end

%Normalization of eigenvectors
for i=1:size(u,2)
kk=u(:,i);
temp=sqrt(sum(kk.^2));
u(:,i)=u(:,i)./temp;
end


% show eigenfaces
figure(4);
for i=1:size(u,2)
img=reshape(u(:,i),icol,irow);
img=img';
img=histeq(img,255);
subplot(ceil(sqrt(M)),ceil(sqrt(M)),i)
imshow(img)
drawnow;
if i==3
title('Eigenfaces','fontsize',18)
end
end


% Find the weight of each face in the training set
omega = [];
for h=1:size(dbx,2)
WW=[]; 
for i=1:size(u,2)
t = u(:,i)'; 
WeightOfImage = dot(t,dbx(:,h)');
WW = [WW; WeightOfImage];
end
omega = [omega WW];
end


% Acquire new image
% Note: the input image must have a bmp or jpg extension. 
% It should have the same size as the ones in your training set. 
InputImage = input('Please enter the name of the image and its extension \n','s');
% It should be placed in your directory (change line below) 
InputImage = imread(strcat(path,InputImage));
InputImage=rgb2gray(InputImage); %%%
figure(5)
subplot(1,2,1)
imshow(InputImage); colormap('gray');title('Input image','fontsize',18)
InImage=reshape(double(InputImage)',irow*icol,1); 
%Normalization
temp=InImage;
me=mean(temp);
st=std(temp);
temp=(temp-me)*ustd/st+um;
NormImage = temp;
%Finding difference
Difference = temp-m;

p = [];
aa=size(u,2);
for i = 1:aa
pare = dot(NormImage,u(:,i)); %dot returns scalar vector product
p = [p; pare];
end
ReshapedImage = m + u(:,1:aa)*p; %m is the mean image, u is the eigenvector
ReshapedImage = reshape(ReshapedImage,icol,irow);
ReshapedImage = ReshapedImage';
%show the reconstructed image.
subplot(1,2,2)
imagesc(ReshapedImage); colormap('gray');
title('Reconstructed image','fontsize',14)

InImWeight = [];
for i=1:size(u,2)
t = u(:,i)';
WeightOfInputImage = dot(t,Difference'); %scalar vector product of vectors t and Difference
InImWeight = [InImWeight; WeightOfInputImage];
end

% Find Euclidean distance
e=[];
for i=1:size(omega,2)
q = omega(:,i);
DiffWeight = InImWeight-q;
mag = norm(DiffWeight);
e = [e mag];
end

kk = 1:size(e,2);
subplot(1,2,2)
stem(kk,e)
title('Eucledian distance of input image','fontsize',14)

MaximumValue=max(e) % maximum eucledian distance
MinimumValue=min(e) % minimum eucledian distance

%%%Change and uncomment the fragment below using your Threshold values to classify the face as Match, non-Match, or Not-a-face

% Set Threshold Values 
%threshold1 = 5.293e+004;
%threshold2 = 8.629e+004;

%mean_of_distances = mean(e);
%if (mean_of_distances <= threshold1)
%    disp('Image is in the database');
%elseif (mean_of_distances > threshold1 && mean_of_distances <= threshold2)
%    disp('Image is a face but not in the database');
%elseif (mean_of_distances > threshold2)
%    disp('Image is not a face');
%end
%%%