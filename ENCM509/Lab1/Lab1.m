function [COORD, TIME] = Lab1(sigFile,n)
%% Lab 1 - Loads and Performs Analysis of Signatures
%
%   Authors:    Kyle MacInnis & Mebrhatom Aneya
%   Date:       September 16, 2015
%   Course:     ENCM 509
%
%
%   sigFile - filename (.mat file)
%   n - Display Figures or Not (For Full Lab File Run) (0 for figures)
%

% Close Figures
close all;

% Load in Signature Data
Sig1 = load(sigFile);
coord1 = double(Sig1.coord);
time1 = double(Sig1.time);
prs1 = double(Sig1.prs);

% return Time
TIME = time1;

% Reverse Direction of the Y Position (From Bottom Left)
coord1(:,2) = max(coord1(:,2)) - coord1(:,2);

% return Coordinates
COORD = coord1;

%% Plot 2D Signature Pressure
if n == 0
    figure('name','Signature - 1');
    pressureMap = colormap(jet(max(prs1)));
    % Connect Lines between each point
    for i = 1:(size(prs1,1)-1)
        
        if(prs1(i+1) == 0)
            prsMap = pressureMap(1,:);
        else
            prsMap = pressureMap(prs1(i+1),:);
        end
        line([coord1(i,1) coord1(i+1,1)], [coord1(i,2) coord1(i+1,2)], 'color', prsMap, 'linewidth', 2);
    end
    xlabel('X');
    ylabel('Y');
    title('Pen Pressure');
end

%% velocity Calculations
% Create Empty Vector
vel = zeros(size(time1,1)-1, 1);
for i = 1:size(time1,1)-1
    % Find Euclidean Distance
    distance = sqrt((coord1(i+1,1)-coord1(i,1))^2 + (coord1(i+1,2)-coord1(i,2))^2);
    vel(i) = distance/(time1(i+1) - time1(i));
    vel(i) = int32((vel(i)*1000)+1);
end
vel = [1; vel];

%% Plot Velocity Map in 2D
if n == 0
    velmap = colormap(jet(max(vel)));    
    figure('name', 'Velocity Map');
    for i = 1:size(coord1,1)-1
        vMap = velmap(vel(i+1),:);
        line([coord1(i,1) coord1(i+1,1)], [coord1(i,2) coord1(i+1,2)], 'color', vMap, 'linewidth', 2);
    end
    xlabel('X');
    ylabel('Y');
    title('Velocity');
end

%% Plot Pressure in 3D
if n == 0
    figure('name', '3D Pressure');
    plot3(coord1(:,1), coord1(:,2),prs1, 'color', prsMap);
    xlabel('X');
    ylabel('Y');
    zlabel('Pressure');
    title('Pressure Map of Signature');
    grid on;
end