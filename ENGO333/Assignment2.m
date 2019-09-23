% ENGO 333 - Assignment 2
% George Barnhardt
% 10139132
% December 7, 2014

% Clear Variables
clear all;

% Load in Vectors of Points
Points = importdata('DEM.txt');

% # of points
M = length(Points);

% TASK 1 - Plot all Points
figure(1);
hold on;
zlabel ('Height'); 
ylabel ('Y coordinates'); 
xlabel ('X coordinates'); 
title ('Figure 2: Task A - Plot point dots of DEM');
PointGraph = scatter3(Points(:,1), Points(:,2), Points(:,3), 'b.');

% TASK 2 - Find Points between 1600 - 1700 meters
Slice_Count = 0;
for i=1:M
    if ((Points(i,3) > 1600) && (Points(i,3) < 1700))
        Slice_Count = Slice_Count + 1;
    end
end
Elev_Slice = zeros(Slice_Count,3);
Slice_Index = 1;
for i=1:M
    if ((Points(i,3) > 1600) && (Points(i,3) < 1700))
        Elev_Slice(Slice_Index,:) = Points(i,:);
        Slice_Index = Slice_Index + 1;
    end
end

% TASK 3 - Plot Slice in Different Colour Over Graph
scatter3(Elev_Slice(:,1), Elev_Slice(:,2), Elev_Slice(:,3),'r.');
hold off;

% TASK 4 - Calculate the Delauney Triangulation
del_tri = delaunay(Points(:,1), Points(:,2));

% TASK 5 - Plot Delauney Surface in new Figure
figure(3);
zlabel ('Height'); 
ylabel ('Y coordinates'); 
xlabel ('X coordinates'); 
title ('Figure 3: Task D and E - Delaunay Surface Plot');
trisurf(del_tri, Points(:,1), Points(:,2), Points(:,3));
 
% TASK 6 - Calculate the Mean Point of each Triangle's Vertices
N = length(del_tri);
Mean_Point = zeros(N,3);
for i=1:N
   p1 = del_tri(i,1);
   p2 = del_tri(i,2);
   p3 = del_tri(i,3);
   Mean_Point(i,1) = (Points(p1,1) + Points(p2,1) + Points(p3,1))/3;
   Mean_Point(i,2) = (Points(p1,2) + Points(p2,2) + Points(p3,2))/3;
   Mean_Point(i,3) = (Points(p1,3) + Points(p2,3) + Points(p3,3))/3;
end

% TASK 7 - Calculate the Slope of Each Triangle
tri_slope = zeros(N,1);
for i=1:N 
    p1 = del_tri(i,1);
    p2 = del_tri(i,2);
    p3 = del_tri(i,3);
    
    
    if (Points(p1,3) == max([Points(p1,3), Points(p2,3), Points(p3,3)]))
        if( Points(p2,1) > Points(p3,1))
            V1 = Points(p1, :) - Points(p3, :);
            V2 = Points(p1, :) - Points(p2, :);
        else
            V1 = Points(p1, :) - Points(p2, :);
            V2 = Points(p1, :) - Points(p3, :);
        end
    elseif (Points(p2,3) == max([Points(p1,3), Points(p2,3), Points(p3,3)]))
        if(Points(p1,1) > Points(p3,1))
            V1 = Points(p2, :) - Points(p3, :);
            V2 = Points(p2, :) - Points(p1, :);
        else
            V1 = Points(p2, :) - Points(p1,:);
            V2 = Points(p2, :) - Points(p3,:);
        end
    else
        if(Points(p2,1) > Points(p1,1))
            V1 = Points(p3, :) - Points(p1,:);
            V2 = Points(p3,:) - Points(p2, :);
        else
            V1 = Points(p3, :) - Points(p2, :);
            V2 = Points(p3, :) - Points(p1, :);
        end
    end
            
    
    Norm = cross(V1,V2);
    len_Norm = sqrt(Norm*(Norm.'));
    tri_slope(i) = 90 - asind(abs(dot(Norm, [0,0,1]))/len_Norm);
end

% TASK 8 - Plot Mean points w/ slope > 15 Degrees
h_meanCnt = 0;
for i=1:N
    if tri_slope(i) >= 15
        h_meanCnt = h_meanCnt + 1;
    end
end
h_meanPoints = zeros(h_meanCnt,3);
h_index = 1;
for i=1:N
    if tri_slope(i) >= 15
        h_meanPoints(h_index, :) = Mean_Point(i, :);
        h_index = h_index + 1;
    end
end
figure(4);
hold on;
zlabel ('Height'); 
ylabel ('Y coordinates'); 
xlabel ('X coordinates'); 
title ('Figure 5: Task F,G,H, and I - Plot of Different Triangle Slopes');
scatter3(h_meanPoints(:,1), h_meanPoints(:,2), h_meanPoints(:,3), 'r.');


% TASK 9 - Plot all mean points w/ slope < 15
l_meanCnt = N - h_meanCnt;
l_meanPoints = zeros(l_meanCnt,3);
l_index = 1;
for i=1:N
    if tri_slope(i) < 15
        l_meanPoints(l_index, :) = Mean_Point(i, :);
        l_index = l_index + 1;
    end
end

scatter3(l_meanPoints(:,1), l_meanPoints(:,2), l_meanPoints(:,3), 'g.');
hold off;
