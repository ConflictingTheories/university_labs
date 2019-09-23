%% COMS 363 - Final Report Results Metric Calculator

% Clear Everything
clear all;

% # of Participants
N = 14;

% # of Questions
M = 16;

% Weighting Vector
W = [0; 0.25; 0.50; 0.75; 1];

% Answer Matrix
        % Question 2 Breakdown
A =  [  [1, 1, 1, 6, 5],
        [1, 5, 2, 3, 3],
        [0, 8, 0, 3, 3],
        [0, 3, 0, 8, 3],
        [2, 2, 0, 6, 4],
        [0, 1, 2, 8, 3],
        [0, 1, 3, 8, 2],
        [0, 1, 2, 8, 3],
        [3, 4, 0, 4, 3],
        [1, 2, 1, 5, 5],
        % Question 3 Breakdown
        [5, 4, 1, 3, 1],
        [5, 2, 3, 3, 1],
        [2, 3, 3, 4, 2],
        [1, 2, 6, 4, 1],
        [3, 7, 1, 2, 1],
        [5, 3, 3, 3, 0] ];
    
% Final Values
Score = (A*W)/N;
Score4 = 0.5;
Score5 = 0.5;
Score6 = 0.429;

% Display Metrics
for i=1:M
    if i <= 10
        Q = 2;
        X = i;
    else
        Q = 3;
        X = i -10;
    end
    
    display(sprintf('Question %d.%d: %.3f - %.1f%%', Q, X, Score(i), Score(i)*100));
        
end

%% Categorical Breakdown Stuff

% Design Questions (9)
Design_Q = [22; 29; 31; 32; 33; 34; 35; 36; 40];
% Identity Questions (7)
Identity_Q = [21; 26; 27; 28; 36; 40; 50];
% Accessibility Questions (8)
Access_Q = [22; 23; 25; 27; 33; 36; 40; 60];
% Navigation Questions (8)
Navi_Q = [23; 24; 25; 26; 27; 210; 50; 60];

%% Design Metrics Graph
% Create Empty Vectors
Design_BarGraph = zeros(length(Design_Q),1);
Design_BarGraphLabels = cell(length(Design_Q)+1, 1);
Design_BarGraphLabels(1) = '';

% Load Questions for Design
for i = 1:length(Design_Q)
    
    % Decode Question
    if Design_Q(i,1) == 210
        Q1 = 10;
        Q2 = 2;
    else
        Q1 = mod(Design_Q(i,1), 10);
        Q2 = (Design_Q(i,1) - Q1)/10;
    end
    
    % Find Score Index
    if Q2 == 2      % Question 2
        index = Q1;
        QScore = Score(index);
    elseif Q2 == 4  % Question 4
        QScore = Score4;
    elseif Q2 == 5  % Question 5
        QScore = Score5;
    elseif Q2 == 6  % Question 6
        QScore = Score6;
    else            % Question 3
        index = 10 + Q1;
        QScore = Score(index);
    end
        
    % Load in Question # and Score
    Design_BarGraphLabels(i+1) = cellstr(sprintf('Q%1.1f', (Q2 + Q1/10)));
    Design_BarGraph(i) = QScore;
end

% Plot Design Bar Graph
figure(1);
hold on;
bar(Design_BarGraph, 'FaceColor',[0.153 .451 .09],'EdgeColor',[0.341 .561 .263],'LineWidth',1.5);
set(gca, 'xticklabel', Design_BarGraphLabels);
title('Primary Research - Design Criteria');
ylabel('Survey Response (%)');
xlabel('Survey Question');
rline = refline(0,0.5);
rline.Color = [0.629, .067, .629];
rline.LineWidth = 1.5;
hold off;


%% Identity Metrics Graph
% Create Empty Vectors
Identity_BarGraph = zeros(length(Identity_Q),1);
Identity_BarGraphLabels = cell(length(Identity_Q)+1, 1);
Identity_BarGraphLabels(1) = '';

% Load Questions for Identity
for i = 1:length(Identity_Q)
    
    % Decode Question
    if Identity_Q(i,1) == 210
        Q1 = 10;
        Q2 = 2;
    else
        Q1 = mod(Identity_Q(i,1), 10);
        Q2 = (Identity_Q(i,1) - Q1)/10;
    end
    
    % Find Score Index
    if Q2 == 2      % Question 2
        index = Q1;
        QScore = Score(index);
    elseif Q2 == 4  % Question 4
        QScore = Score4;
    elseif Q2 == 5  % Question 5
        QScore = Score5;
    elseif Q2 == 6  % Question 6
        QScore = Score6;
    else            % Question 3
        index = 10 + Q1;
        QScore = Score(index);
    end
        
    % Load in Question # and Score
    Identity_BarGraphLabels(i+1) = cellstr(sprintf('Q%1.1f', (Q2 + Q1/10)));
    Identity_BarGraph(i) = QScore;
end

% Plot Design Bar Graph
figure(2);
hold on;
bar(Identity_BarGraph, 'FaceColor',[0.123 .42 .435],'EdgeColor',[0.246 .84 .87], 'LineWidth', 1.5);
set(gca, 'xticklabel', Identity_BarGraphLabels);
title('Primary Research - Identity Criteria');
ylabel('Survey Response (%)');
xlabel('Survey Question');
rline = refline(0,0.5);
rline.Color = [0.629, .067, .629];
rline.LineWidth = 1.5;
hold off;

%% Accessibility Metrics Graph
% Create Empty Vectors
Access_BarGraph = zeros(length(Access_Q),1);
Access_BarGraphLabels = cell(length(Access_Q)+1, 1);
Access_BarGraphLabels(1) = '';
% Load Questions for Access
for i = 1:length(Access_Q)
    
    % Decode Question
    if Access_Q(i,1) == 210
        Q1 = 10;
        Q2 = 2;
    else
        Q1 = mod(Access_Q(i,1), 10);
        Q2 = (Access_Q(i,1) - Q1)/10;
    end
    
    % Find Score Index
    if Q2 == 2      % Question 2
        index = Q1;
        QScore = Score(index);
    elseif Q2 == 4  % Question 4
        QScore = Score4;
    elseif Q2 == 5  % Question 5
        QScore = Score5;
    elseif Q2 == 6  % Question 6
        QScore = Score6;
    else            % Question 3
        index = 10 + Q1;
        QScore = Score(index);
    end
        
    % Load in Question # and Score
    Access_BarGraphLabels(i+1) = cellstr(sprintf('Q%1.1f', (Q2 + Q1/10)));
    Access_BarGraph(i) = QScore;
end
% Plot Access Bar Graph
figure(3);
hold on;
bar(Access_BarGraph, 'FaceColor',[0.153 .451 .09],'EdgeColor',[0.341 .561 .263], 'LineWidth', 1.5);
set(gca, 'xticklabel', Access_BarGraphLabels);
axis([0,length(Access_Q)+1, 0 1]);
title('Primary Research - Accessibility Criteria');
ylabel('Survey Response (%)');
xlabel('Survey Question');
rline = refline(0,0.5);
rline.Color = [0.629, .067, .629];
rline.LineWidth = 1.5;
hold off;

%% Navigation Metrics Graph
% Create Empty Vectors
Navi_BarGraph = zeros(length(Navi_Q),1);
Navi_BarGraphLabels = cell(length(Navi_Q)+1, 1);
Navi_BarGraphLabels(1) = '';
% Load Questions for Navigation
for i = 1:length(Navi_Q)
    
    % Decode Question
    if Navi_Q(i,1) == 210
        Q1 = 1;
        Q2 = 2;
    else
        Q1 = mod(Navi_Q(i,1), 10);
        Q2 = (Navi_Q(i,1) - Q1)/10;
    end
    
    % Find Score Index
    if Q2 == 2      % Question 2
        index = Q1;
        QScore = Score(index);
    elseif Q2 == 4  % Question 4
        QScore = Score4;
    elseif Q2 == 5  % Question 5
        QScore = Score5;
    elseif Q2 == 6  % Question 6
        QScore = Score6;
    else            % Question 3
        index = 10 + Q1;
        QScore = Score(index);
    end
        
    % Load in Question # and Score
    Navi_BarGraphLabels(i+1) = cellstr(sprintf('Q%1.1f', (Q2 + Q1/10)));
    Navi_BarGraph(i) = QScore;
end
% Plot Navigation Bar Graph
figure(4);
hold on;
bar(Navi_BarGraph, 'FaceColor',[0.153 .451 .09],'EdgeColor',[0.341 .561 .263], 'LineWidth', 1.5);
set(gca, 'xticklabel', Navi_BarGraphLabels);
axis([0,length(Navi_Q)+1, 0 1]);
title('Primary Research - Navigation Criteria');
ylabel('Survey Response (%)');
xlabel('Survey Question');
rline = refline(0,0.5);
rline.Color = [0.629, .067, .629];
rline.LineWidth = 1.5;
hold off;