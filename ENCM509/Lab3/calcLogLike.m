function loglike = calcLogLike(arr,N,p,mu,sigma)
% function loglike = calcLogLike(arr,N,p,mu,sigma)
%  
%   Returns a vector of loglike values based on
%   the passed data and the given distribution
%   information. The distribution used is gaussian
%

% Initialize Empty Loglike vector
loglike = zeros(N,1);

% Loop through Array
for i = 1:N
    loglike(i) = gloglike(arr(i), mu, sigma)+log(p);
end