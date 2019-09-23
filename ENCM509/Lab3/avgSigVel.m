function arr = avgSigVel(data_arr, N)

% Generate return array
arr = zeros(N, 2);

% Loop through authentic
for i = 1:N
    % Select Signature Sample (and transpose)
    arr_i = data_arr{i};
    
    % Extract Variables of interest
    x_i = arr_i(1,:);
    y_i = arr_i(2,:);
    prs_i = arr_i(3,:);
    time_i = arr_i(4,:);
    
    % Initialize Calculated variables
    xVel_i = zeros(1,max(length(x_i)));
    yVel_i = zeros(1,max(length(y_i)));
    
    % Calculate velocity
    for j=2:max(length(xVel_i))
        xVel_i(j) = (x_i(j)-x_i(j-1))/(time_i(j) - (time_i(j-1)));
        yVel_i(j) = (y_i(j)-y_i(j-1))/(time_i(j) - (time_i(j-1)));
    end
    
    % replace time with newly calculated velocity
    arr_i(4,:) = sqrt(xVel_i.^2 + yVel_i.^2);
    
    % Calculate average pressure and velocity
    arr(i,1) = mean(arr_i(:,3)); % Pressure
    arr(i,2) = mean(arr_i(:,4)); % Velocity    
end
