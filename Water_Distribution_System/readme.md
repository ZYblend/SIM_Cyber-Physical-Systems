# Water Distribution System
(11 water tank system)

```
Water_Distribution_System/
├── A_bar_d, B_bar_d,C_obsv_d, D_obsv_d.csv   // System dynammical Parameters
├── Run_model_WDS.m                           // run file: prepare simulation parameters
├── WDS.slx                                   // Simulink file of simulation
├── opti_params.m                             // prepare horizontal parameters (for state estimator)
├── plot_results.m                            // plot simulation results
```
## How to Run
- run `Run_model_WDS.m `
- run `WDS.slx`
- run `plot_results.m`

## System Model
![image](https://github.com/ZYblend/SIM_Cyber-Physical-Systems/assets/36635562/0ebb1432-bc08-4856-bc3a-6e3e5913845b)
![image](https://github.com/ZYblend/SIM_Cyber-Physical-Systems/assets/36635562/ff7ddadb-31c2-4248-b236-7f50d1e8f097)


## Simulation Result
![image](https://github.com/ZYblend/SIM_Cyber-Physical-Systems/assets/36635562/ce490503-a7d4-4f57-bcec-34a8e3d17a9b)


## Papers
[1] Zheng, Yu, et al. "Robust Resilient Signal Reconstruction under Adversarial Attacks." 2023 American Control Conference (ACC). IEEE, 2023.

[2] Zheng, Yu, and Olugbenga Moses Anubi. "Resilient Observer Design for Cyber-Physical Systems with Data-Driven Measurement Pruning." Security and Resilience in Cyber-Physical Systems: Detection, Estimation and Control. Cham: Springer International Publishing, 2022. 85-117.
