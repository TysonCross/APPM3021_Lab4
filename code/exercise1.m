% APPM3021 Lab 4 Exercise 1
% Tyson Cross 1239448

clc; clear all;
format loose
rng('shuffle');

N = 5;
syms f a;
f(a) = 1/3*a.^4 + 2*a.^3 - 5*sin(2*a) + exp(-a/2) - 12;
x = sort(unifrnd(0,5,N,1));
y = double(f(x));
[co, T] = NewtonInterpSimple(x,y);

% Display results
fprintf('% 8s % 8s \n','X','Y')
fprintf('______________________ \n\n')
for i=1:length(x)
	fprintf(' % 8.2f % 8.2f\n',x(i),y(i))
end

% Polynomial output
fprintf('\nP(x) = ')
for i=1:length(co)
    fprintf('%.3f',co(i));
    if i ~=1  
        for j=1:i-1
            fprintf('(x-%.2f)',x(j));
        end
    end
    
    if i~=length(co)
        fprintf(' + ')
    else
        fprintf('\n')
    end
end