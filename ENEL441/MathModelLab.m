

Km = 0.029088;      % Motor Constant
g = 9.81;           % Gravitational Constant (m/s^2)
m = 0.496;          % Mass of Car (kg)
M = 0.070;          % Mass of Weight (kg)
c = 0.055;          % Diameter of Wheels (m)
b = 0;              % Coefficient of Friction

U = (g * M)/Km;     % Commanded Base Speed (Constant portion)
p = 0;              % Commmanded Speed (Varying Portion)

u = U + p;          % u(t) in DE (Total Commanded Speed)

x = vint;           % Position
X = 0.30;           % Desired Position

v = 0;              % Velocity
a = dv;             % Acceleration


e = X - x;



