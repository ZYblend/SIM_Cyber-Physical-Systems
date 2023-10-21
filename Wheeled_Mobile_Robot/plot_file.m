%% Extracting values
time_vec  = out.logsout.getElement('x').Values.Time;

% State vectors
x         = out.logsout.getElement('x').Values.Data; 
y         = out.logsout.getElement('y').Values.Data;
theta         = out.logsout.getElement('theta').Values.Data;

% estimated
v         = out.logsout.getElement('v_estimated').Values.Data;
w         = out.logsout.getElement('w_estimated').Values.Data;

% target
xd         = out.logsout.getElement('x_target').Values.Data; 
yd         = out.logsout.getElement('y_target').Values.Data;
thetad         = out.logsout.getElement('theta_target').Values.Data;
vd         = out.logsout.getElement('desired_v').Values.Data;
wd         = out.logsout.getElement('desired_w').Values.Data;


% plot
LW = 1.3;  % linewidth
FS = 15;   % font size

figure
plot(xd,yd,'k-','LineWidth',LW)
hold on,
plot(x,y,'r--')
ylabel('y','FontWeight','bold','Fontsize',FS)
xlabel('x','FontWeight','bold','Fontsize',FS)
legend('Desired','Actual')
set(gca,'fontweight','bold','fontsize',FS) 
set(gca,'LineWidth',1)

figure
subplot(1,2,1)
plot(time_vec(time_vec<8),vd(time_vec<8),'k-','LineWidth',LW)
hold on,
plot(time_vec(time_vec<8),v(time_vec<8),'r--')
legend('Desired','Estimated')
ylabel('v','FontWeight','bold','Fontsize',FS)
xlabel('Time','FontWeight','bold','Fontsize',FS)
set(gca,'fontweight','bold','fontsize',FS) 
set(gca,'LineWidth',1)

subplot(1,2,2)
plot(time_vec(time_vec<8),wd(time_vec<8),'k-','LineWidth',LW)
hold on,
plot(time_vec(time_vec<8),w(time_vec<8),'r--')
legend('Desired','Estimated')
ylabel('\omega','FontWeight','bold','Fontsize',FS)
xlabel('Time','FontWeight','bold','Fontsize',FS)
set(gca,'fontweight','bold','fontsize',FS) 
set(gca,'LineWidth',1)

