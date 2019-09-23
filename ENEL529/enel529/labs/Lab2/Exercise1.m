%---------ENEL  - Lab 2-----------
%
% Author:   Kyle Derby MacInnis
% UCID:     10053959
% Date:     October 20, 2014
%
%---------------------------------

%% Clear Variable Data
clear all;

%% Import Measured Data into Time and Power
Data = importdata('series11.mat');

%% Plot Received Signal Data
figure(1);
plot(Data(:,1),Data(:,2), 'r-');
xlabel('Time: (sec)');
ylabel('Received Power: (dBm)');
title('Measured Signal Data');

%% What Type of Fading is Shown in Figure 1?
display('What type of Fading is Displayed in Figure 1?');
display('Answer: Rayliegh Fading');

%% Convert Power to Normalized Voltage Vector
% Get Length of Vector
M = length(Data);
% Create Empty Vector for Power
P = zeros(M,1);
% Create Empty Vector for Voltage and Normalized Voltage
V = zeros(M,1);
Vnorm = zeros(M,1);
% Extract Power and Convert to Watts
for i=1:M
    P(i,1) = 10^(Data(i,2)/10)/1000;
end
% Assume Resistance is 50 ohm
R = 50;
% Calculate Voltage from power
for i=1:M
    V(i,1) = sqrt(2*R*P(i,1));
end
% Calculate the Average Voltage
uV = mean(V);
% Estimate the Parameter Sigma of Rayleigh Signal Data
sigma_V = uV/sqrt(pi/2);
% Display Mean and Sigma Parameter
display(uV); display(sigma_V);

% Normalize The Voltage Vector
for i=1:M
    Vnorm(i,1) = V(i,1)/sigma_V;
end

%% Plot Normalized Voltage Vector
figure(2);
plot(Data(:,1),Vnorm(:,1),'r-');
xlabel('Time: (sec)');
ylabel('Normalized Voltage: (V)');
title('Normalized Voltage Values for received Signal');

%% Calculate Mean and Sigma of Normalized Vector
uVnorm = mean(Vnorm);
sigma_Vnorm = uVnorm/sqrt(pi/2);

% Display the Mean and Sigma Parameter
display(uVnorm); display(sigma_Vnorm);

%% Calculate Measured PDF of Normalized Voltage Vector
% Split into K disjoint intervals
K = 10;
[m_j, C_j] = hist(Vnorm,K);
% Calculate Delta, assuming equal lengths
delta_Vnorm = C_j(2)-C_j(1);
% Create Empty PDF
measured_pdf = zeros(K,1);
% Calculate Measured pdf
for i=1:K
    measured_pdf(i,1) = m_j(i)/(M*delta_Vnorm);
end

%% Calculate Theoretical PDF of Normalized Voltage Vector
% Create Empty PDF Container
theoretical_pdf = zeros(K,1);
% Calculate Theoretical PDF
for i=1:K
    theoretical_pdf(i,1) = (C_j(i)/(sigma_Vnorm^2))*exp(-(C_j(i)^2)/(2*sigma_Vnorm^2));
end

%% Comparative Test 1 - Visual Test
figure(3);
plot(C_j,measured_pdf,'r--o', C_j,theoretical_pdf, 'g--x');
title('Measured PDF vs Theoretical PDF for Normalized Voltage Signal Data');
xlabel('Centre of Bin, C_j');
ylabel('Normalized PDF, F_X(C_j)');


%% Comparative Test 2 - Quantitative Test
% Create Empty Vector for Probability and Expected # of Samples
p_j = zeros(K,1);
T_j = zeros(K,1);
% Create Empty Vectors for Upper and Lower Limits
U_j = zeros(K,1);
L_j = zeros(K,1);
% Calculate Upper and Lower Limits of Intervals
for i=1:K
    U_j(i) = C_j(i) + delta_Vnorm/2;
    L_j(i) = C_j(i) - delta_Vnorm/2;
end
% Calculate Probability and Expected # of Samples
for i=1:K
    p_j(i) = exp(-L_j(i)^2/(2*sigma_Vnorm^2)) - exp(-U_j(i)^2/(2*sigma_Vnorm^2));
    T_j(i) = M*p_j(i);
end
% Zt From Chi-Square Tables (K - r - 1) = 10 - 1 - 1 = 8 @ 1%
Zt = 20.09;
% Calculate The Chi-Square Statistic, Z1
Z1 = 0;
for i=1:K
    Z1 = Z1 + (m_j(i) - T_j(i))^2/(T_j(i));
end
if Z1 < Zt
    display(Z1);
    display(Zt);
    display('The Distribution is Rayleigh Distributed!');
else
    display(Z1);
    display(Zt);
    display('The Distribution is not Rayleigh Distributed.');
end

%% ADDITIONAL QUESTIONS

%% Task 1.1
% Calculate V_rms from Vector V
V_rms = (2/sqrt(pi))*uV;
display(V_rms);

%% Task 1.2
% Generate Empty Vector Vnormrms
Vnormrms = zeros(M,1);
% Normalize V by V_rms
for i=1:M
    Vnormrms(i,1) = V(i,1)/V_rms;
end

%% Task 1.3
% Generate Empty Vector Vnormrms_db
Vnormrms_db = zeros(M,1);
% Convert to dB
for i=1:M
    Vnormrms_db(i,1) = 20*log10(Vnormrms(i,1));
end
% Plot Vnormrms_db against Time
figure(4);
plot(Data(:,1),Vnormrms_db(:,1),'r--');
title('RMS Normalized Voltage (dB) vs Time');
xlabel('Time: (sec)');
ylabel('V_(normrms,dB): (dB)');

%%  Task 1.4
% Calculate the Mean and Variance
uVnormrms = mean(Vnormrms);
var_Vnormrms = var(Vnormrms);
display(uVnormrms); display(var_Vnormrms);
% Calculate the Ratio between Mean and Std Dev.
ratio_normrms = uVnormrms/sqrt(var_Vnormrms);
display(ratio_normrms);

%% Task 1.5
% Generate empty Vector V2normrms
V2normrms = zeros(M,1);
% Calculate V2normrms
for i=1:M
    V2normrms(i,1) = Vnormrms(i,1)^2;
end
% Calculate the Mean and Variance of V2normrms
uV2normrms = mean(V2normrms);
var_V2normrms = var(V2normrms);
% Display
display(uV2normrms); display(var_V2normrms);

%% Task 1.6
% Calculate the ratio between Mean and Variance of V2normrms
ratio_V2normrms = uV2normrms/sqrt(var_V2normrms);
% Display
display(ratio_V2normrms);

%% Task 1.7
[RMSm_j, RMSC_j] = hist(V2normrms,K);
% Calculate Delta, assuming equal lengths
delta_V2normrms = RMSC_j(2)-RMSC_j(1);
% Create Empty PDF
measured_pdf_rms = zeros(K,1);
% Calculate Measured pdf
for i=1:K
    measured_pdf_rms(i,1) = RMSm_j(i)/(M*delta_V2normrms);
end

%% Task 1.8
% Create Empty PDF Container
theoretical_pdf_rms = zeros(K,1);
% Calculate Theoretical PDF
for i=1:K
    theoretical_pdf_rms(i,1) = (1/(uV2normrms))*exp(-RMSC_j(i)/(uV2normrms));
end

%% Task 1.9
% Plot Theoretical and Measured PDFs
figure(5);
plot(RMSC_j,measured_pdf_rms,'r--o', RMSC_j, theoretical_pdf_rms, 'g--o');
title('Measured and Theoretical PDFs of Normalized RMS Voltage Square');
xlabel('Centre of Interval Bin_j, C_j');
ylabel('Probability Density Function, f(C_j)');
