%% ENEL  - Lab 3----------------
%
% Author:   Kyle Derby MacInnis
% UCID:     10053959
% Date:     October 27, 2014
%-------------------------------

%% LABORATORY PROCEDURE
clear all;

%% Step 1 - Setup System Variables
% Operating Frequency - fc = 900 MHz
fc = 900 * 10^6;
% Sample Interval - Ts = 1 msec
Ts = 1 * 10^(-3);
% Vehicle Speed - v = 90Km/hr (25 m/s)
v = 90 * (1000/3600);
% Variance of Gaussian Variables X and Y
sigma2 = 1.0;
% Speed of Light
c = 3.0 * 10^8;


%% Step 2 - Calculate Normalized Doppler Frequency
% Maximum Dopple Frequency - fd_max
fd_max = v*fc/c;
% Calculate Normalized Doppler Frequency - fd_norm
fd_norm = fd_max * Ts;

%% Step 3 - Calculate # of points, where Shaping Filter = 0
% Assume # of Points in Time Domain, M = 1000
M = 1000;
% Vector Index - m
m = 1:M;
% Find # of point, k_m
k_m = floor(fd_norm*M);

%% Step 4 - Calculate Sampling Interval in Frequency
% Sampling Frequency - delta_f
delta_f = 1/(M*Ts);

%% For Step 5-12: Loop K Times
K = 50;
% Generate Average Power Vector
P_av = zeros(K,1);
% Generate Outage Counter Vector
N_out = zeros(K,1);
% Generate Outage Probability Vector
P_out = zeros(K,1);

% Loop K Iterations
for k=1:K

%% Step 5 - Generate 2 Vectors X and Y
% Random Variable X
X = sqrt(sigma2)*randn(1, M);
% Random Variable Y
Y = sqrt(sigma2)*randn(1, M);

%% Step 6 - Generate the Magnitude Response of Shaping Filter
% Define Empty Vector for Values
Fm = zeros(M,1);
% Generate Filter
for i=1:M
    Fm(i,1) = F(i, k_m, fd_max, Ts, M);
end

%% Step 7 - Calculate the Output of the Shaping Filter
% Generate Empty Vector
filt_out = zeros(M,1);
% Calculate Output
for i=1:M
    filt_out(i,1) = X(1,i)*F(i, k_m, fd_max, Ts, M) - j*Y(1,i)*F(i, k_m, fd_max, Ts, M);
end

%% Step 8 - Take Inverse Discrete Fourier Transform of Output
% Calculate IDFT of filt_out
inv_filt_out = ifft(filt_out, M);


%% Step 9 - Multiply IDFT by Scaling Factor
% Initialize sigma2_2 to 0
sigma2_2 = 0;
% Calculate sigma2_2
for i = 1:M
    sigma2_2 = sigma2_2 + (Fm(i,1)/M)^2;
end
sigma2_2 = sigma2 * sigma2_2;
% Scaling Factor - SF
SF = 1/(sigma2_2*sqrt(2));
% Multiply Output by Scaling Factor
scaled_inv_filt_out = SF * inv_filt_out;
% Take Quadrature and In-Phase Components of Scaled Signal
Zt = real(scaled_inv_filt_out);
Zq = imag(scaled_inv_filt_out);
% Calculate Power of Zt and Zq
Pt = 0;
Pq = 0;
for i = 1:M
    Pt = Pt + Zt(i)^2;
    Pq = Pq + Zq(i)^2;
end

%% Step 10 - Calculate the Received Signal Envelope
% Create Empty Signal Envelope vector, R
R = zeros(M,1);
% Calculate the Envelope
for i=1:M
    R(i,1) = sqrt(Zt(i,1)^2 + Zq(i,1)^2);
end
% Plot the Received Signal Envelope
figure(3);
plot(m, R(:,1), 'r-');
title('Received Signal Envelope vs Time');
xlabel('Time: (msec)');
ylabel('Envelope');

%% Step 11 - Calculate the Average Power of the Received Signal
% Average Power, P_avk
P_av(k) = (Pt + Pq)/M;

%% Step 12 - Calculate Outage Probability
% Set Threshold to Average Power of Iteration
P_th = P_av(k);
% Calculate Number of Outages
for i = 1:M
    if ( (Zt(i)^2 + Zq(i)^2) < P_th )
        N_out(k) = N_out(k) + 1;
    end
end
% Calculate Outage Probability
P_out(k) = N_out(k)/M;

end

%% Step 13 - After Loop, Calculate Average Power over K iterations
% Initialize Total Average Power
Pav = 0;
% Calculate Total Average Power
for k = 1:K
    Pav = Pav + P_av(k);
end
Pav = Pav/K;

%% Step 14 - Calculate the Average Simulated Outage Probability
% Initialize Average Probability Outage
Pout = 0;
% Calculate Average Probability Outage
for k=1:K
    Pout = Pout + P_out(k);
end
Pout = Pout/K;

%% ADDITIONAL QUESTIONS

%% 1.1 - a) Plot Doppler Spectrum vs Frequency
% Calculate Frequency Change and Spectrum
fm = zeros(M,1);
F_m = zeros(M,1);
for m = 1:M
    fm(m,1) = m*delta_f;
    F_m(m,1) = F(fm(m,1), k_m, fd_max, Ts, M);
end
% Plot Magnitude Spectrum vs Frequency Fm
figure(1);
plot(fm, F_m, 'r-');
title('Doppler Magnitude Spectrum vs Frequency');
xlabel('Frequency: (Hz)');
ylabel('Magnitude Spectrum: F(m)');

%% 1.1 - b) Plot RMS Normalized Signal Envelope
% Calculate RMS Value of Signal Envelope
R_rms = 0;
for i=1:M
    R_rms = R_rms + R(i,1)^2;
end
R_rms = sqrt(R_rms/M);
% Calculate the RMS Normalized Signal Envelope in dB
R_rms_dB = zeros(M,1);
for i=1:M
    R_rms_dB(i,1) = 20*log10(R(i,1)/R_rms);
end
% Calculate Time, t_m
t_m = zeros(M,1);
for i = 1:M
    t_m(i,1) = i*Ts;
end
% Plot RMS Normalized Signal vs Time
figure(2);
plot(t_m, R_rms_dB, 'r-');
title('RMS Normalized Signal Envelope vs Time');
xlabel('Time: (msec)');
ylabel('Signal Envelope Magnitude: (dB)');

%% 1.2 - What is the Simulated Average Power, Pav?
% Display Average Power of Simulation
display('This Simulated Average Power after 50 Iterations is:');
display(Pav);

%% 1.3 - What is the Average Simulated Outage Probability, Pout?
% Display Average Outage Probability
display('The average simulated outage probability after 50 iterations is:');
display(Pout);

%% 1.4 - What is the Theoretical Outage Probability?
% Calculate Pout (Theoretical)
Pout_theory = 1 - exp(-(Pav)/(Pav));
% Display Theoretical Outage Probability
display('The theoretical outage probability is:');
display(Pout_theory);

%% 1.5 - Compare the Simulated and Theoretical
display('The difference between the Simulated and Theoretical Outage Probabilities are:');
display(Pout_theory-Pout);
display('The % differece between the two is:');
display((Pout_theory-Pout) * 100,'%');