% -------ENEL 529 Lab 1 - Exercise #2 --------
%=============================================
%  Professor: Dr. Fapojuwo
%    Authors: Kyle Derby MacInnis (10053959)
%       Date: October 6, 2014
%---------------------------------------------

%% Clear All Variables
clear all;

%% Variable Declarations:

MaxN2 = 10000;                          % Maximum number of Samples

uX2 = 0;                                % Guassian mean of X

stdX2 = sqrt(2);                        % std deviation of X

Data2 = normrnd(uX2, stdX2, 1, MaxN2);  % Gaussian RND Distribution

K2 = 10;                                % # of Intervals

L_j2 = zeros(1, K2);                    % Lower Bound of Intervals

U_j2 = zeros(1, K2);                    % Upper Bound of Intervals

p_j2 = zeros(1, K2);                    % Probability of Intervals

T_j2 = zeros(1, K2);                    % # of Samples in Intervals

%% Distribution Analysis

Z1 = 0;                     % Initialize (Chi-Square) Z1 to 0

Zt = 14.07;                 % Threshold Chi-Square Value from Tables

uS2 = mean(Data2);          % Calculate Mean of Distribution

stdS2 = std(Data2);         % Calculate Std Deviation of Distribution

[m_j2, C_j2] = hist(Data2, K2);     % Split into 10 equal intervals

delta_j2 = C_j2(2) - C_j2(1);       % Calculate Length of Intervals

%% Calculate Lower and Upper Bounds
for i=1:K2
    L_j2(1,i) = C_j2(1,i) - (delta_j2/2);     % Calculate Lower Bound
    U_j2(1,i) = C_j2(1,i) + (delta_j2/2);     % Calculate Upper Bound
end

%% Calculate Probability and # of Samples
for i=1:K2
    p_j2(1,i) = qfunc((L_j2(1,i)-uS2)/stdS2)-qfunc((U_j2(1,i)-uS2)/stdS2);
    T_j2(1,i) = MaxN2*p_j2(1,i);
end

%% Calculate Chi-Square Value
for i=1:K2
    Z1 = Z1 + ((m_j2(1,i) - T_j2(1,i))^2/T_j2(1,i));
end

if Z1 < Zt
   display(Z1);
   display(Zt); 
   display('The Test Passed and the Distribution is Gaussian!');
else
   display(Z1);
   display(Zt);
    display('The Test did not pass, the distribution is not Gaussian.');
end

