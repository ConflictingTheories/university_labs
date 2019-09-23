function Full_Lab1()
% function Full_Lab1()
%
%   Performs the Calculations for Lab 1
%
%   Authors:    Kyle MacInnis & Mebrhatom Anenya
%   Date:       September 16, 2015
%   Course:     ENCM 509
%

% Close all Windows
close all;

% Make Empty Arrays for velocity, Coords, and Pressure
xVelocity = zeros(1,10,'double');
yVelocity = zeros(1,10,'double');

% xPressure = zeros(1,10,'double');
% yPressure = zeros(1,10,'double');
%
% xCoords = zeros(1,10,'double');
% yCoords = zeros(1,10,'double');

% Load and fill Data from Signatures
for i = 1:5
    % Example Signatures
    %filename = strcat('sy',num2str(i),'.mat');
    
    % Real Signatures
    %filename = strcat('kSig',num2str(i),'.mat');
    %filename = strcat('msig',num2str(i),'.mat');
    
    %Forged Signatures
    filename = strcat('ksigf',num2str(i),'.mat');
    filename = strcat('msigf',num2str(i),'.mat');
    
    % load basic Signature Data
    [COORDi, TIMEi] = Lab1(filename,1);
    
    % Separate into X and Y data
    coordX = COORDi(:,1);
    coordY = COORDi(:,2);
    % Calculate Range of Data
    maxSize = max(size(COORDi,1))-1;
    % generate empty velocity vectors
    xVel = zeros(1,maxSize,'double');
    yVel = zeros(1,maxSize, 'double');
    % loop through data
    for j = 1:maxSize
        xDiff = abs(coordX(j+1) - coordX(j));
        yDiff = abs(coordY(j+1) - coordY(j));
        timeElapsed = double(TIMEi(j+1) - TIMEi(j));
        % Calculate Directional Velocities
        xVel(j) = (xDiff/timeElapsed)+1;
        yVel(j) = (yDiff/timeElapsed)+1;
    end
    
    % Calculate the average
    xVelAvg = 0;
    yVelAvg = 0;
    for j = 1:maxSize
        xVelAvg = xVelAvg + xVel(j);
        yVelAvg = yVelAvg + yVel(j);
    end
    xVelocity(i) = xVelAvg/maxSize;
    yVelocity(i) = yVelAvg/maxSize;
end
% Scale up Velocities
xVelocity = xVelocity * 10;
yVelocity = yVelocity * 10;

%% Perform Statistical Analysis on Data
% X- Direction
RangeX = min(xVelocity)-2:0.1:max(xVelocity)+2;
MeanX = mean(xVelocity);
StdX = std2(xVelocity);
ProbX = normpdf(RangeX,MeanX,StdX);
% Y-Direction
RangeY = min(yVelocity)-2:0.1:max(yVelocity)+2;
MeanY = mean(yVelocity);
StdY = std2(yVelocity);
ProbY = normpdf(RangeY,MeanY,StdY);

% plot Statistical Distribution
figure('name','X-Direction Normal Distribution');
plot(RangeX,ProbX);
xlabel('Velocity');
ylabel('Probability');
tname = strcat('Signature','- X-Vel Distribution');
title(tname);

figure('name','Y-Direction Normal Distribution');
plot(RangeY,ProbY);
xlabel('Velocity - Y')
ylabel('Probability');
tname = strcat('Signature','- Y-Vel Distribution');
title(tname);
