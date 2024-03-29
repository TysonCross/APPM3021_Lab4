% APPM3021 Lab 4 Exercise 2
% Tyson Cross 1239448

clc; clear all;
format loose
rng('shuffle');

N = 20;
syms f a;
f(a) = 1/3*a.^4 + 2*a.^3 - 5*sin(2*a) + exp(-a/2) - 12;

x = sort(unifrnd(0,5,N,1));
y = double(f(x));
xq = sort(unifrnd(0,5,round(N/2),1));
yq = NewtonInterp(x,y,xq);

% Display results
fprintf('% 8s % 8s    |% 8s % 8s \n','X','Y','XQ','YQ')
fprintf('_____________________________________________ \n\n')
for i=1:length(x)
    if i <= length(xq)
        fprintf(' % 8.2f % 8.2f   |  % 7.2f % 8.2f \n',x(i),y(i),xq(i),yq(i))
    else
        fprintf(' % 8.2f % 8.2f   | \n',x(i),y(i))
    end
end


