%  ENGG 407 Assignment 3
% 
%   Kyle Derby MacInnis
%    December 5, 2012
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Comments:
%
%  Based on the variety of the results it would appear that this function
%  is very sporadic and thus it is hard to fully resolve it unless you have
%  a large about of precision. In addition, the second integrand used, with
%  the decimal point, suddenly brought the result way down. It seems to
%  have a much different form the the 1/3 method.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assignment Main Function
%%%%%%%%%%%%%%%%%%%%%%%%%%

function [TotalSum1_13, TotalSum1_38, TotalSum2_13, TotalSum2_38, TotalSum3_13, TotalSum3_38] = ENGG407Assignment3()

    %Section 1
    
    % 1/3 Method  (ans = 0.0693)
    TotalSum1_13 = MySimpson_1_3(5,9,10000);
    % 3/8 Method  (ans = 0.1543)
    TotalSum1_38 = MySimpson_3_8(5,9,9999);
    
    % Section 2
    
    % 1/3 Method  (ans = -3.3125)
    TotalSum2_13 = MySimpson_1_3(15,19,10000);
    % 3/8 Method  (ans = 0.8889)
    TotalSum2_38 = MySimpson_3_8(15,19,9999);
    
    % Section 3
    
    % 1/3 Method (ans = -0.0044)
    TotalSum3_13 = MySimpson_1_3_SecondInt(5,9,10000);
    % 3/8 Method (ans = -0.1028)
    TotalSum3_38 = MySimpson_3_8_SecondInt(5,9,9999);

end


% Algorithm Functions
%%%%%%%%%%%%%%%%%%%%%

% Function to integrate (Section 1&2)
function y = myFun(x)

    y = 1/(sin(pi*x)^2 + sin(77*pi/x)^2);

end

% Function to integrate (Section 3)
function y = myFun2(x)

    y = 1/(sin(pi*x)^2 + sin(77.1*pi/x)^2);

end


% Form Coefficient Matrix (All Sections)
function A = MakeSys(X,n)

    A = zeros(n:n);

    for i = 1:n
   
        for j = 1:n
                    
            A(i,j) = X(i)^(n-j);
        
        end
    
    end
    
end

% Integrated Function (1/3 Method)
function intY = myIntFun(a,b,c,x)

    intY = (a/3)*(x)^3 + (b/2)*(x)^2 + c*(x);

end

% System of Equations to Solve (1/3 Method)
function [a,b,c] = SolveSys(A,Y)

    Coeffs = linsolve(A,Y);
    a = 1;
    b = Coeffs(2)/Coeffs(1);
    c = Coeffs(3)/Coeffs(1);

end

% Simpson Method 1/3 (For Section 1 & 2)
function Summation = MySimpson_1_3(a,b,d)

    % Subinterval and Answer Initialization
    Interval = linspace(a,b,d+1);
    Summation = 0;

    % Loop through all intervals
    for i=1:2:(d)
    
        % Get X values
        x1 = Interval(i);
        x2 = Interval(i+1);
        x3 = Interval(i+2);
        
        % Build System Vectors
        X = [x1, x2, x3];
        Y = [myFun(x1); myFun(x2); myFun(x3)];
        
        % Build System Matrix
        A = MakeSys(X,3);
        
        % Solve for system coefficients
        [a, b, c] = SolveSys(A,Y);
        
        % Sum each subinterval's approximate integral
        Summation = Summation + myIntFun(a,b,c,x3) - myIntFun(a,b,c,x1);
    
    end

end



% Integrated Function (3/8 Method)
function intY = myIntFun2(a,b,c,d,x)

    intY = (a/4)*(x)^4 + (b/3)*(x)^3 + (c/2)*(x)^2 + d*x;

end


% System of Equations to Solve (3/8 Method)
function [a,b,c,d] = SolveSys2(A,Y)

    Coeffs = linsolve(A,Y);
    a = 1;
    b = Coeffs(2)/Coeffs(1);
    c = Coeffs(3)/Coeffs(1);
    d = Coeffs(4)/Coeffs(1);

end

% Simpson Method 3/8 (For Section 1 & 2)
function Summation = MySimpson_3_8(a,b,d)

    % Subinterval and Answer Initialization
    Interval = linspace(a,b,d+1);
    Summation = 0;

    for i=1:3:(d)
    
        % Get X values
        x1 = Interval(i);
        x2 = Interval(i+1);
        x3 = Interval(i+2);
        x4 = Interval(i+3);
        
        % Build System Vectors
        X = [x1, x2, x3, x4];
        Y = [myFun(x1); myFun(x2); myFun(x3); myFun(x4)];
        
        % Build System Matrix
        A = MakeSys(X,4);
        
        % Solve for system coefficients
        [a, b, c, d] = SolveSys2(A,Y);
        
        % Sum each subinterval's approximate integral
        Summation = Summation + myIntFun2(a,b,c,d,x3) - myIntFun2(a,b,c,d,x1);
    
    end

end

% Simpson Method 1/3 (For Section 3 - Changed integrand)
function Summation = MySimpson_1_3_SecondInt(a,b,d)

    % Subinterval and Answer Initialization
    Interval = linspace(a,b,d+1);
    Summation = 0;

    for i=1:2:(d)
    
        % Get X values
        x1 = Interval(i);
        x2 = Interval(i+1);
        x3 = Interval(i+2);
        
        % Build System Vectors
        X = [x1, x2, x3];
        Y = [myFun2(x1); myFun2(x2); myFun2(x3)];
        
        % Build System Matrix
        A = MakeSys(X,3);
        
        % Solve for system coefficients
        [a, b, c] = SolveSys(A,Y);
        
        % Sum each subinterval's approximate integral
        Summation = Summation + myIntFun(a,b,c,x3) - myIntFun(a,b,c,x1);
    
    end

end


% Simpson Method 3/8 (For Section 3 - Second Integrand)
function Summation = MySimpson_3_8_SecondInt(a,b,d)

    % Subinterval and Answer Initialization
    Interval = linspace(a,b,d+1);
    Summation = 0;

    for i=1:3:(d)
    
        % Get X values
        x1 = Interval(i);
        x2 = Interval(i+1);
        x3 = Interval(i+2);
        x4 = Interval(i+3);
        
        % Build System Vectors
        X = [x1, x2, x3, x4];
        Y = [myFun2(x1); myFun2(x2); myFun2(x3); myFun2(x4)];
        
        % Build System Matrix
        A = MakeSys(X,4);
        
        % Solve for system coefficients
        [a, b, c, d] = SolveSys2(A,Y);
        
        % Sum each subinterval's approximate integral
        Summation = Summation + myIntFun2(a,b,c,d,x3) - myIntFun2(a,b,c,d,x1);
    
    end

end