% APPM3021 Lab 4 Exercise 3
% Tyson Cross 1239448

clc; clear all;
format loose
rng('shuffle');

%% Calculations
N = 20;
syms f a;
f = @(a) 1/3*a.^4 + 2*a.^3 - 5*sin(2*a) + exp(-a/2) - 12;
x = sort(unifrnd(0,5,N,1));
y = double(f(x));
xq = sort(unifrnd(0,5,round(N/2),1));
yq = NewtonInterp(x,y,xq);

% Display results
T1 = table (x, y);
T1.Properties.VariableNames = {'X','Y'};
disp(T1)
disp(' ')
T2 = table (xq, yq);
T2.Properties.VariableNames = {'XQ','YQ'};
disp(T2)

%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
phi = (1 + sqrt(5))/2;
ratio = phi/3;
offset = [ scr(3)/4 scr(4)/4]; 
fig1 =  figure('Position',...                               % draw figure
        [offset(1) offset(2) scr(3)*ratio scr(4)*ratio]);
set(fig1,'numbertitle','off',...                            % Give figure useful title
        'name','Newton-Gregory Divided Difference Interpolation',...
        'Color','white');
fontName='Helvetica';
set(0,'defaultAxesFontName', fontName);                     % Make fonts pretty
set(0,'defaultTextFontName', fontName);
set(groot,'FixedWidthFontName', 'ElroNet Monospace')      

% Draw plots

p1 = plot(x,y,...
    'Color',[0.9 0.18 0.18 .6],...                 
	'LineStyle','-',...
	'LineWidth',1,...
    'MarkerSize',6,...
	'MarkerFaceColor',[0.9 0.18 0.18],...
    'Marker','o');
hold on
p2 = plot(xq,yq,...
    'Color',[0.18 0.9 0.18 .6],...                 
	'LineStyle',':',...
	'LineWidth',2,...
    'MarkerSize',6,...
	'MarkerFaceColor',[0.18 0.9 0.18],...
    'Marker','+');
hold on

% Axes and labels
ax1 = gca;;
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
% Legend
legend1 = legend({'x vs y','xq vs yq (interpolated values)'},...
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