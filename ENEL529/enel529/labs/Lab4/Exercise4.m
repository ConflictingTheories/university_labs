%% ---_ ENEL 529 - Lab 4 - Case 1 ---- %%
%
% Author:   Kyle Derby MacInnis
% Date:     November 3, 2014
%
% ----------------------------------- %

% Clear all System Variables
clear all;

%% Step 0 - Preambles
% # of bits
M = 1000;
% Setup Empty Bit Stream Vector
b = zeros(1,M);
% Setup Bit Rate Period (0.125 ms)
Tb = 0.125 * 10^(-3);
% Setup the Carrier Frequency (10 KHz)
fc = 10*10^(3);
% Setup # of samples in one bit interval
N = 15;
% Calculate the Sample Time
dt = Tb/N;

%% Step 1 - Generate Random Bit Stream
% Setup Random Binary Data Stream (0's and 1's)
binary_data = rand(1,M) > 0.5;
% Convert to Data Stream (-1's and 1's)
b = 2.*binary_data - 1;

%% Step 2 - Generate the BPSK Transmitted Waveform (Rayleigh)
% Setup empty Signal Vector
s_i = zeros(1, M*N);
% Setup Energy of Symbol
E = Tb/2;
% Loop through Time Index, n (1-15000)
for i = 1:M
    for j = 1:N
        % Calculate Time Index, n
        n = i*N - (N-j);
        % Calculate the BPSK Signal at Time index n with Uniform Random Phase Shift
        s_i(1, n) = b(1, i) * sqrt((2*E)/Tb)*cos(2*pi*fc*n*dt + random('uniform', 0, 2*pi));
    end
end

%% Step 3 - Generate the Received Signal Waveform (Rayleigh)
% Create empty Signal Vector
r = zeros(1, M*N);
% Loop through Time Index, n
for i = 1:M
    for j = 1:N
        % Calculate the Time Index, n
        n = i*N - (N-j);
        % Calculate the Received Signal at Time, n
        r(1,n) = raylrnd(1)*s_i(1, n) + normrnd(0, sqrt(5.0));
    end
end

%% Step 4 - Normalize the Received Signal Vector
% Generate Empty Vector
r_n = zeros(1, M*N);
% Calculate the Max of the Received Signal
r_max = max(abs(r));
% Normalize Vector
for i=1:M*N
    r_n(1,i) = r(1,i)/r_max;
end

% Plot Normalized Received Signal
t = dt*(1:M*N);
figure(1);
plot(t, r_n(1,:), 'r-');
xlabel('Time: (sec)');
ylabel('Received Signal Envelope');
title('Normalized Received Signal Envelope vs. Time');

%% ## CASE 4 - RAYLEIGH IMPERFECT COHERENT DETECTOR (RANDOM ERR)

%% Step 5 - Perform Coherent Demodulation of the Normalized Waveform
% Generate Empty Vector for Demodulated Signal
x = zeros(1, M*N);
% Loop through Time Indices, n
for i = 1:M
    for j = 1:N
        % Calculate the time Index, n
        n = i*N - (N-j);
        % Demodulate the Signal
        x(1, n) = r_n(1, n)*(2*cos(2*pi*fc*n*dt));
    end
end


%% Step 6 - Perform Low-pass Filtering
% Generate Butterworth Filter Parameters
[bb, aa] = butter(10, 0.2);
% Filter Signal with Butterworth Filter
filter_output = filtfilt(bb, aa, x);

%% Step 7 - Perform Signal Detection
% Generate Empty Signal Vector
recovered_data = zeros(1,M);
% Loop Through Symbols
for i = 1:M
    % Calculate Middle Time Index of Symbol
    k = ceil(N/2 + (i-1)*N);
    % Recover Bit Data from Signal
    if filter_output(k) > 0
        recovered_data(1,i) = 1;
    else
        recovered_data(1,i) = -1;
    end
end

%% Step 8 - Compare the Transmitted Signal with the Recovered Signal
% Initialize # of Errors to zero
BE = 0;
% Loop and Compare Bit-by-Bit
for i = 1:M
    if recovered_data(1,i) ~= b(1,i)
        BE = BE + 1;
    end
end
% Calculate the Bit Error Rate
BER = BE/M;
display('For Rayleigh Faded Channel with AWGN Noise Variance of 0.01:');
display(BER);

%% Step 9 - Repeat Steps 3-8 For Different Values of AWGN Noise Variance
% For Variance of 0.25 (0.5 std. dev)

% For Variance of 1.0 (1.0 std. dev)

% For Variance of 5.0 (sqrt(5.0) std. dev)