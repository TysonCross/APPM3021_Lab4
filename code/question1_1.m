% APPM3021 Lab 4 Question 1_1
% Tyson Cross 1239448

clc; clear all;
format loose
rng('shuffle');


R = [1101.0;911.3;636.0;451.1;233.5];
T = [25.113;30.131;40.120;50.128;60.136];

[co, Table] = NewtonInterpSimple(R,T);

% Display results
fprintf('% 8s % 8s \n','R(ohm)','T(°C)')
fprintf('______________________ \n\n')
for i=1:length(R)
	fprintf(' % 8.2f % 8.2f\n',R(i),T(i))
end


disp(' ')
disp('Table of divided difference')
disp(T)
disp(' ')
disp('Newton''s polynomial coeffients:')
disp(co)


% Polynomial output
fprintf('\n%dth order polynomial P(x) = ',numel(R))
for i=1:length(co)
    fprintf('%.3f',co(i));
    if i ~=1  
        for j=1:i-1
            fprintf('(x-%.2f)',R(j));
        end
    end
    
    if i~=length(co)
        fprintf(' + ')
    else
        fprintf('\n')
    end
end