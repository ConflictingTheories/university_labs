% ENGG 407 - Assignment #1 (Matlab Code)
%
%
% Author: 			Kyle Derby MacInnis
% Student ID: 		10053959
% Date: 			October 15,2012
% Lecture Section: 	L01
%
% Notes:	
%
%
%

%%%%%%%%%%%%%%%%%%%%%%% Z^3 = 1 %%%%%%%%%%%%%%%%%%%%%%%
%
%

% Clear Variables from memory
	clear all;

% Select 1000000 Random Numbers
	X = random('Normal', -5, 5, [1,100000]);
	Y = random('Normal', -5, 5, [1,100000]);


% The following substitution is present:
%
% 		Z = (X + iY), i^2 = -1
%
% After Making the Substitution and expanding
% out the equation, the problem can be written
% as the following system of two non-linear
%  equations:

% System of Nonlinear Eqn's
F1 = @ (x,y) x^3 + 3*x*y^2 - 1;
F2 = @ (x,y) 3*y*x^2 - y^3;

% Partial Derivatives of F1
F1x = @ (x,y) 3*x^2 + 3*y^2;
F1y = @ (x,y) 6*x*y;

% Partial Derivatives of F2
F2x = @ (x,y) 6*x*y;
F2y = @ (x,y) 3*x^2 - 3*y^2;

% Jacobian Determinant Fuction
Jacobian = @ (x,y) (F1x(x,y)*F2y(x,y) - F2x(x,y)*F1y(x,y));

% Error Tolerance
Err = 0.001;

% Convergence Test
Converge = 0;

% Plot to figure
fig1 = figure(1);
hold all;

% Make 100000 Selections
for n = 1:100000
    
    % Get Initial Random Values for X and Y
    Xi = X(n);
    Yi = Y(n);

	% Set Orginal Point
	X0 = Xi;
	Y0 = Yi;
    
    % Do up to 10 interations of Newton's Method to Test for Convergence
    for m = 1:10
    
        % Calculate Jacobian Determinant
        Jac  = Jacobian(Xi, Yi);
        
        % Calculate delta X and Y
        Delx = (-F1(Xi,Yi)*F2y(Xi,Yi) + F2(Xi,Yi)*F1y(Xi,Yi))/Jac;
        Dely = (-F2(Xi,Yi)*F1x(Xi,Yi) + F1(Xi,Yi)*F2x(Xi,Yi))/Jac;
        
        % Calculate New Point
        Xp1 = Xi + Delx;
        Yp1 = Yi + Dely;
        
        % Calculate Error
        Errx = Delx/Xi;
        Erry = Dely/Yi;
        
		% Keep Values within (-5,-5) and (5,5)
        fprintf('\nn = %2.0f, X = %-7.4f, Y = %-7.4f, ErrX = %-7.4f, ErrY = %-7.4f', n+m, Xi, Yi, Errx, Erry);

        % If Error is <= 0.001 Algorithm Converges
        if(abs(Errx) <= Err && abs(Erry) <= Err)
			Converge = 1;
            break;

        % Else Otherwise Convergence not found, reiterate   
        else
			Converge = 0;
            Xi = Xp1;
            Yi = Yp1;
        end
        
    end

    if(abs(X0) <= 5) && (abs(Y0) <= 5)
        % If Point Converges Color Red, otherwise Color blue
        if(Converge == 1)
            set(plot(X0, Y0), 'Color', 'Red');
        else
            set(plot(X0, Y0), 'Color', 'Blue');
        end
    end
    
end

% Save Image File
saveas(fig1, 'Assignment1-Part1-10053959.jpeg');
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%% Z^5 = 1 %%%%%%%%%%%%%%%%%%%%%%
%
%
%
% Clear Variables from Memory
	clear all;

% Select 1000000 Random Numbers
	X = random('Uniform', -5, 5, [1,100000]);
	Y = random('Uniform', -5, 5, [1,100000]);

% The following substitution is present:
%
% 		Z = (X + iY), i^2 = -1
%
% After Making the Substitution and expanding
% out the equation, the problem can be written
% as the following system of two non-linear
%  equations:


% System of Nonlinear Eqn's
F1 = @ (x,y) (x^5 - 1 - 10*(x^3)*(y^2) + 5*x*(y^4));
F2 = @ (x,y) (5*y*(x^4) - 10*(x^2)*(y^3) + y^5);

% Partial Derivatives of F1
F1x = @ (x,y) 5*(x^4) - 30*(x^2)*(y^2) + 5*(y^4);
F1y = @ (x,y) -20*(x^3)*y + 20*x*(y^3);

% Partial Derivatives of F2
F2x = @ (x,y) 20*(x^3)*y - 20*x*(y^3);
F2y = @ (x,y) 5*(x^4) - 30*(x^2)*(y^2) + 5*(y^4);

% Jacobian Determinant Fuction
Jacobian = @ (x,y) F1x(x,y)*F2y(x,y) - F2x(x,y)*F1y(x,y);

% Error Tolerance
Err = 0.001;

% Plot to figure
fig2 = figure(2);
hold all;

% Make 100000 Selections
for n = 1:100000
    
    % Get Initial Random Values for X and Y
    Xi = X(n);
    Yi = Y(n);
    
	X0 = Xi;
	Y0 = Yi;

    % Do upto 10 interations of Newton's Method
    for m = 1:10
    
        % Calculate Jacobian Determinant
        Jac  = Jacobian(Xi, Yi);
        
        % Calculate delta X and Y
        Delx = (-F1(Xi,Yi)*F2y(Xi,Yi) + F2(Xi,Yi)*F1y(Xi,Yi))/Jac;
        Dely = (-F2(Xi,Yi)*F1x(Xi,Yi) + F1(Xi,Yi)*F2x(Xi,Yi))/Jac;
        
        % Calculate New Point
        Xp1 = Xi + Delx;
        Yp1 = Yi + Dely;
        
        % Calculate Error
        Errx = Delx/Xi;
        Erry = Dely/Yi;
        
        % Display Values to Screen
        fprintf('\nn = %2.0f, X = %7.4f, Y = %7.4f, ErrX = %2.4f, ErrY = %2.4f', n+m, Xi, Yi, Errx, Erry);

        % If Error is <= 0.001 Plot Point in Red
        if((abs(Errx) <= Err && abs(Erry) <= Err) || Jac == 0)
            Converge = 1;
            break;

        % Else Plot point in Blue, and Reiterate    
        else
            Converge = 0;
            Xi = Xp1;
            Yi = Yp1;
        end
        
    end

    if (abs(X0) <= 5) && (abs(Y0) <= 5)
        % If Point Converges colour it red, otherwise colour it blue
        if(Converge == 1)
            set(plot(X0, Y0), 'Color', 'Red');
        else
            set(plot(X0, Y0), 'Color', 'Blue');
        end
    end
    
end

% Save Image File
saveas(fig2, 'Assignment1-Part2-10053959.jpeg');

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
