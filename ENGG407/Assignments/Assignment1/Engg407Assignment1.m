% ENGG 407 - Assignment #1 (Matlab Code)
%
% Written By: Kyle Derby MacInnis
% Date: October 15,2012
% Lecture Section: L01
%

% Clear Variables from memory
clear all;

% Select 1000000 Random Numbers
X = random('Normal', -5, 5, [1,1000000]);
Y = random('Normal', -5, 5, [1,1000000]);

%%%%%%%%%%%%%% Z^3 = 1 %%%%%%%%%%%%%%%%%
%
%
% The following substitution is present:
%
% 		Z = (X + iY), i^2 = -1
%
% After Making the Substitution and expanding
% out the equation, the problem can be written
% as the following system of two non-linear
%  equations:

% System of Non-Linear Equations
	F1 = @ (x,y) x^3 + 3*x*y^2 - 1;
	F2 = @ (x,y) 3*y*x^2 - y^3;

% Partial Derivatives of F1
	F1x = @ (x,y) 3*x^2 + 3*y^2;
	F1y = @ (x,y) 6*x*y;

% Partial Derivatives of F2
	F2y = @ (x,y) 3*x^2 - 3*y^2;
	F2x = @ (x,y) 6*x*y;

% Jacobian Determinant
	Jacobian = @ (x,y) F1x(x,y)*F2y(x,y) - F1y(x,y)*F2x(x,y);

% Do 100000 Selections
for i = 1:1000000

    % Pick A Random Point with X and Y betwen -5 and 5
	Xi = X(i);
   	Yi = Y(i);

	X0 = Xi;
	Y0 = Yi;
   
    % Apply Newton's Method with 10 iterations
    for j = 1:20
        
        % Find Jacobian Determinant
        J = Jacobian(Xi,Yi);
        
        % Find Change in X and Y
        Delx = (-F1(Xi,Yi)*F2y(Xi,Yi) + F2(Xi,Yi))/J;
        Dely = (-F2(Xi,Yi)*F1x(Xi,Yi) + F1(Xi,Yi)*F2x(Xi,Yi))/J;
        
        % Calculate Next Point
        Xip = Xi + Delx;
        Yip = Yi + Dely;

        % Calculate Error
        Err = 0.001;
        Errx = abs(Delx/Xi);
        Erry = abs(Dely/Yi);

        % Create Figure and Plot Points
        f1 = figure(1);
        hold all;
        

        % Disregard any Values which are outside of [(-5,-5),(5,5)]
        if(Xi <= 5 && Xi >= -5 && Yi >= -5 && Yi <= 5)

            % Print out Values to screen
            fprintf('\ni=%2.0f, X=%-7.4f, Y=%-7.4f, ErrX = %-2.4f, ErrY = %-2.4f', i,Xi,Yi, Errx, Erry);            
            
            % If error is small Plot Point in Green
            if(Errx <= Err && Erry <= Err)
                set(plot(X0, Y0), 'Color', 'Green');
                break;
                
            % Otherwise just plot it in Red   
            else
                set(plot(X0, Y0), 'Color', 'Red');
                
                % Update New Values and reiterate
                Xi = Xip;
                Yi = Yip;

            end

        end

    end

end

%Save Image File of Plot
saveas(f1, 'Assignment1-Part1-10053959.jpeg');

% Clear up Space in Memory
clear all;

% Select 1000000 Random Numbers
X = random('Normal', -5, 5, [1,1000000]);
Y = random('Normal', -5, 5, [1,1000000]);

%%%%%%%%%%%%%%%% Z^5 = 1 %%%%%%%%%%%%%%%%%%%%
%
%
% The following substitution is present:
%
% 		Z = (X + iY), i^2 = -1
%
% After Making the Substitution and expanding
% out the equation, the problem can be written
% as the following system of two non-linear
% equations:

% System of Non-Linear Equations
F1_2 = @ (x,y) x^5 - 10*(x^3)*(y^2) + 5*x*(y^4) - 1;
F2_2 = @ (x,y) 5*(x^4)*y - 10*(x^2)*(y^3) + (y^5);

% Partial Derivatives of F1
F1x_2 = @ (x,y) 5*x^4 + 30*(x^2)*(y^2) + 5*(y^4);
F1y_2 = @ (x,y) -20*(x^3)*y + 20*x*(y^3);

% Partial Derivatives of F2
F2y_2 = @ (x,y) 5*(x^4) - 30*(x^2)*(y^2) + 5*(y^4);
F2x_2 = @ (x,y) 20*(x^3)*y - 20*(y^3)*x;

% Jacobian Determinant
Jacobian2 = @ (x,y) F1x_2(x,y)*F2y_2(x,y) - F1y_2(x,y)*F2x_2(x,y);

% Do 1000000 Selections
for i = 1:1000000

    % Pick A Random Point with X and Y betwen -5 and 5
    Xi_2 = X(i);
    Yi_2 = Y(i);

    % Apply Newton's Method
    for j = 1:20
        
        % Find Jacobian Determinant
        J_2 = Jacobian2(Xi_2,Yi_2);
        
        % Find Change in X and Y
        Delx_2 = (-F1_2(Xi_2,Yi_2)*F2y_2(Xi_2,Yi_2) + F2_2(Xi_2,Yi_2))/J_2;
        Dely_2 = (-F2_2(Xi_2,Yi_2)*F1x_2(Xi_2,Yi_2) + F1_2(Xi_2,Yi_2)*F2x_2(Xi_2,Yi_2))/J_2;
        
        % Calculate Next Point
        Xip_2 = Xi_2 + Delx_2;
        Yip_2 = Yi_2 + Dely_2;

        % Calculate Error
        Err_2 = 0.001;
        Errx_2 = abs(Delx_2/Xi_2);
        Erry_2 = abs(Dely_2/Yi_2);

        % Create Figure
        f2 = figure(2);
        hold all;
        

        % Disregard any Values beyond scope
        if(Xi_2 <= 5 && Xi_2 >= -5 && Yi_2 >= -5 && Yi_2 <= 5)

            % Print out Values
            fprintf('\ni=%2.0f, X=%-7.4f, Y=%-7.4f, ErrX = %-2.4f, ErrY = %-2.4f', (i + (j-1)*5),Xi_2,Yi_2, Errx_2, Erry_2);            
            
            % If error is small Plot Point in Green
            if(Errx_2 <= Err_2 && Erry_2 <= Err_2)
                set(plot(Xi, Yi), 'Color', 'Green');
                break;
                
            % Otherwise just plot it in Red    
            else
                set(plot(Xi, Yi), 'Color', 'Red');
                
                % Update New Values
                Xi_2 = Xip_2;
                Yi_2 = Yip_2;

            end

        end

    end

end

%Save Image
saveas(f2, 'Assignment1-Part2-10053959');
