% APPM3021 Lab 4 Exercise 3
% Tyson Cross 1239448

clc; clear all;
format loose
rng('shuffle');

%% Calculations
N = 20;
syms f a poly b;
f = @(a)1/3*a.^4 + 2*a.^3 - 5*sin(2*a) + exp(-a/2) - 12;
x = sort(unifrnd(0,5,N,1));
y = double(f(x));
xq = sort(unifrnd(0,5,round(N/2),1));
poly = NewtonInterpPoly(x,y,xq);    % create a symbolic function of the polynomial
yq = poly(xq);                      % evaluate the polynomial at the requested values

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

%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
phi = (1 + sqrt(5))/2;
ratio = phi/3;
offset = [ scr(3)/4 scr(4)/4]; 
fig1 =  figure('Position',...                               % draw figure
        [offset(1) offset(2) scr(3)*ratio scr(4)*ratio]);
set(fig1,'numbertitle','off',...                            % Give figure useful title
        'name','Newton-Gregory Divided Difference Polynomial Interpolation',...
        'Color','white');
fontName='Helvetica';
set(0,'defaultAxesFontName', fontName);                     % Make fonts pretty
set(0,'defaultTextFontName', fontName);
set(groot,'FixedWidthFontName', 'ElroNet Monospace')      

% Axes and labels
ax1 = gca;
box(ax1,'off');
set(ax1,'FontSize',14,...
    'YMinorTick','off',...
    'XMinorTick','off',...
    'TickLabelInterpreter','latex');
hold on
ylabel('y \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);%,...
xlabel('x \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);

% Draw plots
p1 = plot(x,y,...
    'Color',[0.18 0.18 0.9 .6],...                 
	'LineStyle',':',...
	'LineWidth',2,...
    'MarkerSize',6,...
    'Marker','+');
hold on

f1 = fplot(ax1, poly,[min(x) max(x)],...
    'Color',[0.18 0.9 0.18 .5],...                 
	'LineStyle','-',...
	'LineWidth',1);
hold on

% Legend
poly_name = strcat('Polynomial P_{',num2str(length(x)-1),'} (x)');
legend1 = legend({'x vs y',poly_name,},...
     'Location','best',...
     'Position',[0.19 0.7 0.2 0.09],...
     'Box','on');
hold on

% Adjust figure
pos = get(ax1, 'Position');
pos(1) = 0.08;
pos(3) = pos(3)*1.1;
set(ax1, 'Position', pos)
hold off