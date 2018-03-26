 function [co,T] = NewtonInterp(x,y)
% NewtonInterp() perorms Newton-Gregory divided difference interpolation,
% using the column vector values for x and y, and returns a row vector
% containing the polynomial coefficient values in 'co' and the table of
% differences in matrix T

    % x entries are the x values
    % y entries are value at f(x)

    [n m] = size(x); % m is the number of data points
    T = zeros(n, n);
    T(:,1) = double(y)';
    for j=2:n
        for i=1:(n-j+1)
            T(i,j) = ( T(i+1,j-1) - T(i,j-1) ) / ( x(i+j-1) - x(i) );
        end
    end
    co = T(1,:);
end



