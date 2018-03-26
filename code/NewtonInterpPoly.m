function poly = NewtonInterpPoly(x,y,xq)
% NewtonInterpPoly() perorms Newton-Gregory divided difference interpolation,
% using the column vector values for x and y, and query point xq
% Output is a polynomial function of degree n-1 where n is the length of
% the x values

    % x entries are the x values
    % y entries are value at f(x)
    % xq values are the queries for interpolation
	% poly is the resulting polynomial


    [n m] = size(x); % m is the number of data points
    T = zeros(n, n);
    T(:,1) = double(y)';
    for j=2:n
        for i=1:(n-j+1)
            T(i,j) = ( T(i+1,j-1) - T(i,j-1) ) / ( x(i+j-1) - x(i) );
        end
    end
    
    co = T(1,:);
    
    for i=1:length(co)
    if i ==1
        str = strcat('@(b)',num2str(co(i)));
    else
        str = strcat(str,num2str(co(i)));
        for j=1:i-1
            str = strcat(str,'.*(b-',num2str(x(j)),')');
        end
    end
    if i~=length(co)
        str = strcat(str,'+');
    end
    end
    poly = str2func(str);

end


 




