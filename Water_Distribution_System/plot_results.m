%% Creating visualization and plotting results for the simulation

% Yu Zheng, 2022/09/28


%% Extracting values
time_vec  = out.logsout.getElement('x').Values.Time;

% State vectors
x         = out.logsout.getElement('x').Values.Data; % true states
x_hat  = out.logsout.getElement('x_hat').Values.Data; % Observed states (Moving-horizon Least square Observer)


LW = 1.3;  % linewidth
FS = 15;   % font size

% states estimation error
n_pres = n_states;   % number of states presented
figure (1)
for iter=1:n_pres
    subplot(n_pres/2,2,iter)
    plot(time_vec,xd(iter)*ones(size(x,1),1),'k-','LineWidth',LW)
    hold on, plot(time_vec,x_hat(:,iter),'r--')
    ylabel(['$$x_{' num2str(iter) '}$$'],'FontWeight','bold','Fontsize',FS,'interpreter','latex')
    set(gca,'fontweight','bold','fontsize',12) 
    set(gca,'LineWidth',1)
    ylim([0,70])
    legend('Actual', 'Estimated')
end  