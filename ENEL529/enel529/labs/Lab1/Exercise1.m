% -------ENEL 529 Lab 1 - Exercise #1 --------
%=============================================
%  Professor: Dr. Fapojuwo
%    Authors: Kyle Derby MacInnis (10053959)
%       Date: October 6, 2014
%---------------------------------------------

%% Clear Variable Cache
clear all;


%% Variable Declarations:

MaxN = 100; %10000;                 % Maximum number of Samples

uX = 0;                             % Guassian mean of X

stdX = sqrt(2);                     % std deviation of X

Data = normrnd(uX, stdX, 1, MaxN);  % Gaussian RND Distribution

K = 10;                             % # of Intervals

simulated_pdf = zeros(2, K);        % simulated pdf Container

theoretical_pdf = zeros(2, K);      % theoretical pdf container

%% Distribution Analysis

uS = mean(Data);                % Calculate Mean of Distribution

stdS = std(Data);               % Calculate Std Deviation of Distribution

[m_j, C_j] = hist(Data, K);     % Split into 10 equal intervals

delta_J = C_j(2) - C_j(1);      % Calculate Length of Intervals

%% Simulate pdf(C_j)
for i = 1:K
    simulated_pdf(1,i) = C_j(i);
    simulated_pdf(2,i) = m_j(i)/(MaxN*delta_J);
end

%% Theoretical pdf(C_j)
for i = 1:K
    theoretical_pdf(1,i) = C_j(i);
    theoretical_pdf(2,i) = (1/sqrt(2*pi*(stdS^2)))*exp((-(C_j(i)-uS)^2)/(2*(stdS^2)));
end

%% Plot Distributions (Theoretical and Simulated)
figure(1);
plot(simulated_pdf(1,:), simulated_pdf(2,:), 'r--o', theoretical_pdf(1,:), theoretical_pdf(2,:), 'g--+');
title('Simulated vs. Theoretical PDF for Gaussian Distribution');
xlabel('Bin Centre - C_j');
ylabel('PDF(C_j)');
