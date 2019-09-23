%% For Step 6
% Create Piecewise Magnitude Response - F(m)
function F = F(m, km, fdmax, Ts_, M_)
    if ( m == 1 )
        F = 0;
    elseif (( m >= 2 ) && ( m <= km ))
        F = (sqrt(0.5/(sqrt(1 - ((m-1)/(M_*Ts_*fdmax))^2))));
    elseif ( m == (km + 1) )
        F = (sqrt((km/2)*((pi/2) - atan((km-1)/(sqrt(2*km -1))))));
    elseif (( m >= (km + 2) ) && ( m <= (M_ - km) ))
        F = 0;
    elseif ( m == (M_ - km + 1) )
        F = (sqrt((km/2)*((pi/2) - atan((km -1)/(sqrt(2*km -1))))));
    elseif (( m >= (M_ - km + 2) ) && ( m <= M_ ))
        F = (sqrt(0.5/(sqrt(1 - ((M_ - (m-1))/(M_*Ts_*fdmax))^2))));
    else
        F = NaN;
    end
end