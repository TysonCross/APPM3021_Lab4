% APPM3021 Lab4
% Tyson Cross 1239448

clc
clear all

N = 5;

syms y x;
y(x) = x.^6 + 2*x.^3 - x + 1;
% x = randi([0,5],1,N);
x = [1:N]';

% x entries are the x values
% y entries are value at f(x)

[n m] = size(x); % m is the number of data points

T = zeros(n, n);
T(:,1) = double(y(x)');
for j=2:n
    for i=1:(n-j+1)
        T(i,j) = ( T(i+1,j-1) - T(i,j-1) ) / ( x(i+j-1) - x(i) );
    end
end

T
co = T(1,:)

% output

fprintf('P(x) = ')
for i=1:length(co)
    if i ==1
        fprintf('%d',co(i));
    else
        fprintf('%d',co(i));    
        for j=1:i-1
            fprintf('(x-%d)',x(j))
        end
    end
    
    if i~=length(co)
        fprintf(' + ')
    else
        fprintf('\n')
    end
end

