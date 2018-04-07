% APPM3021 Lab 4 Question 3
% Tyson Cross 1239448

clc; clear all;
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
end

for i=1:numel(N)
    k=1;
    for j=1:numel(x{:,i})-1
        while k<numel(xq) && xq(k)>=x{:,i}(j) && xq(k)<=x{:,i}(j+1)
            current_diff = abs(max(abs(y{:,i}(j)))-max(abs(yq{:,i}(k))));
            if current_diff > max_diff(i);
                max_diff(i) = current_diff;
            end
            k=k+1;
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
        'name','Question 3',...
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
    num_leg = strcat('legend',num2str(i));
    
    variable.(num_ax) = subplot(2,2,i);

    p1 = plot(variable.(num_ax),x{:,i},y{:,i},...
        'DisplayName','y',...
        'Color',[0.9 0.18 0.18 0.35],...                 
        'Linestyle','-',...
        'LineWidth',1.5,...
        'MarkerSize',6,...
        'MarkerFaceColor',[0.18 0.9 0.18],...
        'Marker','x');
    hold on
    
    p2 = plot(variable.(num_ax),xq,yq{:,i},...
        'DisplayName',strcat('yq (interpolated values)'),...
        'Color',[0.18 0.18 0.9 .5],...                 
        'Linestyle',linS{mod(i,numel(linS))+1},...
        'LineWidth',1.5);
    hold on
    
    % Axes and labels
    box(variable.(num_ax),'off');
    set(variable.(num_ax),'FontSize',14,...
        'YMinorTick','off',...
        'XMinorTick','off',...
        'XTick',x{:,1},...
        'YLim',[min(y{:,i}) ceil(max(y{:,i}))],...
        'TickLabelInterpreter','latex');
    hold on
    ylabel('y \rightarrow',...
        'FontName',fontName,...
        'FontSize',14);%,...
    xlabel('x \rightarrow',...
        'FontName',fontName,...
        'FontSize',14);
    title(strcat('N=',num2str(N(i))),...
        'FontName',fontName,...
        'FontSize',14);
    
    % Legend
    variable.(num_leg) = legend('show');
    set(variable.(num_leg),...
         'Location','best',...
         'Box','off');
    hold on
    
        switch i
        case 1
            set(variable.(num_leg),...
                'Position',[0.277746799538157 0.648487789608799 0.16457528957529 0.0533054315296785]);
        case 2
            set(variable.(num_leg),...
                'Position',[0.729670720212078 0.65930695498747 0.16457528957529 0.0533054315296785]);
        case 3
            set(variable.(num_leg),...
                'Position',[0.289329811121169 0.188560935793336 0.16457528957529 0.0533054315296784]);
         end

end

ax4 = subplot(2,2,4);

f1 = fplot(ax4, f,[min(x{:,i}) max(x{:,i})],...
    'DisplayName','ln(x)',...
    'Color',[0.18 0.9 0.18 .2],...                 
	'LineStyle','-',...
	'LineWidth',2);
    hold on
    
        % Axes and labels
    box(ax4,'off');
    set(ax4,'FontSize',14,...
        'YMinorTick','off',...
        'XMinorTick','off',...
        'XTick',x{:,1},...
        'YLim',[min(y{:,i}) ceil(max(y{:,i}))],...
        'TickLabelInterpreter','latex');
    hold on
    ylabel('y \rightarrow',...
        'FontName',fontName,...
        'FontSize',14);%,...
    xlabel('x \rightarrow',...
        'FontName',fontName,...
        'FontSize',14);
    title('log(x)',...
        'FontName',fontName,...
        'FontSize',14);

