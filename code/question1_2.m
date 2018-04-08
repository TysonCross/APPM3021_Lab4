% APPM3021 Lab 4 Question 1_2
% Tyson Cross 1239448

clc; clear all;
format loose
format long
rng('shuffle');

R = [1101.0;911.3;636.0;451.1;233.5];
T = [25.113;30.131;40.120;50.128;60.136];

Rq = [1050.1;901.56;875.11;545.27;333.1;200];

[co, Table] = NewtonInterpSimple(R,T);
Tq = NewtonInterp(R,T,Rq);

% Display results
fprintf('% 8s % 8s    |% 8s % 8s \n','R(ohm)','T(°C)','Rq','Tq')
fprintf('_____________________________________________ \n\n')
for i=1:length(T)
    if i <= length(Rq)
        fprintf(' % 8.2f % 8.2f   |  % 8.2f % 8.2f \n',R(i),T(i),Rq(i),Tq(i))
    else
        fprintf(' % 8.2f % 8.2f   | \n',T(i),T(i))
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
        'name','Question 1. 2)',...
        'Color','white');
fontName='Helvetica';
set(0,'defaultAxesFontName', fontName);                     % Make fonts pretty
set(0,'defaultTextFontName', fontName);
set(groot,'FixedWidthFontName', 'ElroNet Monospace')      

% Draw plots

p1 = plot(T,R,...
    'DisplayName','R vs T',...
    'Color',[0.9 0.18 0.18 .6],...                 
	'LineStyle','-',...
	'LineWidth',1,...
    'MarkerSize',6,...
	'MarkerFaceColor',[0.18 0.9 0.18],...
    'Marker','+');
hold on
p2 = plot(Tq,Rq,...
	'DisplayName','Rq vs Tq (interpolated values)',...
    'Color',[0.18 0.9 0.18 .6],...                 
	'LineStyle',':',...
	'LineWidth',2,...
    'MarkerSize',6,...
	'MarkerFaceColor',[0.18 0.9 0.18],...
    'Marker','o');
hold on

% Axes and labels
ax1 = gca;;
box(ax1,'off');
set(ax1,'FontSize',14,...
    'YMinorTick','off',...
    'XMinorTick','off',...
    'TickLabelInterpreter','latex');
hold on
ylabel('R \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);%,...
xlabel('T \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);
% Legend
legend1 = legend(ax1,'show');
set(legend1,...
     'Location','best',...
     'Position',[0.602162162162162 0.788098918083462 0.2 0.09],...
     'Box','on');
hold on

% Adjust figure
pos = get(ax1, 'Position');
pos(1) = 0.08;
pos(3) = pos(3)*1.1;
set(ax1, 'Position', pos)
hold off
