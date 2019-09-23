% ENGG 407 - Assignment #6 - Solver and Plotter
%
% Author:   Kyle Derby MacInnis
%   UCID:   10053959
%   Date:   Dec 10, 2013


% Initialize Time Variable
t = linspace(0,50*10^-6);


%% Initialize Currents

% Initial Conditions
Io = zeros(2,1);


%% Solve ODE1

[T1, I1] = ode113(@ODE1, t, Io);


%% Plot ODE1 Figure

hold all;
figure(1);
xlabel('Time (s)');
ylabel('Current (A)');
title('Modelling of Currents Through a Transformer, (Sine)');
plot(T1,I1(:,1), '-c');
plot(T1,I1(:,2), '-g');


%% Solve ODE2

[T2, I2] = ode45(@ODE2, t, Io);

%% Plot ODE2 Figure
figure(2)
xlabel('Time (s)');
ylabel('Current (A)');
title('Modelling of Currents Through a Transformer (Sawtooth)');
plot(T2, I2(:,1), '-b');
plot(T2, I2(:,2), '-r');
%legend('Ip', 'Is');

