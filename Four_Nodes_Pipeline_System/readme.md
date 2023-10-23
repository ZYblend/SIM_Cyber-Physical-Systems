# Networked Pipeline System
(Four nodes pipeline example)

```
Four_Nodes_Pipeline_System/
├── myMeasurementFcn.m       // measurement model (for UKF)
├── myStateTransitionFcn.m   // state transition model (for UKF)
├── pipline_system.slx       // Simulink model of the network pipeline system simulation
├── plot_result.m            // Plot simulation result
├── quad_prog_solver.m       // quandratic programming solver for the MPC controller
├── run_pipeline_system.m    // Run file: load all simulation parameters
```

## How to Run
- run `run_pipeline_system.m`
- run `pipline_system.slx`
- run `plot_result.m`

## System Model
![image](https://github.com/ZYblend/SIM_Cyber-Physical-Systems/assets/36635562/e73e9972-1b62-46d3-91c8-952541325b00)


## Simulation Result
![image](https://github.com/ZYblend/SIM_Cyber-Physical-Systems/assets/36635562/14b2bb90-ca60-49ef-a348-74b923d1b3f8)

## Papers
[1] Zheng, Yu, and Olugbenga Moses Anubi. "Data-driven Vulnerability Analysis of Networked Pipeline System." 2023 IEEE Conference on Control Technology and Applications (CCTA). IEEE, 2023.
