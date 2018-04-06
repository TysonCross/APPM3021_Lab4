% APPM3021 Lab 4 Question 3
% Tyson Cross 1239448

clc; clear all; warning off; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));
format loose
rng('shuffle');

N = [10,20,30];
M = 101;
syms f a;
f(a) = log(a);
xq = linspace(1,10,M)';
max_diff = zeros(1,numel(N));

for i=1:numel(N)
    x{:,i} = linspace(1,10,N(i))';
    y{:,i} = double(f(x(i)));
    yq{:,i} = NewtonInterp(x{:,i},y{:,i},xq);
    for j=1:numel(y{:,i})
        for k=1:numel(yq{:,i})
            current_diff = abs(max(abs(y{:,i}(j)))-max(abs(yq{:,i}(k))))
            if current_diff > max_diff(i);
                max_diff(i) = current_diff;
            end
        end
    end
end

% Display results
fprintf('Max Differences \n')
fprintf('________________\n\n')
for i=1:length(max_diff)
fprintf('n = %2d   Max difference = %.3f \n\n',N(i),max_diff(i))
end

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
ax1 = gca;

% Draw plots
linS = {'--',':','-.'};

for i=1:numel(N)
    num_ax = strcat('ax',num2str(i));
    
    variable.(num_ax) = subplot(2,2,i);
    f1 = fplot(variable.(num_ax), f,[min(x{:,i}) max(x{:,i})],...
    'Color',[0.18 0.9 0.18 .2],...                 
	'LineStyle','-',...
	'LineWidth',1);
    hold on

    p1 = plot(variable.(num_ax),xq,yq{:,i},...
        'DisplayName',strcat('N=',num2str(N(i)),' (interpolated values)'),...
        'Linestyle',linS{mod(i,numel(linS))+1},...
        'LineWidth',1.5);
    hold on
    
%     Axes and labels
    box(variable.(num_ax),'off');
    set(variable.(num_ax),'FontSize',14,...
        'YMinorTick','off',...
        'XMinorTick','off',...
        'XTick',[0:10],...
        'TickLabelInterpreter','latex');
    hold on
    ylabel('y \rightarrow',...
        'FontName',fontName,...
        'FontSize',14);%,...
    xlabel('x \rightarrow',...
        'FontName',fontName,...
        'FontSize',14);
    
    % Legend
    legend1 = legend('show');
    set(legend1,...
         'Location','best',...
         'Box','off');
    hold on
    if i==2
        set(legend1,...
         'Position',[0.669579469417956 0.694762736105913 0.184362934362934 0.0579406864453027]);
    end
end




% % Adjust figure
% pos = get(ax1, 'Position');
% pos(1) = 0.08;
% pos(3) = pos(3)*1.1;
% set(ax1, 'Position', pos)
% set(ax2, 'Position', pos)
% set(ax3, 'Position', pos)
% set(ax4, 'Position', pos)
% hold off