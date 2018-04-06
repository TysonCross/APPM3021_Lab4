% APPM3021 Lab 4 Question 2
% Tyson Cross 1239448

clc; clear all; warning off; set(0,'ShowHiddenHandles','on'); delete(get(0,'Children'));
format loose
rng('shuffle');

N = [5,10,20,30];
M = 101;
syms f a;
f(a) = 1/(1+25*a^2);
xq = linspace(-5,5,M)';
max_diff = zeros(1,numel(N));

for i=1:numel(N)
    x{:,i} = linspace(-5,5,N(i))';
    y{:,i} = double(f(x(i)));
    yq{:,i} = NewtonInterp(x{:,i},y{:,i},xq);
end

for i=1:numel(N)
    disp(['i = ',num2str(i)]);
    k=1;
    for j=1:numel(x{:,i})-1
        disp(['j = ',num2str(j)]);
        while k<numel(xq) && xq(k)>=x{:,i}(j) && xq(k)<=x{:,i}(j+1)
            disp(['Evaluating x{:,',num2str(i),'}(',num2str(j),') between ', num2str(x{:,i}(j)),' and ', num2str(x{:,i}(j+1))])
            disp(['xq(',num2str(k),') is ',num2str(xq(k))])
            current_diff = abs(max(abs(y{:,i}(j)))-max(abs(yq{:,i}(k))))
            if current_diff > max_diff(i);
                disp('New max diff')
                max_diff(i) = current_diff;
            end
            k=k+1;
        end
    end
end
disp(' ')

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
        'name','Runge function vs. interplolated values',...
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
    f1 = fplot(variable.(num_ax), f,[min(x{:,i}) max(x{:,i})],...
    'Color',[0.18 0.9 0.18 .5],...                 
	'LineStyle','-',...
	'LineWidth',1);
    hold on

    p1 = plot(variable.(num_ax),x{:,i},y{:,i},...
        'DisplayName','y',...
        'Color',[0.9 0.18 0.18 .5],...                 
        'Linestyle','-',...
        'LineWidth',1.5,...
        'MarkerSize',6,...
        'MarkerFaceColor',[0.18 0.9 0.18],...
        'Marker','x');
    hold on
    
    p2 = plot(variable.(num_ax),xq,yq{:,i},...
        'DisplayName','yq',...
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
        'YLim',[min(yq{:,i}) ceil(max(yq{:,i}))],...
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
                'Position',[0.260797293759768 0.609026492988499 0.105212355212355 0.0818895035093611]);
        case 2
            set(variable.(num_leg),...
                'Position',[0.752591052429539 0.767796055549154 0.184362934362934 0.0818895035093611]);
        case 3
            set(variable.(num_leg),...
                'Position',[0.248249031211505 0.255092594135115 0.105212355212355 0.0818895035093609]);
        case 4
            set(variable.(num_leg),...
                'Position',[0.689555191267665 0.248910213918732 0.105212355212355 0.081889503509361]);
        end
end