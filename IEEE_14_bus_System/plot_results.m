%% plot result

% Yu Zheng, 2021, Jan,31

%% Extracting values
time_vec  = out.logsout.getElement('x').Values.Time;

% State vectors
x         = out.logsout.getElement('x').Values.Data; % true states
error_LO  = out.logsout.getElement('error_LO').Values.Data; % error of luenburger

x_hat_LO  = out.logsout.getElement('x_hat_LO').Values.Data; % Observed states (Luenberger)

%% Ploting/Visualization
LW = 1.3;  % linewidth
FS = 15;   % font size

% states estimation error
n_comp = 1;   % number of observes in comparison
n_pres = 5;   % number of states presented
figure (1)
for iter=1:n_pres
    subplot(n_pres,n_comp,1+(iter-1)*n_comp)
    plot(time_vec,x(:,iter),'k-','LineWidth',LW)
    hold on, plot(time_vec,x_hat_LO(:,iter),'r--')
    ylabel(['$$\delta_{' num2str(iter) '}$$'],'FontWeight','bold','Fontsize',FS,'interpreter','latex')
    set(gca,'fontweight','bold','fontsize',12) 
    set(gca,'LineWidth',1)
    legend('Actual', 'Estimated')
end  
   
 
 