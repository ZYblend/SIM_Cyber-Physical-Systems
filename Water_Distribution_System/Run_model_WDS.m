%% Run model for simulation (with attack detection and localization)
% Description: This file is to prepare simulation parameters 
%              In this simulation, four scenarios are compared:
% Content:
%         1. load system
%         2. parameters for sample-based moving-horizon FDIA
%         3. Parameters for MLPs and Pruning algorithm
%
% Yu Zheng, RASLab, FAMU-FSU College of Engineering, Tallahassee, 2021, Aug.
clear all
clc


%% water tank system model matrices
T_sample = 0.01;

A_bar_d = readmatrix('A_bar_d.csv');
B_bar_d = readmatrix('B_bar_d.csv');
C_obsv_d = readmatrix('C_obsv_d.csv');
D_obsv_d = readmatrix('D_obsv_d.csv');


[n_states,n_int] = size(B_bar_d);
n_meas = size(C_obsv_d,1);

Cm = ones(1,n_states);
n_critical = size(Cm,1);

k0 = 42;   % lower bound of number of measurements for which the system remain full observability

%% T time horizon
T = round(2*n_states);
[H0_full,H1_full,F] = opti_params(A_bar_d,B_bar_d,C_obsv_d,T);
% H0: state-ouput linear map                      [n_meas*T-by-n_states]
% H1:  input-output linear map                     [n_meas*T-by-n_int*(T-1)]
% F: Observer input-state propagation matrix      [n_meas-by-n_int*(T-1)]


%% Observer Dynamics for attack-free case
H0_full_pinv = pinv(H0_full,0.001);
Ly = A_bar_d.'*H0_full_pinv;
Lu = F-A_bar_d.'*H0_full_pinv*H1_full;
% A_T = A_bar_d^T;

% residual
H0_full_pinv = pinv(H0_full,0.001);
H0_perp_full = eye(size(H0_full,1)) - H0_full*H0_full_pinv;


%% Gain Controller
Pc = linspace(0.1,0.2, n_states);
K = place(A_bar_d,B_bar_d,Pc);
% disp('discrete controller (A-B*K) eigenvalues: less than 1?')
% disp(eig(A_bar_d-B_bar_d*K).')


%% Simulation Initialization
% state initialization
x0          = zeros(n_states,1);
x0_hat      = zeros(n_states,1);
xd          = linspace(20,50,n_states)';

yc_d = Cm*xd;

% Delay tape initialization
Q0          = ones(n_meas,T);    % initial support: all safe
Y0          = zeros(n_meas,T);
U0          = zeros(n_int,T+1);

offset = -inv(B_bar_d)*(A_bar_d-eye(n_states))*xd;

%% runing parameters
N_samples      = 800;                % The total number of samples to run
T_final        = N_samples*T_sample;  % Total time for simulation (20s)
T_start_opt(:)    = 1.5*T*T_sample;  % start time for moving-horizon estimation

