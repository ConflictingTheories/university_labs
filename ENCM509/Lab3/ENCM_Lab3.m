% ENCM 509 Laboratory #3
%
%   Author: Kyle Derby MacInnis
%
%   Date: October 1, 2015

% Close all Figures
close all;

% Load Signature Arrays
sigAuth = load('sigAUTH.mat');
sigForg = load('sigFORG.mat');
% Convert to Arrays
auth = struct2array(sigAuth);
forg = struct2array(sigForg);

% Sample size
N_a = size(auth,2);
N_f = size(forg,2);

%% PART I - Calculate Average Pressure and Velocity

% Calculate Velocity and pressure Data
a = avgSigVel(auth, N_a);
f = avgSigVel(forg, N_f);

% Plot the data as gaussian clusters (Auth)
figure('name','Gaussian Cluster Plots - Part 1');
hold on;
mu_a = mean(a);
sigma_a = cov(a);
plotgaus(mu_a, sigma_a, [0 1 1]);
% (Forged)
mu_f = mean(f);
sigma_f = cov(f);
plotgaus(mu_f, sigma_f, [1 0 0]);
% Put Information
title('Joint Distributions of Velocity and Pressure for Signature Sets');
legend('Authentic','Auth-Mean','Forged','Forged-Mean');
hold off;

% Display Stats
disp('Authentic Data')
fprintf('## Authentic Mean:\n');
disp(mu_a);
fprintf('## Authentic Covariance:\n');
disp(sigma_a);
disp('Forged Data')
fprintf('## Forged Mean:\n');
disp(mu_f)
fprintf('## Forged Covariance:\n');
disp(sigma_f)

%% PART II - Gaussian Log Like Calculations
% Calculate Log Plots
N = N_a + N_f;
% Calculate Initial Priori Probabilities
P_a = N_a/N;
P_f = N_f/N;

% Calculate Loglike Values
loglikeAuth_a = calcLogLike(a,N_a,P_a,mu_a,sigma_a);    % Auth to Auth
loglikeAuth_f = calcLogLike(f,N_f,P_a,mu_a,sigma_a);    % Forg to Auth
loglikeForg_a = calcLogLike(a,N_a,P_f,mu_f,sigma_f);    % Auth to Forg
loglikeForg_f = calcLogLike(f,N_f,P_f,mu_f,sigma_f);    % Forg to Forg

% Plot Gaussian Plots
gausplot(a,mu_a,sigma_a,'Authentic');%,.5*min(a(:,1)):1.5*max(a(:,1)),.5*min(a(:,2)):1.5*max(a(:,2)))
gausplot(f,mu_f,sigma_f,'Forged');%,.5*min(f(:,1)):1.5*max(f(:,1)),.5*min(f(:,2)):1.5*max(f(:,2)))

% display stats
fprintf('Authentic Log-Like Values for Auth:\n');
disp(loglikeAuth_a);
fprintf('Forged Log-Like Values for Auth:\n');
disp(loglikeAuth_f);
fprintf('Authentic Log-Like Values for Forged:\n');
disp(loglikeForg_a);
fprintf('Forged Log-Like Values for Forged:\n');
disp(loglikeForg_f);

%% PART III - Unsupervised Training
% Create Data Set from pressure and velocity
dataSet = [a; f];
dataMeans = {mu_a, mu_f};
dataVars = {sigma_a, sigma_f};
% Use EM algorithm to define clusters (2 Clusters)
emalgo(dataSet, dataMeans, dataVars);