 function yq = NewtonInterp(x,y,xq)
% NewtonInterp() performs Newton-Gregory divided difference interpolation,
% using the column vector values for x and y, and query point xq
% Output is a row vectorcontaining the interpolated y values

    % x entries are the x values
    % y entries are value at f(x)
    % xq values are the queries for interpolation
    % yq values is the resulting interpolated y values


    [n m] = size(x); % m is the number of data points
    T = zeros(n, n);
    T(:,1) = double(y)';
    for j=2:n
        for i=1:(n-j+1)
            T(i,j) = ( T(i+1,j-1) - T(i,j-1) ) / ( x(i+j-1) - x(i) );
        end
    end
    
    co = T(1,:);
    yq = zeros(length(xq),1);
    
    for k=1:length(xq)
        mult = 1;
        sum = 0;
        for i=1:length(co)
            if i==1
                sum = co(i);
            else
                mult = 1;
                for j=1:i-1
                    mult = mult .* ( xq(k) - x(j) );
                end
                sum = sum + co(i) * mult;
            end
        end
        yq(k) = sum;
    end
end


 




